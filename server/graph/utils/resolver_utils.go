package utils

import (
	"fmt"
	"regexp"
	"strconv"
)

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

func EvaluateHealthRisk(questionnaireData string) (string, string) {
	// TODO:假设这里是根据问卷数据进行风险评估和推荐生成的逻辑
	var riskLevel, recommendations string
	if questionnaireData == "" {
		riskLevel = "Unknown"
		recommendations = "Please complete the health questionnaire."
	} else {
		// 简单的例子，实际应根据数据分析
		riskLevel = "Medium"
		recommendations = "Monitor lifestyle and consult a healthcare provider."
	}
	return riskLevel, recommendations
}
