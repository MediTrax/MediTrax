// Code generated by github.com/99designs/gqlgen, DO NOT EDIT.

package model

type AchievementBadge struct {
	ID          string `json:"id"`
	Name        string `json:"name"`
	Description string `json:"description"`
	IconURL     string `json:"icon_url"`
	CreatedAt   string `json:"created_at"`
}

type AchievementBadgeDetail struct {
	BadgeID     string `json:"badgeId"`
	Name        string `json:"name"`
	Description string `json:"description"`
	IconURL     string `json:"iconUrl"`
}

type AddFamilyMemberResponse struct {
	MemberID string `json:"memberId"`
	Message  string `json:"message"`
}

type AddHealthMetricResponse struct {
	MetricID string `json:"metricId"`
	Message  string `json:"message"`
}

type AddMedicalRecordResponse struct {
	RecordID string `json:"recordId"`
	Message  string `json:"message"`
}

type AddMedicationResponse struct {
	MedicationID string `json:"medicationId"`
	Message      string `json:"message"`
}

type AwardAchievementResponse struct {
	UserAchievementID string `json:"userAchievementId"`
	Message           string `json:"message"`
}

type CreateAchievementBadgeResponse struct {
	BadgeID string `json:"badgeId"`
	Message string `json:"message"`
}

type CreateDietPlanResponse struct {
	PlanID  string `json:"planId"`
	Message string `json:"message"`
}

type CreateMedicationReminderResponse struct {
	ReminderID string `json:"reminderId"`
	Message    string `json:"message"`
}

type CreateTreatmentScheduleResponse struct {
	ScheduleID string `json:"scheduleId"`
	Message    string `json:"message"`
}

type CreateUserResponse struct {
	UserID  string `json:"userId"`
	Message string `json:"message"`
}

type DeleteDietPlanResponse struct {
	Message string `json:"message"`
}

type DeleteFamilyMemberResponse struct {
	Message string `json:"message"`
}

type DeleteHealthMetricResponse struct {
	Message string `json:"message"`
}

type DeleteMedicalRecordResponse struct {
	Message string `json:"message"`
}

type DeleteMedicationResponse struct {
	Message string `json:"message"`
}

type DeleteTreatmentScheduleResponse struct {
	Message string `json:"message"`
}

type DeleteUserResponse struct {
	Message string `json:"message"`
}

type DietPlanDetail struct {
	PlanID    string  `json:"planId"`
	MealType  string  `json:"mealType"`
	FoodItems string  `json:"foodItems"`
	Calories  float64 `json:"calories"`
	CreatedAt string  `json:"createdAt"`
}

type FamilyMember struct {
	ID            string `json:"id"`
	UserID        string `json:"user_id"`
	RelatedUserID string `json:"related_user_id"`
	Relationship  string `json:"relationship"`
	AccessLevel   int    `json:"access_level"`
	CreatedAt     string `json:"created_at"`
}

type FamilyMemberDetail struct {
	MemberID      string `json:"memberId"`
	RelatedUserID string `json:"relatedUserId"`
	Relationship  string `json:"relationship"`
	AccessLevel   string `json:"accessLevel"`
}

type HealthMetricDetail struct {
	MetricID   string  `json:"metricId"`
	MetricType string  `json:"metricType"`
	Value      float64 `json:"value"`
	Unit       string  `json:"unit"`
	RecordedAt string  `json:"recordedAt"`
}

type HealthRiskAssessment struct {
	ID                string   `json:"id"`
	UserID            string   `json:"user_id"`
	QuestionnaireData *string  `json:"questionnaire_data,omitempty"`
	RiskLevel         int      `json:"risk_level"`
	Recommendations   []string `json:"recommendations"`
	CreatedAt         string   `json:"created_at"`
}

type HealthRiskAssessmentDetailResponse struct {
	AssessmentID      string `json:"assessmentId"`
	QuestionnaireData string `json:"questionnaireData"`
	RiskLevel         string `json:"riskLevel"`
	Recommendations   string `json:"recommendations"`
	CreatedAt         string `json:"createdAt"`
}

type HealthRiskAssessmentResponse struct {
	AssessmentID    string `json:"assessmentId"`
	RiskLevel       string `json:"riskLevel"`
	Recommendations string `json:"recommendations"`
}

type LoginUserResponse struct {
	UserID  string `json:"userId"`
	Token   string `json:"token"`
	Message string `json:"message"`
}

type MedicalRecord struct {
	ID         string `json:"id"`
	UserID     string `json:"user_id"`
	RecordType string `json:"record_type"`
	Content    string `json:"content"`
	CreatedAt  string `json:"created_at"`
	UpdatedAt  string `json:"updated_at"`
}

type MedicalRecordDetail struct {
	RecordID   string `json:"recordId"`
	RecordType string `json:"recordType"`
	Content    string `json:"content"`
	CreatedAt  string `json:"createdAt"`
}

type Medication struct {
	ID        string  `json:"id"`
	Name      string  `json:"name"`
	Dosage    float64 `json:"dosage"`
	Unit      string  `json:"unit"`
	Frequency string  `json:"frequency"`
	Inventory int     `json:"inventory"`
	UserID    string  `json:"user_id"`
	CreatedAt string  `json:"created_at"`
	UpdatedAt string  `json:"updated_at"`
}

type MedicationDetail struct {
	MedicationID string `json:"medicationId"`
	Name         string `json:"name"`
	Dosage       string `json:"dosage"`
	Unit         string `json:"unit"`
	Frequency    string `json:"frequency"`
	Inventory    int    `json:"inventory"`
}

type MedicationReminder struct {
	ID           string `json:"id"`
	MedicationID string `json:"medication_id"`
	UserID       string `json:"user_id"`
	ReminderTime string `json:"reminder_time"`
	IsTaken      bool   `json:"is_taken"`
	CreatedAt    string `json:"created_at"`
}

type MedicationReminderDetail struct {
	ReminderID   string `json:"reminderId"`
	MedicationID string `json:"medicationId"`
	ReminderTime string `json:"reminderTime"`
	IsTaken      bool   `json:"isTaken"`
}

type Mutation struct {
}

type PasswordChange struct {
	ID        string `json:"id"`
	User      string `json:"user"`
	Token     string `json:"token"`
	CreatedAt string `json:"createdAt"`
}

type Query struct {
}

type RequestPasswordResetResponse struct {
	Message string `json:"message"`
}

type ResetPasswordResponse struct {
	Message string `json:"message"`
}

type TreatmentScheduleDetail struct {
	ScheduleID    string  `json:"scheduleId"`
	TreatmentType string  `json:"treatmentType"`
	ScheduledTime string  `json:"scheduledTime"`
	Location      string  `json:"location"`
	Notes         *string `json:"notes,omitempty"`
}

type UpdateDietPlanResponse struct {
	PlanID  string `json:"planId"`
	Message string `json:"message"`
}

type UpdateFamilyMemberResponse struct {
	MemberID string `json:"memberId"`
	Message  string `json:"message"`
}

type UpdateHealthMetricResponse struct {
	MetricID string `json:"metricId"`
	Message  string `json:"message"`
}

type UpdateHealthRiskAssessmentResponse struct {
	AssessmentID    string `json:"assessmentId"`
	RiskLevel       string `json:"riskLevel"`
	Recommendations string `json:"recommendations"`
}

type UpdateMedicalRecordResponse struct {
	RecordID string `json:"recordId"`
	Message  string `json:"message"`
}

type UpdateMedicationReminderResponse struct {
	ReminderID string `json:"reminderId"`
	Message    string `json:"message"`
}

type UpdateMedicationResponse struct {
	MedicationID string `json:"medicationId"`
	Message      string `json:"message"`
}

type UpdateTreatmentScheduleResponse struct {
	ScheduleID string `json:"scheduleId"`
	Message    string `json:"message"`
}

type UpdateUserResponse struct {
	UserID  string `json:"userId"`
	Message string `json:"message"`
}

type User struct {
	ID        string `json:"id"`
	Email     string `json:"email"`
	Password  string `json:"password"`
	Name      string `json:"name"`
	CreatedAt string `json:"created_at"`
	UpdatedAt string `json:"updated_at"`
	LastLogin string `json:"last_login"`
	Status    int    `json:"status"`
	Role      string `json:"role"`
}

type UserAchievement struct {
	ID        string `json:"id"`
	UserID    string `json:"user_id"`
	BadgeID   string `json:"badge_id"`
	EarnedAt  string `json:"earned_at"`
	CreatedAt string `json:"created_at"`
}

type UserAchievementDetail struct {
	UserAchievementID string `json:"userAchievementId"`
	BadgeID           string `json:"badgeId"`
	EarnedAt          string `json:"earnedAt"`
}

type UserDetailResponse struct {
	UserID    string  `json:"userId"`
	Email     string  `json:"email"`
	Name      string  `json:"name"`
	Role      string  `json:"role"`
	CreatedAt string  `json:"createdAt"`
	LastLogin *string `json:"lastLogin,omitempty"`
}
