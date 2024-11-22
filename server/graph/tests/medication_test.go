package tests

import (
	"encoding/json"
	"fmt"
	"testing"

	"github.com/99designs/gqlgen/client"
	"github.com/stretchr/testify/require"
)

func TestMedication(t *testing.T) {
	c := client.New(NewServer())
	user := CreateUserAndLogin(t, c)

	var medId1 string
	var medId2 string

	t.Run("Create Medications", func(t *testing.T) {
		var response struct {
			AddMedication struct {
				MedicationID string
				Message      string
			}
		}
		c.MustPost(`mutation add_med{
			addMedication(
				name: "test_medication1"
				unit: "tablets"
				dosage: 1
				frequency: "1/2"
				inventory: 24
		  	) {
				medicationId
				message
		  	}
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, "Medication test_medication1 added successfully", response.AddMedication.Message)
		medId1 = response.AddMedication.MedicationID

		c.MustPost(`mutation add_med{
			addMedication(
				name: "test_medication2"
				unit: "ml"
				dosage: 20
				frequency: "3/1"
				inventory: 1000
		  	) {
				medicationId
				message
		  	}
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, "Medication test_medication2 added successfully", response.AddMedication.Message)
		medId2 = response.AddMedication.MedicationID

		require.NotEqual(t, medId1, medId2)
	})

	t.Run("Try creating duplicates", func(t *testing.T) {
		var response struct {
			AddMedication struct {
				MedicationID string
				Message      string
			}
		}
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		err := c.Post(`mutation add_med{
			addMedication(
				name: "test_medication1"
				unit: "pills"
				dosage: 20
				frequency: "2/3"
				inventory: 42
		  	) {
				medicationId
				message
		  	}
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "identical medication name already exists for the user, please use update medication instead", err_msg[0].Message)
	})

	t.Run("Get Medications", func(t *testing.T) {
		var response struct {
			GetMedications []struct {
				MedicationID string
				Name         string
				Dosage       float64
				Frequency    string
				Inventory    float64
			}
		}
		c.MustPost(`query get_meds{
			getMedications {
				medicationId
				name
				dosage
				frequency
				inventory
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, medId1, response.GetMedications[0].MedicationID)
		require.Equal(t, medId2, response.GetMedications[1].MedicationID)
	})

	t.Run("Update Medication", func(t *testing.T) {
		var response1 struct {
			UpdateMedication struct {
				MedicationID string
				Message      string
			}
		}
		c.MustPost(`mutation update_med($medicationId: String!) {
			updateMedication(
				medicationId: $medicationId
				name: "test_change"
				unit: "pills"
				frequency: "2/3"
				inventory: 42
				dosage: 2
			)
			{
				medicationId
				message
			}
		}`, &response1, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)), client.Var("medicationId", medId1))
		require.Equal(t, medId1, response1.UpdateMedication.MedicationID)
		require.Equal(t, "Medication updated successfully", response1.UpdateMedication.Message)

		var response2 struct {
			GetMedications []struct {
				MedicationID string
				Name         string
				Dosage       float64
				Frequency    string
				Inventory    float64
				Unit         string
			}
		}
		c.MustPost(`query get_meds{
			getMedications {
				medicationId
				name
				dosage
				frequency
				inventory
				unit
			}
		}`, &response2, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		for _, med := range response2.GetMedications {
			if med.MedicationID == medId1 {
				require.Equal(t, "test_change", med.Name)
				require.Equal(t, "pills", med.Unit)
				require.Equal(t, "2/3", med.Frequency)
				require.Equal(t, 2.0, med.Dosage)
				require.Equal(t, 42.0, med.Inventory)
			}
		}

		// testing if update produces the correct errors when given invalid ids
		var response struct {
			UpdateMedication struct {
				MedicationID string
				Message      string
			}
		}
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		err := c.Post(`mutation update_med($medicationId: String!) {
			updateMedication(
				medicationId: $medicationId
				name: "test_change"
				unit: "pills"
				frequency: "2/3"
				inventory: 42
				dosage: 2
			)
			{
				medicationId
				message
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)), client.Var("medicationId", "sfdsiiyfs89w"))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "illegal medication id", err_msg[0].Message)

		err = c.Post(`mutation update_med($medicationId: String!) {
			updateMedication(
				medicationId: $medicationId
				name: "test_change"
				unit: "pills"
				frequency: "2/3"
				inventory: 42
				dosage: 2
			)
			{
				medicationId
				message
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)), client.Var("medicationId", "medication:YWIERY43479HFI32"))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "invalid id. no associated medication object found", err_msg[0].Message)
	})

	t.Run("Delete Medication", func(t *testing.T) {
		var response struct {
			DeleteMedication struct {
				Message string
			}
		}
		c.MustPost(`mutation delete_medication($medicationId: String!){
			deleteMedication (medicationId:$medicationId){
				message
		  	}
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)), client.Var("medicationId", medId1))

		require.Equal(t, fmt.Sprintf("Medication %s with name %s deleted successfully", medId1, "test_change"), response.DeleteMedication.Message)

		var response_get struct {
			GetMedications []struct {
				MedicationID string
				Name         string
				Dosage       float64
				Frequency    string
				Inventory    float64
			}
		}
		c.MustPost(`query get_meds{
			getMedications {
				medicationId
				name
				dosage
				frequency
				inventory
			}
		}`, &response_get, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, 1, len(response_get.GetMedications))
		require.Equal(t, medId2, response_get.GetMedications[0].MedicationID)

		c.MustPost(`mutation delete_medication($medicationId: String!){
			deleteMedication (medicationId:$medicationId){
				message
		  	}
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)), client.Var("medicationId", medId2))

		require.Equal(t, fmt.Sprintf("Medication %s with name %s deleted successfully", medId2, "test_medication2"), response.DeleteMedication.Message)

		c.MustPost(`query get_meds{
			getMedications {
				medicationId
				name
				dosage
				frequency
				inventory
			}
		}`, &response_get, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, 0, len(response_get.GetMedications))
	})

	DeleteUser(t, c, user)
}
