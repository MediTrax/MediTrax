package tests

import (
	"encoding/json"
	"fmt"
	"testing"

	"github.com/99designs/gqlgen/client"
	"github.com/stretchr/testify/require"
)

func TestHealthRiskAssessment(t *testing.T) {
	c := client.New(NewServer())
	user := CreateUserAndLogin(t, c)

	var assessmentID string

	t.Run("Create Health Risk Assessment", func(t *testing.T) {
		var response struct {
			CreateHealthRiskAssessment struct {
				AssessmentID    string
				RiskLevel       string
				Recommendations string
			}
		}

		c.MustPost(`mutation create_health_risk {
			createHealthRiskAssessment(
				questionnaireData: "{'age': 30, 'smoking': true, 'exercise': 'rarely'}"
			) {
				assessmentId
				riskLevel
				recommendations
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))

		require.NotEmpty(t, response.CreateHealthRiskAssessment.AssessmentID)
		require.Equal(t, "Medium", response.CreateHealthRiskAssessment.RiskLevel)
		assessmentID = response.CreateHealthRiskAssessment.AssessmentID
	})

	t.Run("Try creating assessment without login", func(t *testing.T) {
		var err_msg []struct {
			Message string `json:"message"`
			Path    string `json:"path"`
		}

		err := c.Post(`mutation create_health_risk {
			createHealthRiskAssessment(
				questionnaireData: "{'age': 30, 'smoking': false, 'exercise': 'often'}"
			) {
				assessmentId
				riskLevel
				recommendations
			}
		}`, nil)

		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})

	t.Run("Get Latest Health Risk Assessment", func(t *testing.T) {
		var response struct {
			GetHealthRiskAssessment struct {
				AssessmentID    string
				RiskLevel       string
				Recommendations string
			}
		}

		c.MustPost(`query get_latest_health_risk {
			getHealthRiskAssessment {
				assessmentId
				riskLevel
				recommendations
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))

		require.Equal(t, assessmentID, response.GetHealthRiskAssessment.AssessmentID)
		require.Equal(t, "Medium", response.GetHealthRiskAssessment.RiskLevel)
	})

	t.Run("Update Health Risk Assessment", func(t *testing.T) {
		var response struct {
			UpdateHealthRiskAssessment struct {
				AssessmentID    string
				RiskLevel       string
				Recommendations string
			}
		}

		// 正确地使用变量 $questionnaireData
		query := `mutation update_health_risk($assessmentId: String!, $questionnaireData: String!) {
			updateHealthRiskAssessment(
				assessmentId: $assessmentId,
				questionnaireData: $questionnaireData
			) {
				assessmentId
				riskLevel
				recommendations
			}
		}`

		// 提供测试所需的变量
		vars := map[string]interface{}{
			"assessmentId":      assessmentID, // 使用小写的 "assessmentId"
			"questionnaireData": `{"age": 30, "smoking": false, "exercise": "regularly"}`,
		}

		// 执行测试查询
		c.MustPost(query, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)), client.Var("assessmentId", vars["assessmentId"]), client.Var("questionnaireData", vars["questionnaireData"]))

		// 验证返回结果
		require.Equal(t, assessmentID, response.UpdateHealthRiskAssessment.AssessmentID)
		require.Equal(t, "Medium", response.UpdateHealthRiskAssessment.RiskLevel)
		require.Equal(t, "Monitor lifestyle and consult a healthcare provider.", response.UpdateHealthRiskAssessment.Recommendations)
	})

	t.Run("Illegal Update and Access Tests", func(t *testing.T) {
		var response struct {
			UpdateHealthRiskAssessment struct {
				AssessmentID    string
				RiskLevel       string
				Recommendations string
			}
		}

		query := `mutation update_health_risk($assessmentId: String!, $questionnaireData: String!) {
			updateHealthRiskAssessment(
				assessmentId: $assessmentId,
				questionnaireData: $questionnaireData
			) {
				assessmentId
				riskLevel
				recommendations
			}
		}`

		// 使用小写的 "assessmentId"
		vars := map[string]interface{}{
			"assessmentId":      assessmentID,
			"questionnaireData": `{"age": 30, "smoking": false, "exercise": "regularly"}`,
		}

		// Execute query
		c.MustPost(query, &response,
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)),
			client.Var("assessmentId", vars["assessmentId"]),
			client.Var("questionnaireData", vars["questionnaireData"]))

		// Check if response is empty
		if response.UpdateHealthRiskAssessment.AssessmentID == "" {
			t.Fatal("No results returned for updateHealthRiskAssessment query")
		}

		// Access result safely
		result := response.UpdateHealthRiskAssessment
		require.Equal(t, vars["assessmentId"], result.AssessmentID)
		require.Equal(t, "Medium", result.RiskLevel)
		require.Equal(t, "Monitor lifestyle and consult a healthcare provider.", result.Recommendations)
	})

	DeleteUser(t, c, user)
}
