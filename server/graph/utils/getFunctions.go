package utils

import (
	"meditrax/graph/database"
	"meditrax/graph/model"

	"github.com/surrealdb/surrealdb.go"
)

func GetHealthMetrics(user model.User, startDate *string, endDate *string, metricType *string) ([]*model.HealthMetricDetail, error) {
	var result interface{}
	var err error

	// get all the health metric entries that is associated with the user
	if metricType == nil {
		result, err = database.DB.Query(
			`SELECT * FROM health_metric WHERE userId = $userId;`,
			map[string]interface{}{
				"userId": user.ID,
			},
		)
	} else {
		result, err = database.DB.Query(
			`SELECT * FROM health_metric WHERE userId = $userId AND metricType=$metricType;`,
			map[string]interface{}{
				"userId":     user.ID,
				"metricType": *metricType,
			},
		)
	}

	if err != nil {
		return nil, err
	}

	// unmarshal results into Go objects
	metrics, err := surrealdb.SmartUnmarshal[[]model.HealthMetric](result, nil)
	if err != nil {
		return nil, err
	}

	// loop through the metrics, convert them into HealthMetricDetail, then return the converted list and nil
	var metricDetails []*model.HealthMetricDetail
	for _, metric := range metrics {
		// check that the metric is within the record time constraints
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

func GetMedicalRecords(user model.User) ([]*model.MedicalRecordDetail, error) {
	// Fetch medical records for the user
	result, err := database.DB.Query(`SELECT * FROM medical_record WHERE userId=$userID;`, map[string]interface{}{
		"userID": user.ID,
	})
	if err != nil {
		return nil, err
	}

	// TODO: please modify this line as it may result in a bug
	records, err := surrealdb.SmartUnmarshal[[]*model.MedicalRecord](result, nil)
	if err != nil {
		return nil, err
	}

	var record_details []*model.MedicalRecordDetail
	for _, record := range records {
		recordDetail := &model.MedicalRecordDetail{
			RecordID:   record.ID,
			RecordType: record.RecordType,
			Content:    record.Content,
			CreatedAt:  record.CreatedAt,
		}
		record_details = append(record_details, recordDetail)
	}

	return record_details, nil
}

func GetTreatmentSchedules(user model.User) ([]*model.TreatmentScheduleDetail, error) {
	// Fetch treatment schedules for the user
	result, err := database.DB.Query(`SELECT * FROM treatment_schedule WHERE userId=$userID;`, map[string]interface{}{
		"userID": user.ID,
	})
	if err != nil {
		return nil, err
	}

	// TODO: please modify this line as it may result in a bug
	schedules, err := surrealdb.SmartUnmarshal[[]*model.TreatmentSchedule](result, nil)
	if err != nil {
		return nil, err
	}

	var scheduleDetails []*model.TreatmentScheduleDetail
	for _, schedule := range schedules {
		scheduleDetail := &model.TreatmentScheduleDetail{
			ScheduleID:    schedule.ID,
			TreatmentType: schedule.TreatmentType,
			ScheduledTime: schedule.ScheduledTime,
			Location:      schedule.Location,
			Notes:         schedule.Notes,
		}
		scheduleDetails = append(scheduleDetails, scheduleDetail)
	}

	return scheduleDetails, nil
}

func GetMedications(user model.User) ([]*model.MedicationDetail, error) {
	// query for all the medications associated with the user
	result, err := database.DB.Query(
		`SELECT * FROM medication WHERE userId = $userId;`,
		map[string]interface{}{
			"userId": user.ID,
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
			Dosage:       med.Dosage,
			Unit:         med.Unit,
			Frequency:    med.Frequency,
			Inventory:    med.Inventory,
		}
		medicationDetails = append(medicationDetails, medicationDetail)
	}

	return medicationDetails, nil
}
