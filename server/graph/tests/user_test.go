package tests

import (
	"crypto/rand"
	"fmt"
	"math/big"
	"testing"

	"github.com/99designs/gqlgen/client"
	"github.com/stretchr/testify/require"
)

<<<<<<< HEAD
func TestCreationAndDelete(t *testing.T) {
=======
func TestUserFunctions(t *testing.T) {
>>>>>>> 01096166741546756a9456fc584388602358902c
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

<<<<<<< HEAD
=======
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

	// t.Run("Reset Password", func(t *testing.T) {
	// 	// 模拟生成的重置 token 和新密码
	// 	resetToken := "mocked_reset_token"
	// 	newPassword := "secure_password"
	// 	var response struct {
	// 		ResetPassword struct {
	// 			Message string
	// 		}
	// 	}

	// 	query := fmt.Sprintf(`
	// 		mutation {
	// 			resetPassword(token: "%s", newPassword: "%s") {
	// 				message
	// 			}
	// 		}
	// 	`, resetToken, newPassword)

	// 	c.MustPost(query, &response)

	// 	require.Equal(t, "Password reset successfully", response.ResetPassword.Message)
	// })

>>>>>>> 01096166741546756a9456fc584388602358902c
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
<<<<<<< HEAD
=======

>>>>>>> 01096166741546756a9456fc584388602358902c
}
