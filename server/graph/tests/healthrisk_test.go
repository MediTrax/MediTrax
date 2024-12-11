package tests

import (
<<<<<<< HEAD
	"encoding/json"
	"fmt"
=======
	"fmt"
	"meditrax/graph/model"
>>>>>>> 01096166741546756a9456fc584388602358902c
	"testing"

	"github.com/99designs/gqlgen/client"
	"github.com/stretchr/testify/require"
)

<<<<<<< HEAD
func TestHealthRiskAssessment(t *testing.T) {
	c := client.New(NewServer())
	user := CreateUserAndLogin(t, c)

	var assessmentID string

	t.Run("Create Health Risk Assessment", func(t *testing.T) {
		var response struct {
			CreateHealthRiskAssessment struct {
=======
// 测试评估肾病风险
func TestEvaluateHealthRiskAssessment(t *testing.T) {
	c := client.New(NewServer())
	user := CreateUserAndLogin(t, c)

	var questionnaireId int
	var assessmentId1 string
	var assessmentId2 string

	t.Run("Evaluate Health Risk Assessment", func(t *testing.T) {
		var response struct {
			EvaluateHealthRiskAssessment struct {
>>>>>>> 01096166741546756a9456fc584388602358902c
				AssessmentID    string
				RiskLevel       string
				Recommendations string
			}
		}

<<<<<<< HEAD
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
=======
		// 创建评估填充问卷数据
		filledQuestionnaire := model.FilledQuestionnaire{
			QuestionnaireID: questionnaireId,
			Responses: []*model.Response{
				{QuestionID: 1, Choice: "是"},
				{QuestionID: 2, Choice: "否"},
				{QuestionID: 3, Choice: "是"},
				{QuestionID: 4, Choice: "是"},
				{QuestionID: 5, Choice: "是"},
				{QuestionID: 6, Choice: "否"},
				{QuestionID: 7, Choice: "是"},
				{QuestionID: 8, Choice: "否"},
				{QuestionID: 9, Choice: "是"},
				{QuestionID: 10, Choice: "否"},
			},
		}

		// 调用评估接口
		c.MustPost(`mutation evaluateHealthRiskAssessment($filledQuestionnaire: FilledQuestionnaire!) {
			evaluateHealthRiskAssessment(filledQuestionnaire: $filledQuestionnaire) {
>>>>>>> 01096166741546756a9456fc584388602358902c
				assessmentId
				riskLevel
				recommendations
			}
<<<<<<< HEAD
		}`, nil)

		json.Unmarshal(json.RawMessage(err.Error()), &err_msg)
		require.Equal(t, "access denied", err_msg[0].Message)
	})

	t.Run("Get Latest Health Risk Assessment", func(t *testing.T) {
		var response struct {
			GetHealthRiskAssessment struct {
				AssessmentID    string
=======
		}`, &response, client.Var("filledQuestionnaire", filledQuestionnaire),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))

		require.NotEmpty(t, response.EvaluateHealthRiskAssessment.AssessmentID)
		require.Equal(t, "高风险", response.EvaluateHealthRiskAssessment.RiskLevel)
		require.Equal(t, "请尽早就医，做肾功能检查。", response.EvaluateHealthRiskAssessment.Recommendations)
		assessmentId1 = response.EvaluateHealthRiskAssessment.AssessmentID
		filledQuestionnaire1 := model.FilledQuestionnaire{
			QuestionnaireID: questionnaireId,
			Responses: []*model.Response{
				{QuestionID: 1, Choice: "否"},
				{QuestionID: 2, Choice: "否"},
				{QuestionID: 3, Choice: "否"},
				{QuestionID: 4, Choice: "是"},
				{QuestionID: 5, Choice: "是"},
				{QuestionID: 6, Choice: "否"},
				{QuestionID: 7, Choice: "否"},
				{QuestionID: 8, Choice: "否"},
				{QuestionID: 9, Choice: "是"},
				{QuestionID: 10, Choice: "否"},
			},
		}
		// 调用评估接口
		c.MustPost(`mutation evaluateHealthRiskAssessment($filledQuestionnaire: FilledQuestionnaire!) {
			evaluateHealthRiskAssessment(filledQuestionnaire: $filledQuestionnaire) {
				assessmentId
				riskLevel
				recommendations
			}
		}`, &response, client.Var("filledQuestionnaire", filledQuestionnaire1),
			client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))

		require.NotEmpty(t, response.EvaluateHealthRiskAssessment.AssessmentID)
		require.Equal(t, "低风险", response.EvaluateHealthRiskAssessment.RiskLevel)
		require.Equal(t, "保持健康饮食，定期体检。", response.EvaluateHealthRiskAssessment.Recommendations)
		assessmentId2 = response.EvaluateHealthRiskAssessment.AssessmentID
		require.NotEqual(t, assessmentId1, assessmentId2)
	})

	t.Run("Get Health Risk Assessment", func(t *testing.T) {
		var response struct {
			GetHealthRiskAssessment []struct {
				AssessmentID      string
				QuestionnaireData []struct {
					QuestionId int
					Choice     string
					Answer     string
				}
>>>>>>> 01096166741546756a9456fc584388602358902c
				RiskLevel       string
				Recommendations string
			}
		}

<<<<<<< HEAD
		c.MustPost(`query get_latest_health_risk {
			getHealthRiskAssessment {
				assessmentId
=======
		// 获取评估记录
		c.MustPost(`query getHealthRiskAssessment {
			getHealthRiskAssessment {
				assessmentId
				questionnaireData {
					questionId
					answer
				}
>>>>>>> 01096166741546756a9456fc584388602358902c
				riskLevel
				recommendations
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
<<<<<<< HEAD

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
=======
		require.NotEmpty(t, response.GetHealthRiskAssessment[0].AssessmentID)
		require.NotEmpty(t, response.GetHealthRiskAssessment[0].RiskLevel)
		require.NotEmpty(t, response.GetHealthRiskAssessment[0].Recommendations)
	})
	t.Run("Get Health Assessment Questions", func(t *testing.T) {
		var response struct {
			GetHealthRiskAssessmentQuestion struct {
				QuestionnaireID int
				Data            []struct {
					QuestionId   int
					Question     string
					QuestionType int
					Choices      []string
				}
			}
		}
		c.MustPost(`query getHealthRiskAssessmentQuestion{
			getHealthRiskAssessmentQuestion {
				questionnaireId
				data{
					questionId
					question
  					questionType 
  					choices 		
				}
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
		require.Equal(t, 0, response.GetHealthRiskAssessmentQuestion.QuestionnaireID)
		questionnaireId = response.GetHealthRiskAssessmentQuestion.QuestionnaireID
>>>>>>> 01096166741546756a9456fc584388602358902c
	})

	DeleteUser(t, c, user)
}
