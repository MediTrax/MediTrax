package tests

import (
	"crypto/rand"
	"fmt"
	"math/big"
	"testing"

	"github.com/99designs/gqlgen/client"
	"github.com/stretchr/testify/require"
)

func TestCreationAndDelete(t *testing.T) {
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
