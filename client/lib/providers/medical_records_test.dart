import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/models/medical_record.dart';
import 'package:meditrax/providers/medical_records_provider.dart';

class MedicalRecordsTest extends MedicalRecords {
  @override
  Future<List<MedicalRecord>> build() async {
    // Return test medical records
    return [
      MedicalRecord(
        id: "test_record_1",
        recordType: "TEST_TYPE",
        content: jsonEncode({"data": "Test medical record content 1"}),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      MedicalRecord(
        id: "test_record_2",
        recordType: "TEST_TYPE",
        content: jsonEncode({"data": "Test medical record content 2"}),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];
  }

  @override
  Future<void> addRecord({
    required String recordType,
    required Map<String, dynamic> content,
  }) async {
    // Simulate adding a record by updating state
    state = AsyncData([
      ...state.value ?? [],
      MedicalRecord(
        id: "new_test_record_${DateTime.now().millisecondsSinceEpoch}",
        recordType: recordType,
        content: jsonEncode(content),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ]);
  }

  @override
  Future<void> updateRecord({
    required String recordId,
    String? recordType,
    String? content,
  }) async {
    // Simulate updating a record
    state = AsyncData(
      state.value?.map((record) {
            if (record.id == recordId) {
              return MedicalRecord(
                id: record.id,
                recordType: recordType ?? record.recordType,
                content: content ?? record.content,
                createdAt: record.createdAt,
                updatedAt: DateTime.now(),
              );
            }
            return record;
          }).toList() ??
          [],
    );
  }

  @override
  Future<void> deleteRecord(String recordId) async {
    // Simulate deleting a record
    state = AsyncData(
      state.value?.where((record) => record.id != recordId).toList() ?? [],
    );
  }
}
