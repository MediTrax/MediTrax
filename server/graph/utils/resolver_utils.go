package utils

import (
	"fmt"
	"meditrax/graph/database"
	"regexp"
	"strconv"

	"github.com/surrealdb/surrealdb.go"
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
func EntryExists(id string) (bool, error) {
	result, err := database.DB.Query(`SELECT count() FROM $id;`, map[string]interface{}{
		"id": id,
	})
	if err != nil {
		return false, err
	}

	// Unmarshal the result to retrieve the count value
	countResult, err := surrealdb.SmartUnmarshal[[]map[string]interface{}](result, nil)
	if err != nil {
		return false, err
	}

	// Extract the count from the response
	if len(countResult) > 0 {
		if count, ok := countResult[0]["count"].(float64); ok && count > 0 {
			return true, nil
		}
	}

	return false, nil
}
