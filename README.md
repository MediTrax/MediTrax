//panic(fmt.Errorf("not implemented: GetHealthRiskAssessment - getHealthRiskAssessment"))
	user := middlewares.ForContext(ctx)
	if user == nil {
		return nil, fmt.Errorf("access denied")
	}
	// query for all the medications associated with the user
	result, err := database.DB.Query(
		`SELECT * FROM health_assessment WHERE user_id = $user_id;`,
		map[string]interface{}{
			"user_id": user.ID,
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
		}
		AssessmentDetails = append(AssessmentDetails, AssessmentDetail)
	}

	return AssessmentDetails, nil