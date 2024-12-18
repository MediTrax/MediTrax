package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.55

import (
	"context"
	"fmt"
	"meditrax/graph/database"
	middlewares "meditrax/graph/middleware"
	"meditrax/graph/model"
	"meditrax/graph/utils"
	"time"

	"github.com/google/uuid"
	surrealdb "github.com/surrealdb/surrealdb.go"
)

// EvaluateHealthRiskAssessment is the resolver for the evaluateHealthRiskAssessment field.
func (r *mutationResolver) EvaluateHealthRiskAssessment(ctx context.Context, filledQuestionnaire model.FilledQuestionnaire) (*model.EvaluateHealthRiskAssessmentResponse, error) {
	//panic(fmt.Errorf("not implemented: EvaluateHealthRiskAssessment - evaluateHealthRiskAssessment"))
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}

	riskLevel, recommendations := utils.EvaluateHealthRisk(filledQuestionnaire.Responses)
	// create new HealthMetric record
	result, err := database.DB.Query(
		`CREATE ONLY health_assessment:ulid()
		SET
		userId=$userId,
		questionnaireData=$questionnaireData,
		riskLevel=$riskLevel,
		recommendations=$recommendations,
		createdAt=<datetime>$now;
		`,
		map[string]interface{}{
			"userId":            user.ID,
			"questionnaireData": filledQuestionnaire.Responses,
			"riskLevel":         riskLevel,
			"recommendations":   recommendations,
			"now":               time.Now().UTC(),
		},
	)
	if err != nil {
		return nil, err
	}
	newassessment, err := surrealdb.SmartUnmarshal[model.HealthRiskAssessment](result, nil)
	if err != nil {
		return nil, err
	}
	// create response
	response := &model.EvaluateHealthRiskAssessmentResponse{
		AssessmentID:    newassessment.ID,
		RiskLevel:       newassessment.RiskLevel,
		Recommendations: newassessment.Recommendations,
	}
	return response, nil
}

// GetHealthRiskAssessment is the resolver for the getHealthRiskAssessment field.
func (r *queryResolver) GetHealthRiskAssessment(ctx context.Context) ([]*model.HealthRiskAssessmentDetailResponse, error) {
	//panic(fmt.Errorf("not implemented: GetHealthRiskAssessment - getHealthRiskAssessment"))
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}
	// query for all the medications associated with the user
	result, err := database.DB.Query(
		`SELECT * FROM health_assessment WHERE userId = $userId;`,
		map[string]interface{}{
			"userId": user.ID,
		},
	)
	if err != nil {
		return nil, err
	}

	HealthRiskAssessment, err := surrealdb.SmartUnmarshal[[]model.HealthRiskAssessment](result, nil)
	if err != nil {
		return nil, err
	}

	// loop through the medications, convert them into MedicationDetails, then return the converted list and nil
	var AssessmentDetails []*model.HealthRiskAssessmentDetailResponse
	for _, ass := range HealthRiskAssessment {
		AssessmentDetail := &model.HealthRiskAssessmentDetailResponse{
			AssessmentID:      ass.ID,
			QuestionnaireData: ass.QuestionnaireData,
			RiskLevel:         ass.RiskLevel,
			Recommendations:   ass.Recommendations,
			CreatedAt:         ass.CreatedAt,
		}
		AssessmentDetails = append(AssessmentDetails, AssessmentDetail)
	}

	return AssessmentDetails, nil
}

// GetHealthRiskAssessmentQuestion is the resolver for the getHealthRiskAssessmentQuestion field.
func (r *queryResolver) GetHealthRiskAssessmentQuestion(ctx context.Context) (*model.QuestionnaireObject, error) {
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}

	questionnaireId := uuid.New().String()
	// 返回完整的问卷问题
	questions := []*model.Question{
		{QuestionID: 1, Question: "您是否有高血压病史？", QuestionType: 0, Choices: []string{"是", "否"}},
		{QuestionID: 2, Question: "您是否有糖尿病病史？", QuestionType: 0, Choices: []string{"是", "否"}},
		{QuestionID: 3, Question: "您是否有家族肾病史？", QuestionType: 0, Choices: []string{"是", "否"}},
		{QuestionID: 4, Question: "您的年龄为", QuestionType: 3, Choices: []string{}},
		{QuestionID: 5, Question: "您的休息情况是否正常？", QuestionType: 0, Choices: []string{"是", "否"}},
		{QuestionID: 6, Question: "您是否有水肿、尿频、尿急等排尿异常症状？", QuestionType: 0, Choices: []string{"是", "否"}},
		{QuestionID: 7, Question: "您的体重是否过重（BMI大于25）？", QuestionType: 0, Choices: []string{"是", "否"}},
		{QuestionID: 8, Question: "您是否有长期使用肾毒性药物的历史？", QuestionType: 0, Choices: []string{"是", "否"}},
		{QuestionID: 9, Question: "您最近一次的尿检结果是否显示尿蛋白或血尿？", QuestionType: 0, Choices: []string{"是", "否"}},
		{QuestionID: 10, Question: "您是否经常感到疲劳、虚弱？", QuestionType: 0, Choices: []string{"是", "否"}},
		{QuestionID: 11, Question: "您是否有过肾功能衰竭或其他严重肾脏问题的诊断记录？", QuestionType: 0, Choices: []string{"是", "否"}},
	}

	result, err := database.DB.Query(
		`CREATE ONLY questionnare_object:ulid()
		SET
		questionnaireId=$questionnaireId,
		data=$data,
		createdAt=$createdAt;`,
		map[string]interface{}{
			"questionnaire_id": questionnaireId,
			"data":             questions,
			"createdAt":        time.Now().UTC(),
		},
	)
	if err != nil {
		return nil, fmt.Errorf("failed to insert questionnaire into database: %v", err)
	}

	// 使用 SmartUnmarshal 将数据库返回的数据解析到模型中
	newquestionnaire, err := surrealdb.SmartUnmarshal[model.QuestionnaireObject](result, nil)
	if err != nil {
		return nil, fmt.Errorf("failed to unmarshal questionnaire data: %v", err)
	}
	response := &model.QuestionnaireObject{
		QuestionnaireID: newquestionnaire.QuestionnaireID,
		Data:            newquestionnaire.Data,
	}

	// 返回问卷对象
	return response, nil
}
