package tests

import (
	"crypto/rand"
	"encoding/json"
	"fmt"
	"math/big"
	"meditrax/graph/custom"
	"testing"
	"time"

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

	t.Run("Illegal creations", func(t *testing.T) {
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
		// creating duplicate medication
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
		// creating medication with wrong frequency format
		err = c.Post(`mutation add_med{
			addMedication(
				name: "test_medication3"
				unit: "pills"
				dosage: 20
				frequency: "11.3"
				inventory: 42
		  	) {
				medicationId
				message
		  	}
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "invalid frequency format 11.3 for medication test_medication3", err_msg[0].Message)
		// creating medication without login in (no access token)
		err = c.Post(`mutation add_med{
			addMedication(
				name: "test_medication3"
				unit: "pills"
				dosage: 20
				frequency: "2/3"
				inventory: 42
		  	) {
				medicationId
				message
		  	}
		  }`, &response)
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
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

		// illegal get (no access token)
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		err := c.Post(`query get_meds{
			getMedications {
				medicationId
				name
				dosage
				frequency
				inventory
			}
		}`, &response)
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
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
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)),
			client.Var("medicationId", medId2))

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

		// deleting with illegal medication id format
		err := c.Post(`mutation delete_medication($medicationId: String!){
			deleteMedication (medicationId:$medicationId){
				message
		  	}
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)),
			client.Var("medicationId", "749213HFKJ"))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "illegal medication id", err_msg[0].Message)

		// deleting with invalid ID (already deleted)
		err = c.Post(`mutation delete_medication($medicationId: String!){
			deleteMedication (medicationId:$medicationId){
				message
		  	}
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)),
			client.Var("medicationId", medId2))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "invalid id, no associated medication object found", err_msg[0].Message)

		// deleting without loggin in
		err = c.Post(`mutation delete_medication($medicationId: String!){
			deleteMedication (medicationId:$medicationId){
				message
		  	}
		  }`, &response,
			client.Var("medicationId", medId2))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
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

		rem_time, _ := time.Parse("2006-01-02T15:04:05.000", "2024-12-03T15:04:05.000")

		var response struct {
			CreateMedicationReminder struct {
				ReminderID string
				Message    string
			}
		}
		c.MustPost(`mutation add_reminder($medicationId: String!, $reminderTime: DateTime!){
			createMedicationReminder(
				medicationId: $medicationId, 
				reminderTime: $reminderTime
			){
				reminderId
				message
			}
		}`, &response, client.Var("medicationId", medId), client.Var("reminderTime", rem_time),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
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
		rem_time, _ := time.Parse("2006-01-02T15:04:05.000", "2024-12-03T15:04:05.000")
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		// illegally formatted medication reminder
		err := c.Post(`mutation create_rem($medicationId:String!, $reminderTime:DateTime!) {
			createMedicationReminder(
				medicationId: $medicationId, 
				reminderTime:$reminderTime
		  	) {
				reminderId
				message
		  	}
		  }`, &response, client.Var("medicationId", "medication:842fsd93"), client.Var("reminderTime", rem_time),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "illegal medication id", err_msg[0].Message)
		// link to non-existent medication object
		err = c.Post(`mutation create_rem($medicationId:String!, $reminderTime:DateTime!) {
			createMedicationReminder(
				medicationId: $medicationId, 
				reminderTime:$reminderTime
		  	) {
				reminderId
				message
		  	}
		  }`, &response, client.Var("medicationId", "medication:KFJSWEO7429R32IU"), client.Var("reminderTime", rem_time),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "invalid medication id or medication id not associated with user", err_msg[0].Message)
		// create an identical reminder for the same user and the same medication
		err = c.Post(`mutation add_reminder($medicationId: String!, $reminderTime:DateTime!){
			createMedicationReminder(
				medicationId: $medicationId, 
				reminderTime:$reminderTime
			){
				reminderId
				message
			}
		}`, &response, client.Var("medicationId", medId), client.Var("reminderTime", rem_time),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "identical medication reminder for the user already exists", err_msg[0].Message)
		// without access token
		err = c.Post(`mutation add_reminder($medicationId: String!, $reminderTime:DateTime!){
			createMedicationReminder(
				medicationId: $medicationId, 
				reminderTime:$reminderTime
			){
				reminderId
				message
			}
		}`, &response, client.Var("medicationId", medId), client.Var("reminderTime", rem_time))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
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
		}`, &response, client.Var("reminderId", remId), client.Var("reminderTime", rem_time),
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
		new_rem_time, err := time.Parse("2006-01-02T15:04:05.000", response3.GetMedicationReminders[0].ReminderTime)
		require.Nil(t, err)
		require.Equal(t, rem_time, new_rem_time)
		require.Equal(t, true, response3.GetMedicationReminders[0].IsTaken)

		// illegal queries
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}

		//
		err_ := c.Post(`query get_rems{
			getMedicationReminders {
				reminderId
				medicationId
				reminderTime
				isTaken
			}
		}`, &response3)
		json.Unmarshal(json.RawMessage(err_.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)

	})

	t.Run("Take Medication", func(t *testing.T) {
		var addMedResponse struct {
			AddMedication struct {
				MedicationID string
				Message      string
			}
		}

		// create medication with randomized frequency
		_freq_days, _ := rand.Int(rand.Reader, big.NewInt(10))
		freq_days := _freq_days.Int64() + 1
		_freq_times, _ := rand.Int(rand.Reader, big.NewInt(10))
		freq_times := _freq_times.Int64() + 1
		frequency := fmt.Sprintf("%d/%d", freq_times, freq_days)
		c.MustPost(`mutation add_med($frequency:String!){
			addMedication(
				name: "test_medication_take"
				unit: "tablets"
				dosage: 3
				frequency: $frequency
				inventory: 5
			  ) {
				medicationId
				message
			  }
		  }`, &addMedResponse, client.Var("frequency", frequency),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, "Medication test_medication_take added successfully", addMedResponse.AddMedication.Message)
		medId := addMedResponse.AddMedication.MedicationID

		// add a reminder for the created medication
		var addReminderResponse struct {
			CreateMedicationReminder struct {
				ReminderID string
				Message    string
			}
		}
		rem_time, err := time.Parse("2006-01-02T15:04:05.000", "2024-12-11T08:00:00.000")
		if err != nil {
			println("time parse failed")
			println(err.Error())
		}
		c.MustPost(`mutation create_Med_Reminder($medicationId: String!, $reminderTime: DateTime!){
			createMedicationReminder(
				medicationId: $medicationId
				reminderTime: $reminderTime
			) {
				reminderId
				message
			}
		  }`, &addReminderResponse, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)),
			client.Var("medicationId", medId), client.Var("reminderTime", rem_time.UTC()))
		reminderId := addReminderResponse.CreateMedicationReminder.ReminderID

		// take the medication via the created reminder
		var takeResponse struct {
			TakeMedication struct {
				Message string
			}
		}
		c.MustPost(`mutation take_med($reminderId: String!) {
			takeMedication(reminderId: $reminderId) {
				message
			}
		  }`, &takeResponse, client.Var("reminderId", reminderId), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, "medication taken successfully", takeResponse.TakeMedication.Message)

		// get the reminder to see if reminder time has been updated by the frequency period
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
		for _, reminder := range response3.GetMedicationReminders {
			if reminder.ReminderID == addReminderResponse.CreateMedicationReminder.ReminderID {
				get_time, _ := custom.UnmarshalDateTime(reminder.ReminderTime)
				require.NotEqual(t, rem_time, get_time)
				rem_time = time.Time.Add(rem_time, time.Hour*time.Duration(24*freq_days))
				// println(rem_time.Format(time.RFC3339))
				require.Equal(t, rem_time, get_time)
			}
		}

		// get the medications to see if inventory had been updated
		var getMedResponse struct {
			GetMedications []struct {
				MedicationID string
				Inventory    float64
			}
		}
		c.MustPost(`query get_meds{
			getMedications {
				medicationId
				inventory
			}
		}`, &getMedResponse, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		for _, med := range getMedResponse.GetMedications {
			if med.MedicationID == medId {
				require.Equal(t, 2.0, med.Inventory)
			}
		}

		var errMsg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}

		// illegal take medication scenerios
		// illegally formated medicaiton reminder id
		err = c.Post(`mutation take_med($reminderId: String!) {
			takeMedication(reminderId: $reminderId) {
				message
			}
		  }`, &takeResponse, client.Var("reminderId", "invalid_reminder_id"), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &errMsg)
		require.Equal(t, "illegal reminder id", errMsg[0].Message)
		// using invalid reminder id
		err = c.Post(`mutation take_med($reminderId: String!) {
			takeMedication(reminderId: $reminderId) {
				message
			}
		  }`, &takeResponse, client.Var("reminderId", "medication_reminder:823402894HFKWHERYIY324"), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &errMsg)
		require.Equal(t, "wrong medication reminder id, no reminder associated with userfound", errMsg[0].Message)
		// take medication again (which would result in negative inventory)
		err = c.Post(`mutation take_med($reminderId: String!) {
			takeMedication(reminderId: $reminderId) {
				message
			}
		  }`, &takeResponse, client.Var("reminderId", reminderId), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &errMsg)
		require.Equal(t, "negative inventory", errMsg[0].Message)

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

		rem_time, _ := time.Parse("2006-01-02T15:04:05.000", "2024-12-02T12:00:10.000")

		err := c.Post(`mutation update_rem($reminderId:String!, $reminderTime:DateTime!){
			updateMedicationReminder(
				reminderId:$reminderId, 
				reminderTime:$reminderTime,
				isTaken:true
			){
				reminderId
				message
			}
		}`, &response, client.Var("reminderId", "medication_reminder:84hfd"), client.Var("reminderTime", rem_time),
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
		}`, &response, client.Var("reminderId", "medication_reminder:4729HKSHFDKS"), client.Var("reminderTime", rem_time),
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

func TestTreatmentSchedule(t *testing.T) {
	c := client.New(NewServer())
	user := CreateUserAndLogin(t, c)

	var scheduleId string

	t.Run("Create treatment schedule", func(t *testing.T) {
		var response struct {
			CreateTreatmentSchedule struct {
				ScheduleID string
				Message    string
			}
		}

		scheduledTime, _ := time.Parse("2006-01-02T15:04:05.000", "2024-12-03T15:04:05.000")

		c.MustPost(`mutation create_schedule($scheduledTime:DateTime!){
				createTreatmentSchedule(
					treatmentType: "test_type",
					scheduledTime: $scheduledTime,
					location: "hospital",
					notes: "bring past records"
				){
					scheduleId
					message
				}
			}`, &response, client.Var("scheduledTime", scheduledTime),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, "Treatment schedule created successfully", response.CreateTreatmentSchedule.Message)
		scheduleId = response.CreateTreatmentSchedule.ScheduleID

		// illegal creations of treatment schedule
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		// no access token
		err := c.Post(`mutation create_schedule($scheduledTime:DateTime!){
			createTreatmentSchedule(
				treatmentType: "test_type",
				scheduledTime: $scheduledTime,
				location: "hospital",
				notes: "bring past records"
			){
				scheduleId
				message
			}
		}`, &response, client.Var("scheduledTime", scheduledTime))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})

	t.Run("Update and query treatment schedule", func(t *testing.T) {
		var response struct {
			UpdateTreatmentSchedule struct {
				ScheduleID string
				Message    string
			}
		}

		newTime, _ := time.Parse("2006-01-02T15:04:05.000", "2024-12-13T12:00:00.000")

		c.MustPost(`mutation update_schedule ($scheduleId: String!, $scheduledTime:DateTime!){
			updateTreatmentSchedule(
				scheduleId:$scheduleId,
				treatmentType: "test_update_type",
				scheduledTime: $scheduledTime,
				location: "new hospital",
				notes: "don't bring anything"
			){
				scheduleId,
				message
			}
		}`, &response, client.Var("scheduledTime", newTime),
			client.Var("scheduleId", scheduleId), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, "Treatment schedule updated successfully", response.UpdateTreatmentSchedule.Message)
		require.Equal(t, scheduleId, response.UpdateTreatmentSchedule.ScheduleID)

		var response_query struct {
			GetTreatmentSchedules []struct {
				ScheduleID    string
				TreatmentType string
				ScheduledTime string
				Location      string
				Notes         string
			}
		}
		c.MustPost(`query get_schedules{
			getTreatmentSchedules{
				scheduleId,
				treatmentType,
				scheduledTime,
				location,
				notes
			}
		}`, &response_query, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, 1, len(response_query.GetTreatmentSchedules))
		require.Equal(t, scheduleId, response_query.GetTreatmentSchedules[0].ScheduleID)
		require.Equal(t, "test_update_type", response_query.GetTreatmentSchedules[0].TreatmentType)
		require.Equal(t, "new hospital", response_query.GetTreatmentSchedules[0].Location)
		require.Equal(t, "don't bring anything", response_query.GetTreatmentSchedules[0].Notes)
		queried_time, _ := custom.UnmarshalDateTime(response_query.GetTreatmentSchedules[0].ScheduledTime)
		require.Equal(t, newTime, queried_time)

		// illegal queries of treatment schedule
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		// no access token
		err := c.Post(`query get_schedules{
			getTreatmentSchedules{
				scheduleId,
				treatmentType,
				scheduledTime,
				location,
				notes
			}
		}`, &response_query)
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})

	t.Run("Delete Treatment Schedule", func(t *testing.T) {
		var response struct {
			DeleteTreatmentSchedule struct {
				Message string
			}
		}

		c.MustPost(`mutation delete_schedule($scheduleId:String!){
			deleteTreatmentSchedule(scheduleId: $scheduleId){
				message
			}
		}`, &response, client.Var("scheduleId", scheduleId), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, fmt.Sprintf("Treatment schedule %s deleted successfully", scheduleId),
			response.DeleteTreatmentSchedule.Message)

		// testing illegal deletions
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		// illegally formatted schedule id
		err := c.Post(`mutation delete_schedule($scheduleId:String!){
			deleteTreatmentSchedule(scheduleId: $scheduleId){
				message
			}
		}`, &response, client.Var("scheduleId", "49328ufkhewekw"), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "illegal schedule id", err_msg[0].Message)
		// try to delete again
		err = c.Post(`mutation delete_schedule($scheduleId:String!){
			deleteTreatmentSchedule(scheduleId: $scheduleId){
				message
			}
		}`, &response, client.Var("scheduleId", scheduleId), client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "schedule not found", err_msg[0].Message)
		// deletion without giving access token
		err = c.Post(`mutation delete_schedule($scheduleId:String!){
			deleteTreatmentSchedule(scheduleId: $scheduleId){
				message
			}
		}`, &response, client.Var("scheduleId", scheduleId))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})

	DeleteUser(t, c, user)
}
