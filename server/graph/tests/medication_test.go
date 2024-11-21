package tests

import (
	"fmt"
	"testing"

	"github.com/99designs/gqlgen/client"
	"github.com/stretchr/testify/require"
)

func TestMedication(t *testing.T) {
	// c := client.New(handler.NewDefaultServer(graph.NewExecutableSchema(graph.Config{Resolvers: &graph.Resolver{}})))
	c := client.New(NewServer())

	var username = "test_med3"
	var password = "test_med"
	var phoneNumber = "9947329479"
	var accessToken string
	var userId string

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

		accessToken = resp.LoginUser.Token.AccessToken
		userId = resp.LoginUser.UserID
	})

	t.Run("Create Medication", func(t *testing.T) {
		var response struct {
			AddMedication struct {
				MedicationID string
				Message      string
			}
		}

		c.MustPost(`mutation add_med{
			addMedication(
				name: "test_medication"
				unit: "tablets"
				dosage: 1
				frequency: "1/2"
				inventory: 24
		  	) {
				medicationId
				message
		  	}
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", accessToken)))

		require.Equal(t, "Medication test_medication added successfully", response.AddMedication.Message)
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
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", accessToken)))

		require.Equal(t, fmt.Sprintf("User %s with name %s deleted successfully", userId, username), response.DeleteUser.Message)
	})
}
