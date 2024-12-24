package tests

import (
	"crypto/rand"
	"encoding/json"
	"fmt"
	"math/big"
	"meditrax/graph/custom"
	"meditrax/graph/model"
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

		// test illegal create users
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		err = c.Post(`mutation($phoneNumber: String!, $password: String!, $username: String!) {
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
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "phoneNumber and username should be unique", err_msg[0].Message)
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

		// test errors
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		err := c.Post(fmt.Sprintf(`mutation login {
			loginUser(phoneNumber: "%s", password:"%s "){
				userId
			  	token{
					accessToken
			  	}
			}
		  }`, phoneNumber, password), &resp, client.Var("phoneNumber", phoneNumber), client.Var("password", password))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "user not found", err_msg[0].Message)
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
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		err := c.Post(query, &response)
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "SMS sending failed: 只能向已回复授权信息的手机号发送", err_msg[0].Message)

	})
	t.Run("Reset Password", func(t *testing.T) {
		var response struct {
			ResetPassword struct {
				Message string
			}
		}

		query := `
			mutation {
				resetPassword(resetCode: "123456", newPassword:"new_password") {
					message
				}
			}
		`
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		err := c.Post(query, &response)
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "invalid or expired resetcode", err_msg[0].Message)

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

		// test illegal deletions
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		// no access token
		err := c.Post(`mutation delete_user{
			deleteUser{
				message
		  	}
		  }`, &response)
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
		// user not found (already deleted)
		err = c.Post(`mutation delete_user{
			deleteUser{
				message
		  	}
		  }`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})

}

func TestSharedProfiles(t *testing.T) {
	c := client.New(NewServer())
	user1 := CreateUserAndLogin(t, c)
	user2 := CreateUserAndLogin(t, c)
	user3 := CreateUserAndLogin(t, c)

	t.Run("Share Profile", func(t *testing.T) {
		// share user1's profile with user2
		var response struct {
			ShareProfile struct {
				Message string
			}
		}

		c.MustPost(`mutation ($phoneNumber: String!){
			shareProfile(phoneNumber:$phoneNumber, accessLevel:"1", remarks:"no remarks"){
				message
			}
		}`, &response,
			client.Var("phoneNumber", user2.PhoneNumber),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user1.AccessToken)))
		require.Equal(t, fmt.Sprintf("Profile shared successfully with %s", user2.Username), response.ShareProfile.Message)

		// testing sharing with phonenumber that is not related to any user
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		err := c.Post(`mutation ($phoneNumber: String!){
			shareProfile(phoneNumber:$phoneNumber, accessLevel:"1", remarks:"no remarks"){
				message
			}
		}`, &response,
			client.Var("phoneNumber", "00000000000000000"),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user1.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "no user found with the provided phone number", err_msg[0].Message)
		// test sharing with yourself
		err = c.Post(`mutation ($phoneNumber: String!){
			shareProfile(phoneNumber:$phoneNumber, accessLevel:"1", remarks:"no remarks"){
				message
			}
		}`, &response,
			client.Var("phoneNumber", user1.PhoneNumber),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user1.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "cannot share profile with yourself", err_msg[0].Message)
		// testing sharing with no access token
		err = c.Post(`mutation ($phoneNumber: String!){
			shareProfile(phoneNumber:$phoneNumber, accessLevel:"1", remarks:"no remarks"){
				message
			}
		}`, &response,
			client.Var("phoneNumber", user1.PhoneNumber))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})

	t.Run("Get Profiles", func(t *testing.T) {
		var response struct {
			Get []struct {
				ID          string
				Name        string
				PhoneNumber string
				Role        string
				CreatedAt   string
			}
		}

		c.MustPost(`query {
			get:getProfiles{
				id,
				name,
				phoneNumber,
				role,
				createdAt
			}
		}`, &response,
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user2.AccessToken)))
		require.Equal(t, 2, len(response.Get))
		require.Equal(t, user1.Username, response.Get[1].Name)
		require.Equal(t, user1.ID, response.Get[1].ID)
		require.Equal(t, user1.PhoneNumber, response.Get[1].PhoneNumber)
		_, err := custom.UnmarshalDateTime(response.Get[1].CreatedAt)
		require.Nil(t, err)

		c.MustPost(`query {
			get:getSharedProfiles{
				id,
				name,
				phoneNumber,
				role,
				createdAt
			}
		}`, &response,
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user1.AccessToken)))
		require.Equal(t, 2, len(response.Get))
		require.Equal(t, user2.Username, response.Get[1].Name)
		require.Equal(t, user2.ID, response.Get[1].ID)
		require.Equal(t, user2.PhoneNumber, response.Get[1].PhoneNumber)
		_, err = custom.UnmarshalDateTime(response.Get[1].CreatedAt)
		require.Nil(t, err)

		// illegal queries without access token
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		err_ := c.Post(`query {
			get:getProfiles{
				id,
				name,
				phoneNumber,
				role,
				createdAt
			}
		}`, &response)
		json.Unmarshal(json.RawMessage(err_.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
		err_ = c.Post(`query {
			get:getSharedProfiles{
				id,
				name,
				phoneNumber,
				role,
				createdAt
			}
		}`, &response)
		json.Unmarshal(json.RawMessage(err_.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})

	t.Run("Get shared details", func(t *testing.T) {
		// add one of medication, medical records, treatment schedule, and health metric for user1
		var response_create struct {
			AddMedication struct {
				MedicationID string
				Message      string
			}
			AddMedicalRecord struct {
				RecordID string
				Message  string
			}
			CreateTreatmentSchedule struct {
				ScheduleID string
				Message    string
			}
			AddHealthMetric struct {
				MetricID string
				Message  string
			}
		}
		c.MustPost(`mutation{
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
			addMedicalRecord(recordType: "type1", content: "treatment successful"){
				recordId,
				message
			}
			createTreatmentSchedule(
				treatmentType: "test_type",
				scheduledTime: "2025-01-01T10:00:00.000",
				location: "hospital",
				notes: "bring past records"
			){
				scheduleId
				message
			}
			addHealthMetric(
				metricType:"type1", 
				unit:"mg/l", 
				value:11.3, 
				recordedAt:"2024-07-01T10:00:00.000"
			){
				metricId
				message
			}
		}`, &response_create,
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user1.AccessToken)))

		// get user1's shared information using user2's access token
		var response_get struct {
			GetSharedTreatmentSchedule []struct {
				ScheduleID    string
				TreatmentType string
				ScheduledTime string
				Location      string
				Notes         string
			}
			GetSharedMedications []struct {
				MedicationID string
				Name         string
				Dosage       float64
				Frequency    string
				Inventory    float64
			}
			GetSharedMedicalRecords []struct {
				RecordID   string
				RecordType string
				Content    string
				CreatedAt  string
			}
			GetSharedHealthMetrics []struct {
				MetricID   string
				MetricType string
				Value      float64
				RecordedAt string
				Unit       string
			}
		}

		c.MustPost(`query ($sharedId:String!){
			getSharedTreatmentSchedule(patientId:$sharedId){
				scheduleId,
				treatmentType,
				scheduledTime,
				location,
				notes
			}
			getSharedMedications(patientId:$sharedId) {
				medicationId
				name
				dosage
				frequency
				inventory
			}
			getSharedMedicalRecords(patientId:$sharedId) {
				recordId,
				recordType,
				content,
				createdAt
			}
			getSharedHealthMetrics(patientId:$sharedId){
				metricId
				metricType
				value
				recordedAt
				unit
			}

		}`, &response_get, client.Var("sharedId", user1.ID),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user2.AccessToken)))
		require.Equal(t, response_create.AddHealthMetric.MetricID, response_get.GetSharedHealthMetrics[0].MetricID)
		require.Equal(t, response_create.AddMedication.MedicationID, response_get.GetSharedMedications[0].MedicationID)
		require.Equal(t, response_create.AddMedicalRecord.RecordID, response_get.GetSharedMedicalRecords[0].RecordID)
		require.Equal(t, response_create.CreateTreatmentSchedule.ScheduleID, response_get.GetSharedTreatmentSchedule[0].ScheduleID)

		// test accessing user1's information using user3 (which user1 is not shared with)
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		err := c.Post(`query ($sharedId:String!){
			getSharedTreatmentSchedule(patientId:$sharedId){
				scheduleId,
				treatmentType,
				scheduledTime,
				location,
				notes
			}
			getSharedMedications(patientId:$sharedId) {
				medicationId
				name
				dosage
				frequency
				inventory
			}
			getSharedMedicalRecords(patientId:$sharedId) {
				recordId,
				recordType,
				content,
				createdAt
			}
			getSharedHealthMetrics(patientId:$sharedId){
				metricId
				metricType
				value
				recordedAt
				unit
			}

		}`, &response_get, client.Var("sharedId", user1.ID),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user3.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, 4, len(err_msg))
		for _, err := range err_msg {
			require.Equal(t, "access denied, user is not a family member of patient", err.Message)
		}

		// using no access token, get shared api should return the same "access denied" as any other endpoints
		err = c.Post(`query ($sharedId:String!){
			getSharedTreatmentSchedule(patientId:$sharedId){
				scheduleId,
				treatmentType,
				scheduledTime,
				location,
				notes
			}
			getSharedMedications(patientId:$sharedId) {
				medicationId
				name
				dosage
				frequency
				inventory
			}
			getSharedMedicalRecords(patientId:$sharedId) {
				recordId,
				recordType,
				content,
				createdAt
			}
			getSharedHealthMetrics(patientId:$sharedId){
				metricId
				metricType
				value
				recordedAt
				unit
			}

		}`, &response_get, client.Var("sharedId", user1.ID))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, 4, len(err_msg))
		for _, err := range err_msg {
			require.Equal(t, "access denied", err.Message)
		}
	})

	t.Run("Unshare profile", func(t *testing.T) {
		var response struct {
			UnshareProfile model.UnshareProfileResponse
		}

		c.MustPost(`mutation($targetUserId:String!){
			unshareProfile(targetUserId:$targetUserId){
				message
			}
		}`, &response, client.Var("targetUserId", user2.ID),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user1.AccessToken)))
		require.Equal(t, fmt.Sprintf("Profile access removed for user %s", user2.ID), response.UnshareProfile.Message)

		var getResponse struct {
			Get []struct {
				ID          string
				Name        string
				PhoneNumber string
				Role        string
				CreatedAt   string
			}
		}

		c.MustPost(`query {
			get:getProfiles{
				id,
				name,
				phoneNumber,
				role,
				createdAt
			}
		}`, &getResponse,
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user2.AccessToken)))
		require.Equal(t, 1, len(getResponse.Get))
		require.Equal(t, user2.ID, getResponse.Get[0].ID)

		c.MustPost(`query {
			get:getSharedProfiles{
				id,
				name,
				phoneNumber,
				role,
				createdAt
			}
		}`, &getResponse,
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user1.AccessToken)))
		require.Equal(t, 1, len(getResponse.Get))
		require.Equal(t, user1.ID, getResponse.Get[0].ID)

		// error response (no access token)
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		err_ := c.Post(`mutation($targetUserId:String!){
			unshareProfile(targetUserId:$targetUserId){
				message
			}
		}`, &response, client.Var("targetUserId", user2.ID))
		json.Unmarshal(json.RawMessage(err_.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})

	DeleteUser(t, c, user1)
	DeleteUser(t, c, user2)
	DeleteUser(t, c, user3)
}
