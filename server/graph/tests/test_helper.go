package tests

import (
	"crypto/rand"
	"fmt"
	"math/big"
	"testing"

	"github.com/99designs/gqlgen/client"
	"github.com/stretchr/testify/require"
)

type TestUser struct {
	ID          string
	Username    string
	Password    string
	PhoneNumber string
	AccessToken string
}

func CreateUserAndLogin(t *testing.T, c *client.Client) TestUser {
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

	return user
}

func DeleteUser(t *testing.T, c *client.Client, user TestUser) {
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
