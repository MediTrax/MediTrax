import 'dart:convert';
import 'package:meditrax/models/medical_record.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/medical_records.graphql.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medical_records_provider.g.dart';

@riverpod
class MedicalRecords extends _$MedicalRecords {
  @override
  Future<List<MedicalRecord>> build() async {
    return _fetchMedicalRecords();
  }

  Future<List<MedicalRecord>> _fetchMedicalRecords() async {
    final patientId = ref.read(appStateProvider).selectedProfile;
    final user = ref.read(userDataProvider).valueOrNull;
    if (patientId == user?.id || patientId == null) {
      final result =
          await ref.read(graphQLServiceProvider).query$GetMedicalRecords(
                Options$Query$GetMedicalRecords(),
              );

      if (result.hasException) {
        throw result.exception!;
      }

      return (result.parsedData!.getMedicalRecords ?? [])
          .map((record) => MedicalRecord(
                id: record!.recordId,
                recordType: record.recordType,
                content: record.content,
                createdAt: record.createdAt,
                updatedAt: record.createdAt,
              ))
          .toList();
    } else {
      final result =
          await ref.read(graphQLServiceProvider).query$GetSharedMedicalRecords(
                Options$Query$GetSharedMedicalRecords(
                  variables: Variables$Query$GetSharedMedicalRecords(
                    patientId: patientId,
                  ),
                ),
              );

      if (result.hasException) {
        throw result.exception!;
      }

      return (result.parsedData!.getSharedMedicalRecords ?? [])
          .map((record) => MedicalRecord(
                id: record!.recordId,
                recordType: record.recordType,
                content: record.content,
                createdAt: record.createdAt,
                updatedAt: record.createdAt,
              ))
          .toList();
    }
  }

  List<MedicalRecord> getRecordsByType(String type) {
    final records = state.valueOrNull ?? [];
    return records.where((record) => record.recordType == type).toList();
  }

  Future<void> addRecord({
    required String recordType,
    required Map<String, dynamic> content,
  }) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$AddMedicalRecord(
              Options$Mutation$AddMedicalRecord(
                variables: Variables$Mutation$AddMedicalRecord(
                  recordType: recordType,
                  content: jsonEncode(content),
                ),
              ),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    ref.invalidateSelf();
  }

  Future<void> updateRecord({
    required String recordId,
    String? recordType,
    String? content,
  }) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$UpdateMedicalRecord(
              Options$Mutation$UpdateMedicalRecord(
                variables: Variables$Mutation$UpdateMedicalRecord(
                  recordId: recordId,
                  recordType: recordType,
                  content: content,
                ),
              ),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    ref.invalidateSelf();
  }

  Future<void> deleteRecord(String recordId) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$DeleteMedicalRecord(
              Options$Mutation$DeleteMedicalRecord(
                variables: Variables$Mutation$DeleteMedicalRecord(
                  recordId: recordId,
                ),
              ),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    ref.invalidateSelf();
  }
}
