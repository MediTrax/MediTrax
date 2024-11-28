package tests

import (
	"encoding/json"
	"fmt"
	"testing"

	"github.com/99designs/gqlgen/client"
	"github.com/stretchr/testify/require"
)

// TODO: write test for MedicalRecord

func TestHealthMetric(t *testing.T) {
	c := client.New(NewServer())
	user := CreateUserAndLogin(t, c)

	var metricId1 string
	var metricId2 string

	t.Run("Create metric", func(t *testing.T) {
		var response struct {
			Add1 struct {
				MetricID string
				Message  string
			}
			Add2 struct {
				MetricID string
				Message  string
			}
		}

		c.MustPost(`mutation create_metric{
			add1:addHealthMetric(
				metricType:"type1", 
				unit:"mg/l", 
				value:11.3, 
				recordedAt:"2024-01-03T18:04:05.000"
			){
				metricId
				message
			}
			add2:addHealthMetric(metricType:"type2", unit:"", value:1.03, recordedAt:"2024-07-01T10:00:00.000"){
				metricId
				message
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, "new health metric added successfully", response.Add1.Message)
		require.Equal(t, "new health metric added successfully", response.Add2.Message)
		metricId1 = response.Add1.MetricID
		metricId2 = response.Add2.MetricID

		// illegal creations
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}

		var response_ struct {
			AddHealthMetric struct {
				MetricID string
				Message  string
			}
		}
		err := c.Post(`mutation create_metric{
			addHealthMetric(
				metricType:"type1", 
				unit:"mg/l", 
				value:11.3, 
				recordedAt:"2024-01-03T18:04:05.000"
			){
				metricId
				message
			}
		}`, &response_, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "health metric with the same type and same recordAt time already exists", err_msg[0].Message)

		err = c.Post(`mutation create_metric{
			addHealthMetric(metricType:"type1", unit:"mg/l", value:11.3, recordedAt:"2024-01-03T18:04:05.000"){
				metricId
				message
			}}`, &response_)
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})

	t.Run("Query metrics", func(t *testing.T) {
		var response struct {
			Type1 []struct {
				MetricID   string
				MetricType string
				Value      float64
				RecordedAt string
				Unit       string
			}
			StartDate []struct {
				MetricID   string
				MetricType string
				Value      float64
				RecordedAt string
				Unit       string
			}
			EndDate []struct {
				MetricID   string
				MetricType string
				Value      float64
				RecordedAt string
				Unit       string
			}
			RangeDate []struct {
				MetricID   string
				MetricType string
				Value      float64
				RecordedAt string
				Unit       string
			}
			DateAndType []struct {
				MetricID   string
				MetricType string
				Value      float64
				RecordedAt string
				Unit       string
			}
		}

		c.MustPost(`query get_metrics{
			type1:getHealthMetrics(metricType: "type1"){
				metricId
				metricType
				value
				recordedAt
				unit
			}
			startDate:getHealthMetrics(startDate: "2024-02-00T18:04:05.000"){
				metricId
				metricType
				value
				recordedAt
				unit
			}
			endDate:getHealthMetrics(endDate: "2024-02-00T18:04:05.000"){
				metricId
				metricType
				value
				recordedAt
				unit
			}
			rangeDate:getHealthMetrics(startDate: "2024-01-00T18:04:05.000", endDate: "2024-02-00T18:04:05.000"){
				metricId
				metricType
				value
				recordedAt
				unit
			}
			dateAndType:getHealthMetrics(
				startDate: "2024-01-00T18:04:05.000", 
				endDate: "2024-08-00T18:04:05.000",
				metricType: "type2"
			){
				metricId
				metricType
				value
				recordedAt
				unit
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))

		require.Equal(t, 1, len(response.Type1))
		require.Equal(t, metricId1, response.Type1[0].MetricID)

		require.Equal(t, 1, len(response.StartDate))
		require.Equal(t, metricId2, response.StartDate[0].MetricID)

		require.Equal(t, 1, len(response.EndDate))
		require.Equal(t, metricId1, response.EndDate[0].MetricID)

		require.Equal(t, 1, len(response.RangeDate))
		require.Equal(t, metricId1, response.RangeDate[0].MetricID)

		require.Equal(t, 1, len(response.DateAndType))
		require.Equal(t, metricId2, response.DateAndType[0].MetricID)
	})

	t.Run("Update metrics", func(t *testing.T) {
		var response struct {
			UpdateHealthMetric struct {
				MetricID string
				Message  string
			}
		}

		c.MustPost(`mutation update_metric($metricId:String!){
			updateHealthMetric(metricId:$metricId, value: 21.0, unit: "g/l"){
				metricId
				message
			}
		}`, &response, client.Var("metricId", metricId1),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, metricId1, response.UpdateHealthMetric.MetricID)
		require.Equal(t, "Health metric updated successfully", response.UpdateHealthMetric.Message)

		// check illegal updates
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		err := c.Post(`mutation update_metric($metricId:String!){
			updateHealthMetric(metricId:$metricId, value: 11.0, unit: "g/l"){
				metricId
				message
			}
		}`, &response, client.Var("metricId", "7492HSKFHE7423"),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "illegal health metric id", err_msg[0].Message)

		err = c.Post(`mutation update_metric($metricId:String!){
			updateHealthMetric(metricId:$metricId, value: 10.0, unit: "g/l"){
				metricId
				message
			}
		}`, &response, client.Var("metricId", "health_metric:HFIW74329FHHR4983"),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "invalid id, no user associated heath metric object found", err_msg[0].Message)

		// query to check that the previous update has been realized
		var response_query struct {
			GetHealthMetrics []struct {
				MetricID   string
				MetricType string
				Value      float64
				RecordedAt string
				Unit       string
			}
		}
		c.MustPost(`query get_metrics{
			getHealthMetrics {
				metricId
				metricType
				value
				recordedAt
				unit
			}
		}`, &response_query, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, 2, len(response_query.GetHealthMetrics))
		for _, metric := range response_query.GetHealthMetrics {
			if metric.MetricID == metricId1 {
				require.Equal(t, "g/l", metric.Unit)
				require.Equal(t, 21.0, metric.Value)
				require.Equal(t, "type1", metric.MetricType)
			} else if metric.MetricID == metricId2 {
				require.Equal(t, "", metric.Unit)
				require.Equal(t, 1.03, metric.Value)
				require.Equal(t, "type2", metric.MetricType)
			} else {
				require.Equal(t, "query returned id which was not created", "error")
			}
		}
	})

	t.Run("delete metric", func(t *testing.T) {
		var response struct {
			DeleteHealthMetric struct {
				Message string
			}
		}
		c.MustPost(`mutation delete_metric($metricId:String!){
			deleteHealthMetric(metricId:$metricId){
				message
			}
		}`, &response, client.Var("metricId", metricId1),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, fmt.Sprintf("Health metric %s of type %s deleted successfully", metricId1, "type1"),
			response.DeleteHealthMetric.Message)

		var response_query struct {
			GetHealthMetrics []struct {
				MetricID   string
				MetricType string
				Value      float64
				RecordedAt string
				Unit       string
			}
		}
		c.MustPost(`query get_metrics{
				getHealthMetrics {
					metricId
					metricType
					value
					recordedAt
					unit
				}
			}`, &response_query, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, 1, len(response_query.GetHealthMetrics))
		require.Equal(t, metricId2, response_query.GetHealthMetrics[0].MetricID)

		// illegal delete requests
		// testing for illegal delete ops
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}
		var responses struct {
			A struct {
				Message string
			}
			B struct {
				Message string
			}
		}

		err := c.Post(`mutation delete_metric($metricId1:String!, $metricId2:String!){
			a:deleteHealthMetric(metricId:$metricId1){
				message
			}
			b:deleteHealthMetric(metricId:$metricId2){
				message
			}
		}`, &responses, client.Var("metricId1", "health_metric:7442983HSDKF"),
			client.Var("metricId2", "7892FHKWIRUI89"),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "invalid id, no health metric object found", err_msg[0].Message)
		require.Equal(t, "illegal health metric id", err_msg[1].Message)

		err = c.Post(`mutation delete_metric($metricId:String!){
			a:deleteHealthMetric(metricId:$metricId){
				message
			}
		}`, &response, client.Var("metricId", metricId2))
		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})

	DeleteUser(t, c, user)
}
