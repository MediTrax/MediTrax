package tests

import (
	"encoding/json"
	"fmt"
	"meditrax/graph/custom"
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

		// testing for illegal delete ops
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}

		err := c.Post(`mutation delete_medication($medicationId: String!){
			deleteMedication (medicationId:$medicationId){
				message
		  	}
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)), client.Var("medicationId", "749213HFKJ"))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "illegal medication id", err_msg[0].Message)

		err = c.Post(`mutation delete_medication($medicationId: String!){
			deleteMedication (medicationId:$medicationId){
				message
		  	}
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)), client.Var("medicationId", "medication:7492FJSD374"))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "invalid id, no associated medication object found", err_msg[0].Message)
	})

	DeleteUser(t, c, user)
}

func TestMedicationReminder(t *testing.T) {
	c := client.New(NewServer())
	user := CreateUserAndLogin(t, c)

	var medId string
	var remId string

	t.Run("Create Medication & Reminder", func(t *testing.T) {
		var response_med struct {
			AddMedication struct {
				MedicationID string
				Message      string
			}
		}
		c.MustPost(`mutation add_med{
			addMedication(
				name: "test_medication"
				unit: "ml"
				dosage: 5
				frequency: "1/2"
				inventory: 7
		  	) {
				medicationId
				message
		  	}
		  }`, &response_med, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, "Medication test_medication added successfully", response_med.AddMedication.Message)
		medId = response_med.AddMedication.MedicationID

		var response struct {
			CreateMedicationReminder struct {
				ReminderID string
				Message    string
			}
		}
		c.MustPost(`mutation add_reminder($medicationId: String!){
			createMedicationReminder(
				medicationId: $medicationId, 
				reminderTime:"2024-12-03T15:04:05.000"
			){
				reminderId
				message
			}
		}`, &response, client.Var("medicationId", medId), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, "new reminder created successfully", response.CreateMedicationReminder.Message)
		remId = response.CreateMedicationReminder.ReminderID
	})

	t.Run("Try illegal creations", func(t *testing.T) {
		var response struct {
			CreateMedicationReminder struct {
				ReminderID string
				Message    string
			}
		}
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		err := c.Post(`mutation create_rem($medicationId:String!) {
			createMedicationReminder(
				medicationId: $medicationId, 
				reminderTime:"2024-12-03T15:04:05.000"
		  	) {
				reminderId
				message
		  	}
		  }`, &response, client.Var("medicationId", "842fsd93"), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "illegal medication id", err_msg[0].Message)

		err = c.Post(`mutation create_rem($medicationId:String!) {
			createMedicationReminder(
				medicationId: $medicationId, 
				reminderTime:"2024-12-03T15:04:05.000"
		  	) {
				reminderId
				message
		  	}
		  }`, &response, client.Var("medicationId", "medication:KFJSWEO7429R32IU"), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "invalid medication id or medication id not associated with user", err_msg[0].Message)

		err = c.Post(`mutation add_reminder($medicationId: String!){
			createMedicationReminder(
				medicationId: $medicationId, 
				reminderTime:"2024-12-03T15:04:05.000"
			){
				reminderId
				message
			}
		}`, &response, client.Var("medicationId", medId), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "identical medication reminder for the user already exists", err_msg[0].Message)
	})

	t.Run("update and query reminder", func(t *testing.T) {
		var response struct {
			UpdateMedicationReminder struct {
				ReminderID string
				Message    string
			}
		}

		rem_time_str := "2024-12-02T12:00:10.000"
		rem_time, _ := custom.UnmarshalDateTime(rem_time_str)

		c.MustPost(`mutation update_rem($reminderId:String!, $reminderTime:DateTime!){
			updateMedicationReminder(
				reminderId:$reminderId, 
				reminderTime:$reminderTime,
				isTaken:true
			){
				reminderId
				message
			}
		}`, &response, client.Var("reminderId", remId), client.Var("reminderTime", rem_time_str),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, "Medication reminder updated successfully", response.UpdateMedicationReminder.Message)
		require.Equal(t, remId, response.UpdateMedicationReminder.ReminderID)

		// get the medication to see if inventory has been changed accordingly
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
			if med.MedicationID == medId {
				require.Equal(t, 2.0, med.Inventory)
			}
		}

		// get the reminder to see if change has taken place
		var response3 struct {
			GetMedicationReminders []struct {
				ReminderID   string
				MedicationID string
				ReminderTime string
				IsTaken      bool
			}
		}
		c.MustPost(`query get_rems{
			getMedicationReminders {
				reminderId
				medicationId
				reminderTime
				isTaken
			}
		}`, &response3, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, 1, len(response3.GetMedicationReminders))
		require.Equal(t, remId, response3.GetMedicationReminders[0].ReminderID)
		require.Equal(t, medId, response3.GetMedicationReminders[0].MedicationID)
		get_time, _ := custom.UnmarshalDateTime(response3.GetMedicationReminders[0].ReminderTime)
		require.Equal(t, rem_time, get_time)
		require.Equal(t, true, response3.GetMedicationReminders[0].IsTaken)
	})

	t.Run("illegal updates", func(t *testing.T) {
		var response struct {
			UpdateMedicationReminder struct {
				ReminderID string
				Message    string
			}
		}
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}

		rem_time_str := "2024-12-02T12:00:10.000"

		err := c.Post(`mutation update_rem($reminderId:String!, $reminderTime:DateTime!){
			updateMedicationReminder(
				reminderId:$reminderId, 
				reminderTime:$reminderTime,
				isTaken:true
			){
				reminderId
				message
			}
		}`, &response, client.Var("reminderId", "medication_reminder:84hfd"), client.Var("reminderTime", rem_time_str),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "illegal reminder id", err_msg[0].Message)

		err = c.Post(`mutation update_rem($reminderId:String!, $reminderTime:DateTime!){
			updateMedicationReminder(
				reminderId:$reminderId, 
				reminderTime:$reminderTime,
				isTaken:true
			){
				reminderId
				message
			}
		}`, &response, client.Var("reminderId", "medication_reminder:4729HKSHFDKS"), client.Var("reminderTime", rem_time_str),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "wrong medication reminder id, no reminder found", err_msg[0].Message)

		c.MustPost(`mutation update_rem($reminderId:String!){
			updateMedicationReminder(
				reminderId:$reminderId, 
				isTaken:false
			){
				reminderId
				message
			}
		}`, &response, client.Var("reminderId", remId),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		err = c.Post(`mutation update_rem($reminderId:String!){
				updateMedicationReminder(
					reminderId:$reminderId, 
					isTaken:true
				){
					reminderId
					message
				}
			}`, &response, client.Var("reminderId", remId),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "negative inventory", err_msg[0].Message)

		// delete the medication and test if update can sense that no medication is linked
		var response_med struct {
			DeleteMedication struct {
				Message string
			}
		}
		c.MustPost(`mutation del_med($medicationId: String!){
			deleteMedication (medicationId:$medicationId){
				message
		  	}
		  }`, &response_med, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)), client.Var("medicationId", medId))
		require.Equal(t, fmt.Sprintf("Medication %s with name %s deleted successfully", medId, "test_medication"), response_med.DeleteMedication.Message)
		err = c.Post(`mutation update_rem($reminderId:String!){
			updateMedicationReminder(
				reminderId:$reminderId, 
				isTaken:true
			){
				reminderId
				message
			}
		}`, &response, client.Var("reminderId", remId),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "no medication linked to reminder found", err_msg[0].Message)
	})

	t.Run("delete reminder", func(t *testing.T) {
		var response struct {
			DeleteMedicationReminder struct {
				Message string
			}
		}

		c.MustPost(`mutation delete_rem($reminderId:String!){
			deleteMedicationReminder(reminderId:$reminderId){
				message
			}
		}`, &response, client.Var("reminderId", remId), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, fmt.Sprintf("Medication reminder %s for medication %s was deleted successfully", remId, medId),
			response.DeleteMedicationReminder.Message)

		// testing for illegal delete ops
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}

		err := c.Post(`mutation delete_rem($reminderId:String!){
			deleteMedicationReminder(reminderId:$reminderId){
				message
			}
		}`, &response, client.Var("reminderId", "742FHSDK32847"), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "illegal medication reminder id", err_msg[0].Message)

		err = c.Post(`mutation delete_rem($reminderId:String!){
			deleteMedicationReminder(reminderId:$reminderId){
				message
			}
		}`, &response, client.Var("reminderId", "medication_reminder:8402HFKSEU"), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "invalid id, no associated medication reminder object found", err_msg[0].Message)
	})

	DeleteUser(t, c, user)
}
