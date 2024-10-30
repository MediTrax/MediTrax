package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.55

import (
	"context"
	"encoding/json"
	"fmt"
	"meditrax/graph/database"
	"meditrax/graph/model"
	"meditrax/graph/utils"
	"strings"

	surrealdb "github.com/surrealdb/surrealdb.go"
)

// CreateUser is the resolver for the createUser field.
func (r *mutationResolver) CreateUser(ctx context.Context, email string, password string, username string, role string) (*model.CreateUserResponse, error) {
	// Check for unique email and username
	result, err := database.DB.Query(`
    SELECT * FROM user WHERE name=$name OR email=$email;`, map[string]interface{}{
		"name":  username,
		"email": strings.ToLower(email),
	})

	if err != nil {
		return nil, err
	}
	users, err := surrealdb.SmartUnmarshal[[]model.User](result, nil)
	if err != nil {
		return nil, err
	}
	if len(users) > 0 {
		return nil, fmt.Errorf("email and username should be unique")
	}

	// Create the new user
	result, err = database.DB.Query(
		`CREATE ONLY user:ulid() 
		SET name=$username,
		email=$email,
		password=crypto::argon2::generate($password),
		role=$role,
		createdAt=time::now(),
		updatedAt=time::now();`, map[string]interface{}{
			"username": username,
			"email":    strings.ToLower(email),
			"password": password,
			"role":     role,
		})
	if err != nil {
		return nil, err
	}

	newUser, err := surrealdb.SmartUnmarshal[model.User](result, nil)
	if err != nil {
		return nil, err
	}

	response := &model.CreateUserResponse{
		UserID:  newUser.ID,
		Message: fmt.Sprintf("User %s created successfully", newUser.Name),
	}

	return response, nil
}

// LoginUser is the resolver for the loginUser field.
func (r *mutationResolver) LoginUser(ctx context.Context, email string, password string) (*model.LoginUserResponse, error) {
	panic(fmt.Errorf("not implemented: LoginUser - loginUser"))
}

// GetUser is the resolver for the getUser field.
func (r *mutationResolver) GetUser(ctx context.Context, userID string) (*model.UserDetailResponse, error) {
	panic(fmt.Errorf("not implemented: GetUser - getUser"))
}

// UpdateUser is the resolver for the updateUser field.
func (r *mutationResolver) UpdateUser(ctx context.Context, userID string, name *string, email *string, password *string) (*model.UpdateUserResponse, error) {
	panic(fmt.Errorf("not implemented: UpdateUser - updateUser"))
}

// DeleteUser is the resolver for the deleteUser field.
func (r *mutationResolver) DeleteUser(ctx context.Context, userID string) (*model.DeleteUserResponse, error) {
	panic(fmt.Errorf("not implemented: DeleteUser - deleteUser"))
}

// RequestPasswordReset is the resolver for the requestPasswordReset field.
func (r *mutationResolver) RequestPasswordReset(ctx context.Context, email string) (*model.RequestPasswordResetResponse, error) {
	panic(fmt.Errorf("not implemented: RequestPasswordReset - requestPasswordReset"))
}

// ResetPassword is the resolver for the resetPassword field.
func (r *mutationResolver) ResetPassword(ctx context.Context, token string, newPassword string) (*model.ResetPasswordResponse, error) {
	panic(fmt.Errorf("not implemented: ResetPassword - resetPassword"))
}

// CreateHealthRiskAssessment is the resolver for the createHealthRiskAssessment field.
func (r *mutationResolver) CreateHealthRiskAssessment(ctx context.Context, userID string, questionnaireData string) (*model.HealthRiskAssessmentResponse, error) {
	panic(fmt.Errorf("not implemented: CreateHealthRiskAssessment - createHealthRiskAssessment"))
}

// GetHealthRiskAssessment is the resolver for the getHealthRiskAssessment field.
func (r *mutationResolver) GetHealthRiskAssessment(ctx context.Context, userID string) (*model.HealthRiskAssessmentDetailResponse, error) {
	panic(fmt.Errorf("not implemented: GetHealthRiskAssessment - getHealthRiskAssessment"))
}

// UpdateHealthRiskAssessment is the resolver for the updateHealthRiskAssessment field.
func (r *mutationResolver) UpdateHealthRiskAssessment(ctx context.Context, assessmentID string, questionnaireData string) (*model.UpdateHealthRiskAssessmentResponse, error) {
	panic(fmt.Errorf("not implemented: UpdateHealthRiskAssessment - updateHealthRiskAssessment"))
}

// AddMedication is the resolver for the addMedication field.
func (r *mutationResolver) AddMedication(ctx context.Context, userID string, name string, dosage float64, unit string, frequency string, inventory float64) (*model.AddMedicationResponse, error) {
	if len(userID) == 0 || !strings.HasPrefix(userID, "user:") {
		return nil, fmt.Errorf("user id should start with 'user:' and be non-empty")
	}

	// query database for medications for the same user with the same name
	result, err := database.DB.Query(
		`SELECT * FROM medication WHERE name=$name AND user_id=$user_id;`,
		map[string]interface{}{
			"name":    name,
			"user_id": userID,
		},
	)
	if err != nil {
		return nil, err
	}

	medications, err := surrealdb.SmartUnmarshal[[]model.Medication](result, nil)
	if err != nil {
		return nil, err
	}
	if len(medications) > 0 {
		return nil, fmt.Errorf("identical medication name already exists for the user, please use update medication instead")
	}

	if _, _, err := utils.FrequencyParser(frequency); err != nil {
		return nil, fmt.Errorf("invalid frequency format %s for medication %s", frequency, name)
	}

	// create new Medication record
	result, err = database.DB.Query(
		`CREATE ONLY medication:ulid()
		SET name=$name,
		dosage=$dosage,
		unit=$unit,
		frequency=$frequency,
		inventory=$inventory,
		user_id=$user_id,
		created_at=time::now(),
		updated_at=time::now();
		`,
		map[string]interface{}{
			"name":      name,
			"dosage":    dosage,
			"unit":      unit,
			"frequency": frequency,
			"inventory": inventory,
			"user_id":   userID,
		},
	)
	if err != nil {
		return nil, err
	}

	// unmarshall the returned results
	newMedication, err := surrealdb.SmartUnmarshal[model.Medication](result, nil)
	if err != nil {
		return nil, err
	}
	response := &model.AddMedicationResponse{
		MedicationID: newMedication.ID,
		Message:      fmt.Sprintf("Medication %s added successfully", newMedication.Name),
	}

	return response, nil
}

// GetMedications is the resolver for the getMedications field.
func (r *mutationResolver) GetMedications(ctx context.Context, userID string) ([]*model.MedicationDetail, error) {
	if len(userID) == 0 || !strings.HasPrefix(userID, "user:") {
		return nil, fmt.Errorf("user id should start with 'user:' and be non-empty")
	}

	result, err := database.DB.Query(
		`SELECT * FROM medication WHERE user_id = $user_id;`,
		map[string]interface{}{
			"user_id": userID,
		},
	)
	if err != nil {
		return nil, err
	}

	medications, err := surrealdb.SmartUnmarshal[[]model.Medication](result, nil)
	if err != nil {
		return nil, err
	}

	// loop through the medications, convert them into MedicationDetails, then return the converted list and nil
	var medicationDetails []*model.MedicationDetail
	for _, med := range medications {
		medicationDetail := &model.MedicationDetail{
			MedicationID: med.ID,
			Name:         med.Name,
			Dosage:       fmt.Sprintf("%g", med.Dosage), // Convert dosage to string
			Unit:         med.Unit,
			Frequency:    med.Frequency,
			Inventory:    med.Inventory,
		}
		medicationDetails = append(medicationDetails, medicationDetail)
	}

	return medicationDetails, nil
}

// UpdateMedication is the resolver for the updateMedication field.
func (r *mutationResolver) UpdateMedication(ctx context.Context, medicationID string, name *string, dosage *float64, unit *string, frequency *string, inventory *float64) (*model.UpdateMedicationResponse, error) {
	if len(medicationID) == 0 || !strings.HasPrefix(medicationID, "medication:") {
		return nil, fmt.Errorf("medication id should start with 'medication:' and be non-empty")
	}

	// Initialize a map to hold the update values
	updateValues := map[string]interface{}{"id": medicationID}

	// Prepare the fields to be updated
	updateFields := []string{}
	if name != nil {
		updateValues["name"] = *name
		updateFields = append(updateFields, "name = $name")
	}
	if dosage != nil {
		updateValues["dosage"] = *dosage
		updateFields = append(updateFields, "dosage = $dosage")
	}
	if unit != nil {
		updateValues["unit"] = *unit
		updateFields = append(updateFields, "unit = $unit")
	}
	if frequency != nil {
		// Validate the frequency format
		if _, _, err := utils.FrequencyParser(*frequency); err != nil {
			return nil, err // Return the error if format is invalid
		}
		updateValues["frequency"] = *frequency
		updateFields = append(updateFields, "frequency = $frequency")
	}
	if inventory != nil {
		updateValues["inventory"] = *inventory
		updateFields = append(updateFields, "inventory = $inventory")
	}

	// Construct the final query with the medicationID in quotes
	query := fmt.Sprintf("UPDATE $id SET %s;", strings.Join(updateFields, ", "))

	result, err := database.DB.Query(query, updateValues)
	if err != nil {
		return nil, err
	}

	results, err := surrealdb.SmartUnmarshal[[]model.Medication](result, nil)

	if err != nil {
		return nil, err
	}

	if len(results) == 0 {
		return nil, fmt.Errorf("invalid id, no medication object found")
	}

	response := &model.UpdateMedicationResponse{
		MedicationID: results[0].ID,
		Message:      "Medication updated successfully",
	}

	// Return the response with the medication ID and a success message
	return response, nil
}

// DeleteMedication is the resolver for the deleteMedication field.
func (r *mutationResolver) DeleteMedication(ctx context.Context, medicationID string) (*model.DeleteMedicationResponse, error) {
	if len(medicationID) == 0 || !strings.HasPrefix(medicationID, "medication:") {
		return nil, fmt.Errorf("medication id should start with 'medication:' and be non-empty")
	}

	// Execute the query
	result, err := database.DB.Query(
		`DELETE $id RETURN BEFORE;`,
		map[string]interface{}{
			"id": medicationID,
		},
	)
	if err != nil {
		return nil, err // Return the error if the query fails
	}

	results, err := surrealdb.SmartUnmarshal[[]model.Medication](result, nil)
	if err != nil {
		return nil, err
	}

	if len(results) == 0 {
		return nil, fmt.Errorf("invalid id, no medication object found")
	}

	response := &model.DeleteMedicationResponse{
		Message: fmt.Sprintf("Medication %s with name %s deleted successfully", results[0].ID, results[0].Name),
	}

	// Return the response with the medication ID and a success message
	return response, nil
}

// CreateMedicationReminder is the resolver for the createMedicationReminder field.
func (r *mutationResolver) CreateMedicationReminder(ctx context.Context, userID string, medicationID string, reminderTime string) (*model.CreateMedicationReminderResponse, error) {
	if len(userID) == 0 || !strings.HasPrefix(userID, "user:") {
		return nil, fmt.Errorf("user id should start with 'user:' and be non-empty")
	}
	if len(medicationID) == 0 || !strings.HasPrefix(medicationID, "medication:") {
		return nil, fmt.Errorf("user id should start with 'user:' and be non-empty")
	}

	result, err := database.DB.Query(
		`SELECT * FROM $medication_id WHERE user_id = $user_id;`,
		map[string]interface{}{
			"medication_id": medicationID,
			"user_id":       userID,
		},
	)
	if err != nil {
		return nil, err
	}

	medications, err := surrealdb.SmartUnmarshal[[]model.Medication](result, nil)
	if err != nil {
		return nil, err
	}
	if len(medications) < 1 {
		return nil, fmt.Errorf("wrong user or medication id")
	}

	// query database for medications with the same reminder time
	result, err = database.DB.Query(
		`SELECT * FROM medication_reminder 
		WHERE medication_id=$medication_id AND user_id=$user_id AND reminder_time=$reminder_time;`,
		map[string]interface{}{
			"medication_id": medicationID,
			"user_id":       userID,
			"reminder_time": reminderTime,
		},
	)
	if err != nil {
		return nil, err
	}

	a, err := json.Marshal(result)
	if err != nil {
		return nil, err
	}
	println(string(a))

	reminders, err := surrealdb.SmartUnmarshal[[]model.MedicationReminder](result, nil)
	if err != nil {
		return nil, err
	}
	if len(reminders) > 0 {
		return nil, fmt.Errorf("identical medication reminder for the user already exists")
	}

	result, err = database.DB.Query(
		`CREATE ONLY medication_reminder:ulid()
		SET medication_id=$medication_id,
		user_id=$user_id,
		reminder_time=$reminder_time,
		is_taken=false,
		created_at=time::now()
		`,
		map[string]interface{}{
			"medication_id": medicationID,
			"user_id":       userID,
			"reminder_time": reminderTime,
		},
	)
	if err != nil {
		return nil, err
	}

	newReminder, err := surrealdb.SmartUnmarshal[model.MedicationReminder](result, nil)
	if err != nil {
		return nil, err
	}

	response := &model.CreateMedicationReminderResponse{
		ReminderID: newReminder.ID,
		Message:    "new reminder created successfully",
	}
	return response, nil
}

// UpdateMedicationReminder is the resolver for the updateMedicationReminder field.
func (r *mutationResolver) UpdateMedicationReminder(ctx context.Context, reminderID string, reminderTime *string, isTaken *bool) (*model.UpdateMedicationReminderResponse, error) {
	if len(reminderID) == 0 || !strings.HasPrefix(reminderID, "medication_reminder:") {
		return nil, fmt.Errorf("medication reminder id should start with 'medication_reminder:' and be non-empty")
	}

	result, err := database.DB.Query(
		`SELECT * FROM medication_reminder WHERE id=$reminder_id;`,
		map[string]interface{}{
			"reminder_id": reminderID,
		},
	)
	if err != nil {
		return nil, err
	}

	a, err := json.Marshal(result)
	if err != nil {
		return nil, err
	}
	println(string(a))

	reminders, err := surrealdb.SmartUnmarshal[[]model.MedicationReminder](result, nil)
	if err != nil {
		return nil, err
	}
	if len(reminders) < 1 {
		return nil, fmt.Errorf("wrong medication reminder id, no reminder found")
	}

	remBefore := reminders[0]

	// Initialize a map to hold the update values
	updateValues := map[string]interface{}{"id": reminderID}

	// Prepare the fields to be updated
	updateFields := []string{}
	if reminderTime != nil {
		updateValues["reminder_time"] = *reminderTime
		updateFields = append(updateFields, "reminder_time = $reminder_time")
	}
	if isTaken != nil {
		updateValues["is_taken"] = *isTaken
		updateFields = append(updateFields, "is_taken = $is_taken")
	}

	// Construct the final query with the medicationID in quotes
	query := fmt.Sprintf("UPDATE $id SET %s;", strings.Join(updateFields, ", "))

	result, err = database.DB.Query(query, updateValues)
	if err != nil {
		return nil, err
	}

	a, err = json.Marshal(result)
	if err != nil {
		return nil, err
	}
	println(string(a))

	results, err := surrealdb.SmartUnmarshal[[]*model.MedicationReminder](result, nil)
	if err != nil {
		return nil, err
	}

	println("over")

	if len(results) == 0 {
		return nil, fmt.Errorf("invalid id, no medication object found")
	}

	// logic for when the reminder changes from not taken to taken, subtract the medication's remaining by its dosage
	if isTaken != nil {
		if !remBefore.IsTaken && *isTaken {
			result, err = database.DB.Query(
				`SELECT * FROM medication WHERE id=$med_id;`,
				map[string]interface{}{
					"med_id": results[0].MedicationID,
				},
			)

			if err != nil {
				return nil, err
			}

			medications, err := surrealdb.SmartUnmarshal[[]model.Medication](result, nil)
			if err != nil {
				return nil, err
			}
			if len(medications) == 0 {
				return nil, fmt.Errorf("no medication linked to reminder found")
			}

			// TODO: allow nagative numbers for inventory??
			new_inventory := medications[0].Inventory - medications[0].Dosage

			_, err = database.DB.Query(
				`UPDATE ONLY $id SET inventory=$inventory`,
				map[string]interface{}{
					"id":        results[0].MedicationID,
					"inventory": new_inventory,
				},
			)
			if err != nil {
				return nil, err
			}
		}
	}

	response := &model.UpdateMedicationReminderResponse{
		ReminderID: results[0].ID,
		Message:    "Medication reminder updated successfully",
	}

	return response, nil
}

// GetMedicationReminders is the resolver for the getMedicationReminders field.
func (r *mutationResolver) GetMedicationReminders(ctx context.Context, userID string) ([]*model.MedicationReminderDetail, error) {
	if len(userID) == 0 || !strings.HasPrefix(userID, "user:") {
		return nil, fmt.Errorf("user id should start with 'user:' and be non-empty")
	}

	result, err := database.DB.Query(
		`SELECT * FROM medication_reminder WHERE user_id = $user_id;`,
		map[string]interface{}{
			"user_id": userID,
		},
	)
	if err != nil {
		return nil, err
	}

	reminders, err := surrealdb.SmartUnmarshal[[]model.MedicationReminder](result, nil)
	if err != nil {
		return nil, err
	}

	// loop through the medications, convert them into MedicationDetails, then return the converted list and nil
	var reminderDetails []*model.MedicationReminderDetail
	for _, rem := range reminders {
		reminderDetail := &model.MedicationReminderDetail{
			ReminderID:   rem.ID,
			MedicationID: rem.MedicationID,
			ReminderTime: rem.ReminderTime,
			IsTaken:      rem.IsTaken,
		}
		reminderDetails = append(reminderDetails, reminderDetail)
	}

	return reminderDetails, nil
}

// CreateTreatmentSchedule is the resolver for the createTreatmentSchedule field.
func (r *mutationResolver) CreateTreatmentSchedule(ctx context.Context, userID string, treatmentType string, scheduledTime string, location string, notes *string) (*model.CreateTreatmentScheduleResponse, error) {
	panic(fmt.Errorf("not implemented: CreateTreatmentSchedule - createTreatmentSchedule"))
}

// GetTreatmentSchedules is the resolver for the getTreatmentSchedules field.
func (r *mutationResolver) GetTreatmentSchedules(ctx context.Context, userID string) ([]*model.TreatmentScheduleDetail, error) {
	panic(fmt.Errorf("not implemented: GetTreatmentSchedules - getTreatmentSchedules"))
}

// UpdateTreatmentSchedule is the resolver for the updateTreatmentSchedule field.
func (r *mutationResolver) UpdateTreatmentSchedule(ctx context.Context, scheduleID string, treatmentType *string, scheduledTime *string, location *string, notes *string) (*model.UpdateTreatmentScheduleResponse, error) {
	panic(fmt.Errorf("not implemented: UpdateTreatmentSchedule - updateTreatmentSchedule"))
}

// DeleteTreatmentSchedule is the resolver for the deleteTreatmentSchedule field.
func (r *mutationResolver) DeleteTreatmentSchedule(ctx context.Context, scheduleID string) (*model.DeleteTreatmentScheduleResponse, error) {
	panic(fmt.Errorf("not implemented: DeleteTreatmentSchedule - deleteTreatmentSchedule"))
}

// AddHealthMetric is the resolver for the addHealthMetric field.
func (r *mutationResolver) AddHealthMetric(ctx context.Context, userID string, metricType string, value float64, unit string, recordedAt string) (*model.AddHealthMetricResponse, error) {
	if len(userID) == 0 || !strings.HasPrefix(userID, "user:") {
		return nil, fmt.Errorf("user id should start with 'user:' and be non-empty")
	}

	result, err := database.DB.Query(
		`SELECT * FROM health_metric WHERE user_id=$user_id AND recorded_at=$recordedAt AND metric_type=$metricType;`,
		map[string]interface{}{
			"user_id":    userID,
			"recordedAt": recordedAt,
			"metricType": metricType,
		},
	)
	if err != nil {
		return nil, err
	}

	metrics, err := surrealdb.SmartUnmarshal[[]model.HealthMetric](result, nil)
	if err != nil {
		return nil, err
	}
	if len(metrics) > 0 {
		return nil, fmt.Errorf("health metric with the same type and same recordAt time already exists")
	}

	// create new Medication record
	result, err = database.DB.Query(
		`CREATE ONLY health_metric:ulid()
		SET
		user_id=$user_id,
		metric_type=$metric_type,
		value=$value,
		unit=$unit,
		recorded_at=$recorded_at,
		created_at=time::now();
		`,
		map[string]interface{}{
			"user_id":     userID,
			"metric_type": metricType,
			"value":       value,
			"unit":        unit,
			"recorded_at": recordedAt,
		},
	)
	if err != nil {
		return nil, err
	}

	// unmarshall the returned results
	newMetric, err := surrealdb.SmartUnmarshal[model.HealthMetric](result, nil)
	if err != nil {
		return nil, err
	}
	response := &model.AddHealthMetricResponse{
		MetricID: newMetric.ID,
		Message:  "new health metric added successfully",
	}

	return response, nil
}

// GetHealthMetrics is the resolver for the getHealthMetrics field.
func (r *mutationResolver) GetHealthMetrics(ctx context.Context, userID string, startDate *string, endDate *string) ([]*model.HealthMetricDetail, error) {
	if len(userID) == 0 || !strings.HasPrefix(userID, "user:") {
		return nil, fmt.Errorf("user id should start with 'user:' and be non-empty")
	}

	// https://surrealdb.com/docs/surrealql/datamodel/ids#array-based-record-ids
	result, err := database.DB.Query(
		`SELECT * FROM health_metric WHERE user_id = $user_id;`,
		map[string]interface{}{
			"user_id": userID,
		},
	)
	if err != nil {
		return nil, err
	}

	metrics, err := surrealdb.SmartUnmarshal[[]model.HealthMetric](result, nil)
	if err != nil {
		return nil, err
	}

	// loop through the medications, convert them into MedicationDetails, then return the converted list and nil
	var metricDetails []*model.HealthMetricDetail
	for _, metric := range metrics {
		if !((startDate != nil && metric.RecordedAt < *startDate) || (endDate != nil && metric.RecordedAt > *endDate)) {
			metricDetail := &model.HealthMetricDetail{
				MetricID:   metric.ID,
				MetricType: metric.MetricType,
				Value:      metric.Value,
				RecordedAt: metric.RecordedAt,
				Unit:       metric.Unit,
			}
			metricDetails = append(metricDetails, metricDetail)
		}
	}

	return metricDetails, nil
}

// UpdateHealthMetric is the resolver for the updateHealthMetric field.
func (r *mutationResolver) UpdateHealthMetric(ctx context.Context, metricID string, value *float64, unit *string) (*model.UpdateHealthMetricResponse, error) {
	if len(metricID) == 0 || !strings.HasPrefix(metricID, "health_metric:") {
		return nil, fmt.Errorf("medication id should start with 'medication:' and be non-empty")
	}

	// Initialize a map to hold the update values
	updateValues := map[string]interface{}{"id": metricID}

	// Prepare the fields to be updated
	updateFields := []string{}
	if value != nil {
		updateValues["value"] = *value
		updateFields = append(updateFields, "value = $value")
	}
	if unit != nil {
		updateValues["unit"] = *unit
		updateFields = append(updateFields, "unit = $unit")
	}

	query := fmt.Sprintf("UPDATE $id SET %s;", strings.Join(updateFields, ", "))

	result, err := database.DB.Query(query, updateValues)
	if err != nil {
		return nil, err
	}

	results, err := surrealdb.SmartUnmarshal[[]model.HealthMetric](result, nil)
	if err != nil {
		return nil, err
	}
	if len(results) == 0 {
		return nil, fmt.Errorf("invalid id, no heath metric object found")
	}

	response := &model.UpdateHealthMetricResponse{
		MetricID: results[0].ID,
		Message:  "Health metric updated successfully",
	}

	return response, nil
}

// DeleteHealthMetric is the resolver for the deleteHealthMetric field.
func (r *mutationResolver) DeleteHealthMetric(ctx context.Context, metricID string) (*model.DeleteHealthMetricResponse, error) {
	if len(metricID) == 0 || !strings.HasPrefix(metricID, "health_metric:") {
		return nil, fmt.Errorf("medication id should start with 'medication:' and be non-empty")
	}

	// Execute the query
	result, err := database.DB.Query(
		`DELETE $id RETURN BEFORE;`,
		map[string]interface{}{
			"id": metricID,
		},
	)
	if err != nil {
		return nil, err // Return the error if the query fails
	}

	results, err := surrealdb.SmartUnmarshal[[]model.HealthMetric](result, nil)
	if err != nil {
		return nil, err
	}

	if len(results) == 0 {
		return nil, fmt.Errorf("invalid id, no health metric object found")
	}

	response := &model.DeleteHealthMetricResponse{
		Message: fmt.Sprintf("Health metric %s of type %s deleted successfully", results[0].ID, results[0].MetricType),
	}

	// Return the response with the medication ID and a success message
	return response, nil
}

// CreateDietPlan is the resolver for the createDietPlan field.
func (r *mutationResolver) CreateDietPlan(ctx context.Context, userID string, mealType string, foodItems string, calories float64) (*model.CreateDietPlanResponse, error) {
	panic(fmt.Errorf("not implemented: CreateDietPlan - createDietPlan"))
}

// GetDietPlans is the resolver for the getDietPlans field.
func (r *mutationResolver) GetDietPlans(ctx context.Context, userID string) ([]*model.DietPlanDetail, error) {
	panic(fmt.Errorf("not implemented: GetDietPlans - getDietPlans"))
}

// UpdateDietPlan is the resolver for the updateDietPlan field.
func (r *mutationResolver) UpdateDietPlan(ctx context.Context, planID string, mealType *string, foodItems *string, calories *float64) (*model.UpdateDietPlanResponse, error) {
	panic(fmt.Errorf("not implemented: UpdateDietPlan - updateDietPlan"))
}

// DeleteDietPlan is the resolver for the deleteDietPlan field.
func (r *mutationResolver) DeleteDietPlan(ctx context.Context, planID string) (*model.DeleteDietPlanResponse, error) {
	panic(fmt.Errorf("not implemented: DeleteDietPlan - deleteDietPlan"))
}

// AddMedicalRecord is the resolver for the addMedicalRecord field.
func (r *mutationResolver) AddMedicalRecord(ctx context.Context, userID string, recordType string, content string) (*model.AddMedicalRecordResponse, error) {
	panic(fmt.Errorf("not implemented: AddMedicalRecord - addMedicalRecord"))
}

// GetMedicalRecords is the resolver for the getMedicalRecords field.
func (r *mutationResolver) GetMedicalRecords(ctx context.Context, userID string) ([]*model.MedicalRecordDetail, error) {
	panic(fmt.Errorf("not implemented: GetMedicalRecords - getMedicalRecords"))
}

// UpdateMedicalRecord is the resolver for the updateMedicalRecord field.
func (r *mutationResolver) UpdateMedicalRecord(ctx context.Context, recordID string, recordType *string, content *string) (*model.UpdateMedicalRecordResponse, error) {
	panic(fmt.Errorf("not implemented: UpdateMedicalRecord - updateMedicalRecord"))
}

// DeleteMedicalRecord is the resolver for the deleteMedicalRecord field.
func (r *mutationResolver) DeleteMedicalRecord(ctx context.Context, recordID string) (*model.DeleteMedicalRecordResponse, error) {
	panic(fmt.Errorf("not implemented: DeleteMedicalRecord - deleteMedicalRecord"))
}

// AddFamilyMember is the resolver for the addFamilyMember field.
func (r *mutationResolver) AddFamilyMember(ctx context.Context, userID string, relatedUserID string, relationship string, accessLevel string) (*model.AddFamilyMemberResponse, error) {
	panic(fmt.Errorf("not implemented: AddFamilyMember - addFamilyMember"))
}

// GetFamilyMembers is the resolver for the getFamilyMembers field.
func (r *mutationResolver) GetFamilyMembers(ctx context.Context, userID string) ([]*model.FamilyMemberDetail, error) {
	panic(fmt.Errorf("not implemented: GetFamilyMembers - getFamilyMembers"))
}

// UpdateFamilyMember is the resolver for the updateFamilyMember field.
func (r *mutationResolver) UpdateFamilyMember(ctx context.Context, memberID string, relationship *string, accessLevel *string) (*model.UpdateFamilyMemberResponse, error) {
	panic(fmt.Errorf("not implemented: UpdateFamilyMember - updateFamilyMember"))
}

// DeleteFamilyMember is the resolver for the deleteFamilyMember field.
func (r *mutationResolver) DeleteFamilyMember(ctx context.Context, memberID string) (*model.DeleteFamilyMemberResponse, error) {
	panic(fmt.Errorf("not implemented: DeleteFamilyMember - deleteFamilyMember"))
}

// CreateAchievementBadge is the resolver for the createAchievementBadge field.
func (r *mutationResolver) CreateAchievementBadge(ctx context.Context, name string, description string, iconURL string) (*model.CreateAchievementBadgeResponse, error) {
	panic(fmt.Errorf("not implemented: CreateAchievementBadge - createAchievementBadge"))
}

// GetAchievementBadges is the resolver for the getAchievementBadges field.
func (r *mutationResolver) GetAchievementBadges(ctx context.Context) ([]*model.AchievementBadgeDetail, error) {
	panic(fmt.Errorf("not implemented: GetAchievementBadges - getAchievementBadges"))
}

// AwardAchievement is the resolver for the awardAchievement field.
func (r *mutationResolver) AwardAchievement(ctx context.Context, userID string, badgeID string) (*model.AwardAchievementResponse, error) {
	panic(fmt.Errorf("not implemented: AwardAchievement - awardAchievement"))
}

// GetUserAchievements is the resolver for the getUserAchievements field.
func (r *mutationResolver) GetUserAchievements(ctx context.Context, userID string) ([]*model.UserAchievementDetail, error) {
	panic(fmt.Errorf("not implemented: GetUserAchievements - getUserAchievements"))
}

// User is the resolver for the user field.
func (r *queryResolver) User(ctx context.Context) (*model.User, error) {
	panic(fmt.Errorf("not implemented: User - user"))
}

// Mutation returns MutationResolver implementation.
func (r *Resolver) Mutation() MutationResolver { return &mutationResolver{r} }

// Query returns QueryResolver implementation.
func (r *Resolver) Query() QueryResolver { return &queryResolver{r} }

type mutationResolver struct{ *Resolver }
type queryResolver struct{ *Resolver }
