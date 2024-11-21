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

	user := CreateUserAndLogin(t, c)

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
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))

		require.Equal(t, "Medication test_medication added successfully", response.AddMedication.Message)
	})

	DeleteUser(t, c, user)
}
