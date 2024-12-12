package tests

import (
	"crypto/rand"
	"encoding/json"
	"fmt"
	"math/big"
	"testing"

	"github.com/99designs/gqlgen/client"
	"github.com/stretchr/testify/require"
)

func TestToken(t *testing.T) {
	c := client.New(NewServer())
	num, _ := rand.Int(rand.Reader, big.NewInt(1000000000))
	accessToken := fmt.Sprintf("%d", num.Int64())
	refreshToken := fmt.Sprintf("%d", num.Int64())
	//user := CreateUserAndLogin(t, c)
	t.Run("Refresh Token", func(t *testing.T) {
		var createResponse struct {
			Token struct {
				ID                 string
				User               string
				AccessToken        string
				RefreshToken       string
				AccessTokenExpiry  string
				RefreshTokenExpiry string
				Device             string
				CreatedAt          string
				UpdatedAt          string
			}
		}
		err := c.Post(`mutation refresh_token($accessToken: String!, $refreshToken: String!){
			refreshToken(
				accessToken: $accessToken,
				refreshToken: $refreshToken,
				device: "PC"
			) {
				accessToken,
				refreshToken,
				device
			}
		}`, &createResponse, client.Var("accessToken", accessToken), client.Var("refreshToken", refreshToken))
		if err != nil {
			println("Errors:")
			println(err.Error())
			println("End of errors")
		}
		//require.NotEmpty(t, createResponse.Token.Device)

		// Use the valid tokens to refresh the token
		var newTokenResponse struct {
			RefreshToken struct {
				AccessToken  string
				RefreshToken string
			}
		}

		// Test invalid tokens (using tokens that don't exist in the database)
		var errMsg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		err = c.Post(`mutation refresh_token{
			refreshToken(
				accessToken: "invalid_access_token"
				refreshToken: "invalid_refresh_token"
				device: "test_device"
			) {
				accessToken
				refreshToken
			}
		}`, &newTokenResponse, client.AddHeader("Authorization", newTokenResponse.RefreshToken.AccessToken))
		json.Unmarshal(json.RawMessage(err.Error()), &errMsg)
		require.Equal(t, "token not found", errMsg[0].Message)

		// Test missing token parameters (both access and refresh tokens empty)
		err = c.Post(`mutation refresh_token{
			refreshToken(
				accessToken: ""
				refreshToken: ""
				device: "test_device"
			) {
				accessToken
				refreshToken
			}
		}`, &newTokenResponse, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", newTokenResponse.RefreshToken.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &errMsg)
		require.Equal(t, "token not found", errMsg[0].Message)
		// Ensure that no duplicate tokens exist by checking the database or ensuring old token is deleted.
	})
	// t.Run("Refresh Token Logic", func(t *testing.T) {
	// 	var refreshResponse struct {
	// 		RefreshToken struct {
	// 			AccessToken  string
	// 			RefreshToken string
	// 			Device       string
	// 		}
	// 	}

	// 	// 调用 refreshToken 测试逻辑
	// 	err := c.Post(`mutation refresh_token($accessToken: String!, $refreshToken: String!, $device: String!){
	//         refreshToken(
	//             accessToken: $accessToken,
	//             refreshToken: $refreshToken,
	//             device: $device
	//         ) {
	//             accessToken
	//             refreshToken
	//             device
	//         }
	//     }`, &refreshResponse,
	// 		client.Var("accessToken", accessToken),
	// 		client.Var("refreshToken", refreshToken),
	// 		client.Var("device", "PC"),
	// 	)
	// 	require.NoError(t, err)

	// 	// 检查新生成的 Token
	// 	require.NotEmpty(t, refreshResponse.RefreshToken.AccessToken)
	// 	require.NotEmpty(t, refreshResponse.RefreshToken.RefreshToken)
	// 	require.Equal(t, "PC", refreshResponse.RefreshToken.Device)

	// 	// 验证旧 Token 已被删除
	// 	oldToken, err := database.DB.Query(`
	//         SELECT * FROM token WHERE accessToken = $accessToken;
	//     `, map[string]interface{}{
	// 		"accessToken": accessToken,
	// 	})
	// 	require.NoError(t, err)
	// 	require.Empty(t, oldToken)
	// })
}

func TestUserFunctions(t *testing.T) {
	c := client.New(NewServer())
	var user TestUser

	num, _ := rand.Int(rand.Reader, big.NewInt(1000000000))
	phoneNumber := fmt.Sprintf("%d", num.Int64())
	num, _ = rand.Int(rand.Reader, big.NewInt(10000))
	username := fmt.Sprintf("TEST_user%d", num.Int64())
	password := username

	t.Run("Create User", func(t *testing.T) {
		var resp struct {
			CreateUser struct {
				UserID  string
				Message string
			}
		}

		err := c.Post(`mutation($phoneNumber: String!, $password: String!, $username: String!) {
			createUser(
				phoneNumber: $phoneNumber,
				password: $password,
				username: $username,
				role: "patient"
			){
				userId,
				message
			}
		}`, &resp, client.Var("phoneNumber", phoneNumber), client.Var("password", password), client.Var("username", username))
		if err != nil {
			println("Errors:")
			println(err.Error())
			println("End of errors")
		}
		require.Equal(t, fmt.Sprintf("User %s created successfully", username), resp.CreateUser.Message)
	})

	t.Run("Login", func(t *testing.T) {
		var resp struct {
			LoginUser struct {
				UserID string
				Token  struct{ AccessToken string }
			}
		}

		c.MustPost(fmt.Sprintf(`mutation login {
			loginUser(phoneNumber: "%s", password:"%s"){
				userId
			  token{
				accessToken
			  }
			}
		  }`, phoneNumber, password), &resp)

		user.AccessToken = resp.LoginUser.Token.AccessToken
		user.ID = resp.LoginUser.UserID
	})
	user.Password = password
	user.PhoneNumber = phoneNumber
	user.Username = username

	t.Run("Get User", func(t *testing.T) {
		var response struct {
			GetUser struct {
				UserID      string
				PhoneNumber string
				Name        string
				Role        string
				Points      float64
				CreatedAt   string
				LastLogin   string
			}
		}

		c.MustPost(`query {
			getUser{
				userId,
				phoneNumber,
				name,
				role,
				points,
				createdAt,
				lastLogin
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))

		require.Equal(t, user.ID, response.GetUser.UserID)
		require.Equal(t, user.PhoneNumber, response.GetUser.PhoneNumber)
		require.Equal(t, "patient", response.GetUser.Role)
		require.Equal(t, 0.0, response.GetUser.Points)
		require.NotEmpty(t, response.GetUser.CreatedAt)
		require.NotEmpty(t, response.GetUser.LastLogin)
	})
	t.Run("Update User", func(t *testing.T) {
		var response struct {
			UpdateUser struct {
				UserID  string
				Message string
			}
		}

		name := "New Name"
		phoneNumber := "1234567890"
		password := "new_password"
		query := fmt.Sprintf(`
			mutation {
				updateUser(name: "%s", phoneNumber: "%s", password: "%s") {
					userId
					message
				}
			}
		`, name, phoneNumber, password)

		c.MustPost(query, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))

		require.Equal(t, user.ID, response.UpdateUser.UserID)
		require.Equal(t, "User updated successfully", response.UpdateUser.Message)
		user.Username = name
	})

	t.Run("Request Password Reset", func(t *testing.T) {
		var response struct {
			RequestPasswordReset struct {
				Message string
			}
		}

		query := `
			mutation {
				requestPasswordReset(phoneNumber: "1234567890") {
					message
				}
			}
		`

		c.MustPost(query, &response)

		require.Contains(t, response.RequestPasswordReset.Message, "Password reset code")
		require.Contains(t, response.RequestPasswordReset.Message, "has been sent to your phone")
	})

	t.Run("Reset Password", func(t *testing.T) {
		// 模拟生成的重置 token 和新密码
		resetToken := "01JEST4WS17BKM8SNJPRWWQ1B2"
		newPassword := "secure_password"
		var response struct {
			ResetPassword struct {
				Message string
			}
		}

		query := fmt.Sprintf(`
			mutation {
				resetPassword(token: "%s", newPassword: "%s") {
					message
				}
			}
		`, resetToken, newPassword)
		c.MustPost(query, &response)
		require.Equal(t, "Password reset successfully", response.ResetPassword.Message)
	})

	t.Run("Delete User", func(t *testing.T) {
		var response struct {
			DeleteUser struct {
				Message string
			}
		}

		c.MustPost(`mutation delete_user{
			deleteUser{
				message
		  	}
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))

		require.Equal(t, fmt.Sprintf("User %s with name %s deleted successfully", user.ID, user.Username), response.DeleteUser.Message)
	})

}
