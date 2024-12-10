package utils

import (
	"fmt"
	"meditrax/graph/database"
	"meditrax/graph/model"
	"regexp"
	"strconv"
	"time"

	"github.com/surrealdb/surrealdb.go"
)

var UserRelatedTables = []string{"user_achievement", "point_record", "health_risk_assessment",
	"medication", "medication_reminder", "treatment_schedule", "health_metric",
	"medical_record", "family_member", "activity_log"}

type ChangeLog struct {
	Field string
	From  string
	To    string
}

func FrequencyParser(frequency string) (int, int, error) {
	// Compile the regex pattern to match the expected format
	frequencyPattern := regexp.MustCompile(`^(\d+)/(\d+)$`)

	// Check if the frequency matches the pattern
	matches := frequencyPattern.FindStringSubmatch(frequency)
	if matches == nil {
		return 0, 0, fmt.Errorf("invalid frequency format: %s", frequency)
	}

	// Convert the matched groups to integers
	times, err := strconv.Atoi(matches[1])
	if err != nil {
		return 0, 0, fmt.Errorf("invalid times value: %s", matches[1])
	}

	days, err := strconv.Atoi(matches[2])
	if err != nil {
		return 0, 0, fmt.Errorf("invalid days value: %s", matches[2])
	}

	return times, days, nil
}

func MatchID(id string, table string) bool {
	idPattern := regexp.MustCompile(`^` + table + `:[0-9A-Z]{1,30}$`)

	if idPattern.MatchString(id) {
		return true
	} else {
		return false
	}
}

func EvaluateHealthRisk(responses []*model.Response) (string, string) {
	// 假设我们根据响应的答案来进行风险评估
	var riskLevel string
	var recommendations string

	// 基于一些问题回答进行简单评估
	score := 0
	for _, response := range responses {
		if response.Choice == "是" {
			score++
		}
	}

	// 简单示例：如果选择了超过5个“是”，则认为风险较高
	if score > 5 {
		riskLevel = "高风险"
		recommendations = "请尽早就医，做肾功能检查。"
	} else {
		riskLevel = "低风险"
		recommendations = "保持健康饮食，定期体检。"
	}

	return riskLevel, recommendations
}

// /**
// Add activity logs for the object with id objId, returns error is not successful
//   - userId: id of user
//   - actType: name of mutation that made the change (ex. takeMedication)
//   - description: more detailed description of the activity
//   - objId: id of object being modified
//   - changes: list of ChangLog of what fields are modified
//     */
func AddActivityLogs(userId string, actType string, description string, objId string, changes []ChangeLog) error {
	// get current time and convert to string
	timestamp := time.Now().Format("2006-01-02T15:04:05.000")

	// go through changes and add them one by one to the database
	for _, change := range changes {
		_, err := database.DB.Query(
			`CREATE ONLY activity_log:ulid()
			SET user_id=$user_id,
			activityType=$activityType,
			description=$description,
			changedObject=$changedObject,
			changedField=$changedField,
			from=$from,
			to=$to,
			timestamp=$timestamp;
			`,
			map[string]interface{}{
				"user_id":       userId,
				"activityType":  actType,
				"description":   description,
				"changedObject": objId,
				"changedField":  change.Field,
				"from":          change.From,
				"to":            change.To,
				"timestamp":     timestamp,
			},
		)
		if err != nil {
			return err
		}
	}

	// added succcesfully without errors
	return nil
}

func IsFamilyMember(memberId string, patientId string) bool {
	result, err := database.DB.Query(`SELECT * FROM family_member 
	WHERE user_id=$userID AND patient_user_id=$patientId;`,
		map[string]interface{}{
			"userID":    memberId,
			"patientId": patientId,
		})
	if err != nil {
		return false
	}

	members, err := surrealdb.SmartUnmarshal[[]*model.FamilyMember](result, nil)
	if err != nil {
		return false
	}
	if len(members) < 1 {
		return false
	}

	if members[0].UserID == memberId && members[0].PatientUserID == patientId {
		return true
	}
	return false
}

func GetUserByID(userID string) (*model.User, error) {
	result, err := database.DB.Query(`SELECT * FROM ONLY $user_id`,
		map[string]interface{}{
			"user_id": userID,
		})
	if err != nil {
		return nil, err
	}

	user, err := surrealdb.SmartUnmarshal[model.User](result, nil)
	if err != nil {
		return nil, err
	}

	return &user, nil
}
