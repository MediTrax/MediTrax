// Code generated by github.com/99designs/gqlgen, DO NOT EDIT.

package model

import (
	"time"
)

// Represents an achievement badge that can be awarded to users.
type AchievementBadge struct {
	// The unique identifier of the achievement badge.
	ID string `json:"id"`
	// The name of the achievement badge.
	Name string `json:"name"`
	// A description of the achievement badge.
	Description string `json:"description"`
	// The URL of the icon representing the achievement badge.
	IconURL string `json:"iconUrl"`
	// The date and time when the achievement badge was created.
	CreatedAt time.Time `json:"createdAt"`
}

// Detailed information about an achievement badge.
type AchievementBadgeDetail struct {
	// The ID of the achievement badge.
	BadgeID string `json:"badgeId"`
	// The name of the achievement badge.
	Name string `json:"name"`
	// A description of the achievement badge.
	Description string `json:"description"`
	// The URL of the icon representing the achievement badge.
	IconURL string `json:"iconUrl"`
	// The date and time when the achievement badge was created.
	CreatedAt time.Time `json:"createdAt"`
}

// Represents an activity log entry for a user.
type ActivityLog struct {
	// The unique identifier of the activity log entry.
	ID string `json:"id"`
	// The ID of the user associated with the activity.
	UserID string `json:"userId"`
	// The type of activity performed.
	ActivityType string `json:"activityType"`
	// A description of the activity.
	Description string `json:"description"`
	// The object that was changed during the activity.
	ChangedObject string `json:"changedObject"`
	// The field of the object that was changed.
	ChangedField string `json:"changedField"`
	// The original value before the change.
	From string `json:"from"`
	// The new value after the change.
	To string `json:"to"`
	// The timestamp when the activity occurred.
	Timestamp time.Time `json:"timestamp"`
}

// Detailed information about an activity log entry.
type ActivityLogDetail struct {
	// The ID of the activity log entry.
	LogID string `json:"logId"`
	// The type of activity performed.
	ActivityType string `json:"activityType"`
	// A description of the activity.
	Description string `json:"description"`
	// The object that was changed during the activity.
	ChangedObject string `json:"changedObject"`
	// The field of the object that was changed.
	ChangedField string `json:"changedField"`
	// The original value before the change.
	From string `json:"from"`
	// The new value after the change.
	To string `json:"to"`
	// The timestamp when the activity occurred.
	Timestamp time.Time `json:"timestamp"`
}

// Response type for adding a health metric.
type AddHealthMetricResponse struct {
	// The ID of the newly added health metric.
	MetricID string `json:"metricId"`
	// A message indicating the result of the addition operation.
	Message string `json:"message"`
}

// Response type for adding a medical record.
type AddMedicalRecordResponse struct {
	// The ID of the newly added medical record.
	RecordID string `json:"recordId"`
	// A message indicating the result of the addition operation.
	Message string `json:"message"`
}

// Response type for adding a medication.
type AddMedicationResponse struct {
	// The ID of the newly added medication.
	MedicationID string `json:"medicationId"`
	// A message indicating the result of the addition operation.
	Message string `json:"message"`
}

// Response type for awarding an achievement to a user.
type AwardAchievementResponse struct {
	// The ID of the user achievement that was awarded.
	UserAchievementID string `json:"userAchievementId"`
	// A message indicating the result of the award operation.
	Message string `json:"message"`
}

// Response type for creating an achievement badge.
type CreateAchievementBadgeResponse struct {
	// The ID of the newly created achievement badge.
	BadgeID string `json:"badgeId"`
	// A message indicating the result of the creation operation.
	Message string `json:"message"`
}

// Response type for creating a medication reminder.
type CreateMedicationReminderResponse struct {
	// The ID of the newly created medication reminder.
	ReminderID string `json:"reminderId"`
	// A message indicating the result of the creation operation.
	Message string `json:"message"`
}

// Response type for creating a treatment schedule.
type CreateTreatmentScheduleResponse struct {
	// The ID of the newly created treatment schedule.
	ScheduleID string `json:"scheduleId"`
	// A message indicating the result of the creation operation.
	Message string `json:"message"`
}

// Response type for creating a user.
type CreateUserResponse struct {
	// The ID of the newly created user.
	UserID string `json:"userId"`
	// A message indicating the result of the creation operation.
	Message string `json:"message"`
}

// Response type for deleting a health metric.
type DeleteHealthMetricResponse struct {
	// A message indicating the result of the deletion operation.
	Message string `json:"message"`
}

// Response type for deleting a medical record.
type DeleteMedicalRecordResponse struct {
	// A message indicating the result of the deletion operation.
	Message string `json:"message"`
}

// Response type for deleting a medication reminder.
type DeleteMedicationReminderResponse struct {
	// A message indicating the result of the deletion operation.
	Message string `json:"message"`
}

// Response type for deleting a medication.
type DeleteMedicationResponse struct {
	// A message indicating the result of the deletion operation.
	Message string `json:"message"`
}

// Response type for deleting a treatment schedule.
type DeleteTreatmentScheduleResponse struct {
	// A message indicating the result of the deletion operation.
	Message string `json:"message"`
}

// Response type for deleting a user.
type DeleteUserResponse struct {
	// A message indicating the result of the deletion operation.
	Message string `json:"message"`
}

// Response type for evaluating a health risk assessment.
type EvaluateHealthRiskAssessmentResponse struct {
	// The ID of the health risk assessment.
	AssessmentID string `json:"assessmentId"`
	// The risk level determined from the assessment.
	RiskLevel string `json:"riskLevel"`
	// Recommendations based on the assessment results.
	Recommendations string `json:"recommendations"`
}

// Input type for a filled questionnaire.
type FilledQuestionnaire struct {
	// The ID of the questionnaire being filled.
	QuestionnaireID int `json:"questionnaireId"`
	// The list of responses to the questionnaire.
	Responses []*Response `json:"responses"`
}

// Represents a recommendation for a food item.
type FoodRecommendation struct {
	// The name of the recommended food item.
	Name string `json:"name"`
}

// Represents the specification of a food item.
type FoodSpec struct {
	// The name of the food specification.
	Name string `json:"name"`
	// The value of the food specification.
	Value float64 `json:"value"`
	// The unit of measurement for the food specification.
	Unit string `json:"unit"`
	// A measure of how high the specification value is compared to a standard.
	HowHigh float64 `json:"howHigh"`
}

// Represents a collection of food specifications.
type FoodSpecs struct {
	// The list of food specifications.
	Specs []*FoodSpec `json:"specs"`
	// A measure of how recommended the food item is.
	HowRecommend float64 `json:"howRecommend"`
}

// Represents a health metric recorded for a user.
type HealthMetric struct {
	// The unique identifier of the health metric.
	ID string `json:"id"`
	// The ID of the user associated with the health metric.
	UserID string `json:"userId"`
	// The type of the health metric.
	MetricType string `json:"metricType"`
	// The value of the health metric.
	Value float64 `json:"value"`
	// The unit of measurement for the health metric.
	Unit string `json:"unit"`
	// The date and time when the health metric was recorded.
	RecordedAt time.Time `json:"recordedAt"`
	// The date and time when the health metric was created.
	CreatedAt time.Time `json:"createdAt"`
}

// Detailed information about a health metric.
type HealthMetricDetail struct {
	// The ID of the health metric.
	MetricID string `json:"metricId"`
	// The type of the health metric.
	MetricType string `json:"metricType"`
	// The value of the health metric.
	Value float64 `json:"value"`
	// The unit of measurement for the health metric.
	Unit string `json:"unit"`
	// The date and time when the health metric was recorded.
	RecordedAt time.Time `json:"recordedAt"`
}

// Represents a health response in a risk assessment.
type HealthResponse struct {
	// The ID of the question being answered.
	QuestionID int `json:"questionId"`
	// The choice selected for the question.
	Choice string `json:"choice"`
	// The answer provided for the question, if applicable.
	Answer *string `json:"answer,omitempty"`
}

// Represents a health risk assessment for a user.
type HealthRiskAssessment struct {
	// The unique identifier of the health risk assessment.
	ID string `json:"id"`
	// The ID of the user who completed the assessment.
	UserID string `json:"userId"`
	// The data from the completed questionnaire.
	QuestionnaireData []*HealthResponse `json:"questionnaireData"`
	// The risk level determined from the assessment.
	RiskLevel string `json:"riskLevel"`
	// Recommendations based on the assessment results.
	Recommendations string `json:"recommendations"`
	// The date and time when the assessment was created.
	CreatedAt time.Time `json:"createdAt"`
}

// Detailed response for a health risk assessment.
type HealthRiskAssessmentDetailResponse struct {
	// The ID of the health risk assessment.
	AssessmentID string `json:"assessmentId"`
	// The data from the completed questionnaire.
	QuestionnaireData []*HealthResponse `json:"questionnaireData"`
	// The risk level determined from the assessment.
	RiskLevel string `json:"riskLevel"`
	// Recommendations based on the assessment results.
	Recommendations string `json:"recommendations"`
	// The date and time when the assessment was created.
	CreatedAt time.Time `json:"createdAt"`
}

// Response type for logging in a user.
type LoginUserResponse struct {
	// The ID of the logged-in user.
	UserID string `json:"userId"`
	// The token associated with the logged-in user.
	Token *Token `json:"token"`
	// A message indicating the result of the login operation.
	Message string `json:"message"`
}

// Represents a medical record for a user.
type MedicalRecord struct {
	// The unique identifier of the medical record.
	ID string `json:"id"`
	// The ID of the user associated with the medical record.
	UserID string `json:"userId"`
	// The type of the medical record.
	RecordType string `json:"recordType"`
	// The content of the medical record.
	Content string `json:"content"`
	// The date and time when the medical record was created.
	CreatedAt time.Time `json:"createdAt"`
	// The date and time when the medical record was last updated.
	UpdatedAt time.Time `json:"updatedAt"`
}

// Detailed information about a medical record.
type MedicalRecordDetail struct {
	// The ID of the medical record.
	RecordID string `json:"recordId"`
	// The type of the medical record.
	RecordType string `json:"recordType"`
	// The content of the medical record.
	Content string `json:"content"`
	// The date and time when the medical record was created.
	CreatedAt time.Time `json:"createdAt"`
}

// Represents a medication prescribed to a user.
type Medication struct {
	// The unique identifier of the medication.
	ID string `json:"id"`
	// The name of the medication.
	Name string `json:"name"`
	// The dosage of the medication.
	Dosage float64 `json:"dosage"`
	// The unit of measurement for the dosage.
	Unit string `json:"unit"`
	// The frequency at which the medication should be taken.
	Frequency string `json:"frequency"`
	// The inventory count of the medication.
	Inventory float64 `json:"inventory"`
	// The ID of the user who is prescribed the medication.
	UserID string `json:"userId"`
	// The date and time when the medication was created.
	CreatedAt time.Time `json:"createdAt"`
	// The date and time when the medication was last updated.
	UpdatedAt time.Time `json:"updatedAt"`
}

// Detailed information about a medication.
type MedicationDetail struct {
	// The ID of the medication.
	MedicationID string `json:"medicationId"`
	// The name of the medication.
	Name string `json:"name"`
	// The dosage of the medication.
	Dosage float64 `json:"dosage"`
	// The unit of measurement for the dosage.
	Unit string `json:"unit"`
	// The frequency at which the medication should be taken.
	Frequency string `json:"frequency"`
	// The inventory count of the medication.
	Inventory float64 `json:"inventory"`
}

// Represents a reminder for taking a medication.
type MedicationReminder struct {
	// The unique identifier of the medication reminder.
	ID string `json:"id"`
	// The ID of the medication associated with the reminder.
	MedicationID string `json:"medicationId"`
	// The ID of the user who set the reminder.
	UserID string `json:"userId"`
	// The time at which the reminder is set.
	ReminderTime time.Time `json:"reminderTime"`
	// Indicates whether the medication has been taken.
	IsTaken bool `json:"isTaken"`
	// The date and time when the reminder was created.
	CreatedAt time.Time `json:"createdAt"`
}

// Detailed information about a medication reminder.
type MedicationReminderDetail struct {
	// The ID of the medication reminder.
	ReminderID string `json:"reminderId"`
	// The ID of the medication associated with the reminder.
	MedicationID string `json:"medicationId"`
	// The time at which the reminder is set.
	ReminderTime time.Time `json:"reminderTime"`
	// Indicates whether the medication has been taken.
	IsTaken bool `json:"isTaken"`
}

type Mutation struct {
}

// Represents a password change request.
type PasswordChange struct {
	// The unique identifier of the password change request.
	ID string `json:"id"`
	// The ID of the user requesting the password change.
	User string `json:"user"`
	// The token associated with the password change request.
	Token string `json:"token"`
	// The date and time when the password change request was created.
	CreatedAt time.Time `json:"createdAt"`
}

// Detailed information about a user profile.
type ProfileDetail struct {
	// The unique identifier of the profile.
	ID string `json:"id"`
	// The name of the profile.
	Name string `json:"name"`
	// The phone number associated with the profile.
	PhoneNumber string `json:"phoneNumber"`
	// The role of the profile in the system.
	Role string `json:"role"`
	// The date and time when the profile was created.
	CreatedAt time.Time `json:"createdAt"`
}

type Query struct {
}

// Represents a question in a health risk assessment questionnaire.
type Question struct {
	// The unique identifier of the question.
	QuestionID int `json:"questionId"`
	// The text of the question.
	Question string `json:"question"`
	// The type of choice available for the question (e.g., single choice, multiple choice).
	QuestionType int `json:"questionType"`
	// The list of choices available for the question.
	Choices []string `json:"choices,omitempty"`
}

// Represents a questionnaire object containing multiple questions.
type QuestionnaireObject struct {
	// The unique identifier of the questionnaire.
	QuestionnaireID int `json:"questionnaireId"`
	// The list of questions in the questionnaire.
	Data []*Question `json:"data"`
}

// Represents a record object containing data.
type RecordObject struct {
	// The data contained in the record object.
	Data string `json:"data"`
}

// Response type for requesting a password reset.
type RequestPasswordResetResponse struct {
	// A message indicating the result of the password reset request.
	Message string `json:"message"`
}

// Response type for resetting a password.
type ResetPasswordResponse struct {
	// A message indicating the result of the password reset operation.
	Message string `json:"message"`
}

// Input type for a response to a questionnaire.
type Response struct {
	// The ID of the question being answered.
	QuestionID int `json:"questionId"`
	// The choice selected for the question.
	Choice string `json:"choice"`
	// The answer provided for the question, if applicable.
	Answer *string `json:"answer,omitempty"`
}

// Response type for sharing a profile.
type ShareProfileResponse struct {
	// A message indicating the result of the profile sharing operation.
	Message string `json:"message"`
}

// Response type for taking a medication.
type TakeMedicationResponse struct {
	// A message indicating the result of the medication taking operation.
	Message string `json:"message"`
}

// Represents a token for user authentication.
type Token struct {
	// The unique identifier of the token.
	ID string `json:"id"`
	// The ID of the user associated with the token.
	User string `json:"user"`
	// The access token for authentication.
	AccessToken string `json:"accessToken"`
	// The refresh token for renewing the access token.
	RefreshToken string `json:"refreshToken"`
	// The expiry date and time of the access token.
	AccessTokenExpiry time.Time `json:"accessTokenExpiry"`
	// The expiry date and time of the refresh token.
	RefreshTokenExpiry time.Time `json:"refreshTokenExpiry"`
	// The device associated with the token.
	Device string `json:"device"`
	// The date and time when the token was created.
	CreatedAt time.Time `json:"createdAt"`
	// The date and time when the token was last updated.
	UpdatedAt time.Time `json:"updatedAt"`
}

// Represents a treatment schedule for a user.
type TreatmentSchedule struct {
	// The unique identifier of the treatment schedule.
	ID string `json:"id"`
	// The ID of the user who is scheduled for the treatment.
	UserID string `json:"userId"`
	// The type of treatment scheduled.
	TreatmentType string `json:"treatmentType"`
	// The time at which the treatment is scheduled.
	ScheduledTime time.Time `json:"scheduledTime"`
	// The location where the treatment is scheduled.
	Location string `json:"location"`
	// Additional notes about the treatment.
	Notes *string `json:"notes,omitempty"`
}

// Detailed information about a treatment schedule.
type TreatmentScheduleDetail struct {
	// The ID of the treatment schedule.
	ScheduleID string `json:"scheduleId"`
	// The type of treatment scheduled.
	TreatmentType string `json:"treatmentType"`
	// The time at which the treatment is scheduled.
	ScheduledTime time.Time `json:"scheduledTime"`
	// The location where the treatment is scheduled.
	Location string `json:"location"`
	// Additional notes about the treatment.
	Notes *string `json:"notes,omitempty"`
}

// Response type for unsharing a profile.
type UnshareProfileResponse struct {
	// A message indicating the result of the profile unsharing operation.
	Message string `json:"message"`
}

// Response type for updating a health metric.
type UpdateHealthMetricResponse struct {
	// The ID of the updated health metric.
	MetricID string `json:"metricId"`
	// A message indicating the result of the update operation.
	Message string `json:"message"`
}

// Response type for updating a medical record.
type UpdateMedicalRecordResponse struct {
	// The ID of the updated medical record.
	RecordID string `json:"recordId"`
	// A message indicating the result of the update operation.
	Message string `json:"message"`
}

// Response type for updating a medication reminder.
type UpdateMedicationReminderResponse struct {
	// The ID of the updated medication reminder.
	ReminderID string `json:"reminderId"`
	// A message indicating the result of the update operation.
	Message string `json:"message"`
}

// Response type for updating a medication.
type UpdateMedicationResponse struct {
	// The ID of the updated medication.
	MedicationID string `json:"medicationId"`
	// A message indicating the result of the update operation.
	Message string `json:"message"`
}

// Response type for updating a treatment schedule.
type UpdateTreatmentScheduleResponse struct {
	// The ID of the updated treatment schedule.
	ScheduleID string `json:"scheduleId"`
	// A message indicating the result of the update operation.
	Message string `json:"message"`
}

// Response type for updating a user.
type UpdateUserResponse struct {
	// The ID of the updated user.
	UserID string `json:"userId"`
	// A message indicating the result of the update operation.
	Message string `json:"message"`
}

// Represents a user in the system.
type User struct {
	// The unique identifier of the user.
	ID string `json:"id"`
	// The phone number of the user.
	PhoneNumber string `json:"phoneNumber"`
	// The password of the user.
	Password string `json:"password"`
	// The name of the user.
	Name string `json:"name"`
	// The total points earned by the user.
	Points float64 `json:"points"`
	// The date and time when the user was created.
	CreatedAt time.Time `json:"createdAt"`
	// The date and time when the user was last updated.
	UpdatedAt time.Time `json:"updatedAt"`
	// The date and time when the user last logged in.
	LastLogin time.Time `json:"lastLogin"`
	// The status of the user account.
	Status int `json:"status"`
	// The role of the user in the system.
	Role string `json:"role"`
}

// Represents a user's achievement, linking a user to a badge.
type UserAchievement struct {
	// The unique identifier of the user achievement.
	ID string `json:"id"`
	// The ID of the user who earned the achievement.
	UserID string `json:"userId"`
	// The ID of the badge that was earned.
	BadgeID string `json:"badgeId"`
	// The date and time when the achievement was earned.
	EarnedAt time.Time `json:"earnedAt"`
	// The date and time when the user achievement was created.
	CreatedAt time.Time `json:"createdAt"`
}

// Detailed information about a user's achievement.
type UserAchievementDetail struct {
	// The ID of the user achievement.
	UserAchievementID string `json:"userAchievementId"`
	// The ID of the badge that was earned.
	BadgeID string `json:"badgeId"`
	// The date and time when the achievement was earned.
	EarnedAt time.Time `json:"earnedAt"`
}

// Detailed information about a user.
type UserDetailResponse struct {
	// The ID of the user.
	UserID string `json:"userId"`
	// The phone number of the user.
	PhoneNumber string `json:"phoneNumber"`
	// The name of the user.
	Name string `json:"name"`
	// The total points earned by the user.
	Points float64 `json:"points"`
	// The role of the user in the system.
	Role string `json:"role"`
	// The date and time when the user was created.
	CreatedAt time.Time `json:"createdAt"`
	// The date and time when the user last logged in.
	LastLogin *time.Time `json:"lastLogin,omitempty"`
}

// Represents a record of points earned by a user.
type UserPointRecord struct {
	// The unique identifier of the point record.
	ID string `json:"id"`
	// The ID of the user who earned the points.
	UserID string `json:"userId"`
	// The number of points earned.
	PointsEarned float64 `json:"pointsEarned"`
	// The reason for earning the points.
	Reason string `json:"reason"`
	// The date and time when the points were earned.
	EarnedAt time.Time `json:"earnedAt"`
}

// Detailed information about a user's point record.
type UserPointRecordDetail struct {
	// The ID of the point record.
	RecordID string `json:"recordId"`
	// The number of points earned.
	PointsEarned float64 `json:"pointsEarned"`
	// The reason for earning the points.
	Reason string `json:"reason"`
	// The date and time when the points were earned.
	EarnedAt time.Time `json:"earnedAt"`
}

// Response type for earning points.
type EarnPointsResponse struct {
	// The updated total points of the user.
	UpdatedPoints float64 `json:"updatedPoints"`
	// A message indicating the result of the points earning operation.
	Message string `json:"message"`
}
