package tests

import (
	"fmt"
	"meditrax/graph/model"
	"testing"

	"github.com/99designs/gqlgen/client"
	"github.com/stretchr/testify/require"
)

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
				AssessmentID    string
				RiskLevel       string
				Recommendations string
			}
		}

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
				assessmentId
				riskLevel
				recommendations
			}
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
				RiskLevel       string
				Recommendations string
			}
		}

		// 获取评估记录
		c.MustPost(`query getHealthRiskAssessment {
			getHealthRiskAssessment {
				assessmentId
				questionnaireData {
					questionId
					answer
				}
				riskLevel
				recommendations
			}
		}`, &response, client.AddHeader("Authorization", fmt.Sprintf("Bearer %s", user.AccessToken)))
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
	})

	DeleteUser(t, c, user)
}
