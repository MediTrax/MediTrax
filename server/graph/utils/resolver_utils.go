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
	"medical_record", "profile_access", "activity_log"}

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
	println("Evaluation health risk...")
	// 假设我们根据响应的答案来进行风险评估
	var riskLevel string
	var recommendations string

	// 基于一些问题回答进行简单评估
	score := 0
	for _, response := range responses {
		// if answer is null, evaluate based on choice
		if response.Answer == nil {
			if response.Choice == "是" {
				score++
			}
		} else {
			age, err := strconv.Atoi(*response.Answer)
			if err != nil {
				fmt.Println("Error converting string to int:", err)
			}
			if age <= 30 {
				score++
			} else if age >= 30 && age <= 45 {
				score += 2
			} else if age > 45 && age <= 60 {
				score += 3
			} else {
				score += 4
			}
		}
	}

	if score > 9 {
		riskLevel = "高风险"
		recommendations = "请尽早就医，做肾功能检查。"
	} else if score <= 9 && score >= 5 {
		riskLevel = "中风险"
		recommendations = "请尽快进行全面身体检查，排除隐患。"
	} else {
		riskLevel = "低风险"
		recommendations = "保持健康饮食，定期体检。"
	}
	println("finished evaluating health risk...")

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
	timestamp := time.Now()

	// go through changes and add them one by one to the database
	for _, change := range changes {
		_, err := database.DB.Query(
			`CREATE ONLY activity_log:ulid()
			SET userId=$userId,
			activityType=$activityType,
			description=$description,
			changedObject=$changedObject,
			changedField=$changedField,
			from=$from,
			to=$to,
			timestamp=<datetime>$timestamp;
			CREATE ONLY point_record:ulid() 
			SET userId=$userId,
			pointsEarned=$pointsEarned,
			reason=$reason,
			earnedAt=<datetime>$now;
			`,
			map[string]interface{}{
				"userId":        userId,
				"activityType":  actType,
				"description":   description,
				"changedObject": objId,
				"changedField":  change.Field,
				"from":          change.From,
				"to":            change.To,
				"timestamp":     timestamp,
				"pointsEarned":  1,
				"reason":        actType,
				"now":           time.Now().UTC(),
			},
		)
		if err != nil {
			return err
		}
	}

	// added succcesfully without errors
	return nil
}

func IsProfileShared(from string, to string) bool {
	result, err := database.DB.Query(`SELECT * FROM profile_access 
	WHERE in=$from AND out=$to;`,
		map[string]interface{}{
			"from": from,
			"to":   to,
		})
	if err != nil {
		return false
	}

	members, err := surrealdb.SmartUnmarshal[[]interface{}](result, nil)
	if err != nil {
		return false
	}
	if len(members) > 0 {
		return true
	}
	return false
}

func GetUserByID(userID string) (*model.User, error) {
	result, err := database.DB.Query(`SELECT * FROM ONLY $userId`,
		map[string]interface{}{
			"userId": userID,
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
