package utils

import (
	"fmt"
	"meditrax/graph/model"
	"regexp"
	"strconv"
)

var UserRelatedTables = []string{"user_achievement", "point_record", "health_risk_assessment",
	"medication", "medication_reminder", "treatment_schedule", "health_metric",
	"medical_record", "family_member"}

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
