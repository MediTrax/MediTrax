import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/medication.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/medication_provider.graphql.dart';
import 'package:meditrax/providers/medication_reminder_provider.graphql.dart';

final medicationProvider = StateNotifierProvider<MedicationNotifier, AsyncValue<List<Medication>>>((ref) {
  final client = ref.watch(graphQLServiceProvider);
  return MedicationNotifier(client);
});

class MedicationNotifier extends StateNotifier<AsyncValue<List<Medication>>> {
  final GraphQLClient _client;

  MedicationNotifier(this._client) : super(const AsyncValue.data([]));

  Future<void> fetchMedications(String userId) async {
    try {
      print("Fetching medications for user: $userId");
      state = const AsyncValue.loading();
      final result = await _client.query$GetMedications(
      Options$Query$GetMedications(
        fetchPolicy: FetchPolicy.networkOnly, 
      ),
    );

      print("GraphQL exception: ${result.exception}");

      if (result.hasException) {
        throw result.exception!;
      }

      final medications = (result.data?['getMedications'] as List? ?? [])
          .map((item) => Medication(
                id: item['medicationId'] ?? '',  // Use medicationId instead of id
                name: item['name'] ?? '',
                dosage: (item['dosage'] as num?)?.toDouble() ?? 0.0,
                unit: item['unit'] ?? '',
                frequency: item['frequency'] ?? '',
                inventory: (item['inventory'] as num?)?.toDouble() ?? 0.0,
                userId: item['userId'] ?? userId,  // Use provided userId as fallback
                createdAt: item['createdAt'] != null 
                    ? DateTime.parse(item['createdAt']) 
                    : DateTime.now(),
                updatedAt: item['updatedAt'] != null 
                    ? DateTime.parse(item['updatedAt']) 
                    : DateTime.now(),
              ))
          .toList();

      // print("Parsed medications: ${medications.length}");
      state = AsyncValue.data(medications);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<bool> addMedication({
    required String name,
    required double dosage,
    required String unit,
    required String frequency,
    required double inventory,
  }) async {
    try {
      // print("Adding medication with data:");
      // print("Name: $name");
      // print("Dosage: $dosage");
      // print("Unit: $unit");
      // print("Frequency: $frequency");
      // print("Inventory: $inventory");

      // Perform the mutation request
      final result = await _client.mutate$AddMedication(
        Options$Mutation$AddMedication(
          variables: Variables$Mutation$AddMedication(
            name: name, 
            dosage: dosage,
            unit: unit,
            frequency: frequency, 
            inventory: inventory
            )
          )
      );

      print("GraphQL exception: ${result.exception}");

      if (result.hasException) {
        throw result.exception!;
      }

      // Update the state with the new medication
      final newMedication = Medication(
        id: result.data!['addMedication']['medicationId'] ?? '',
        name: result.data!['addMedication']['name'] ?? '',
        dosage: (result.data!['addMedication']['dosage'] as num?)?.toDouble() ?? 0.0,
        unit: result.data!['addMedication']['unit'] ?? '',
        frequency: result.data!['addMedication']['frequency'] ?? '',
        inventory: (result.data!['addMedication']['inventory'] as num?)?.toDouble() ?? 0.0,
        userId: result.data!['addMedication']['userId'] ?? '',
        createdAt: DateTime.parse(result.data!['addMedication']['createdAt'] ?? DateTime.now().toIso8601String()),
        updatedAt: DateTime.parse(result.data!['addMedication']['updatedAt'] ?? DateTime.now().toIso8601String()),
      );

      state.whenData((medications) {
        state = AsyncValue.data([...medications, newMedication]);
      });

      return true;
    } catch (e, stack) {
      return false;
    }
  }

  Future<bool> updateMedication({
    required String medicationId,
    String? name,
    double? dosage,
    String? unit,
    String? frequency,
    double? inventory,
  }) async {
    try {
      print("Attempting to update medication with the following parameters:");
      print("ID: $medicationId");

      final result = await _client.mutate$UpdateMedication(
        Options$Mutation$UpdateMedication(
          variables: Variables$Mutation$UpdateMedication(
            medicationId: medicationId,
            name: name,
            dosage: dosage,
            unit: unit,
            frequency: frequency,
            inventory: inventory,
            )
          )
      );

    print("GraphQL result: ${result.data}");
    print("GraphQL exception: ${result.exception}");

      if (result.hasException) {
        throw result.exception!;
      }

      // Update the state with the updated medication
      state.whenData((medications) {
        final updatedMedication = Medication.fromJson(result.data!['updateMedication']);
        final updatedList = medications.map((med) => 
          med.id == medicationId ? updatedMedication : med
        ).toList();
        state = AsyncValue.data(updatedList);
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteMedication(String medicationId) async {
    try {
      print('Starting deletion of medication with ID: $medicationId');

      // First, get all reminders for this medication using generated query
      final remindersResult = await _client.query$GetMedicationReminders(
        Options$Query$GetMedicationReminders(
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (remindersResult.hasException) {
        print('Error fetching reminders: ${remindersResult.exception}');
        throw remindersResult.exception!;
      }

      // Get reminders for this medication
      final reminders = ((remindersResult.data?['getMedicationReminders'] as List?) ?? [])
          .map((item) => Query$GetMedicationReminders$getMedicationReminders.fromJson(item))
          .where((reminder) => reminder.medicationId == medicationId)
          .map((reminder) => reminder.reminderId)
          .toList();

      print('Found ${reminders.length} reminders to delete');

      // Delete each reminder
      for (final reminderId in reminders) {
        final deleteReminderResult = await _client.mutate$DeleteMedicationReminder(
          Options$Mutation$DeleteMedicationReminder(
            variables: Variables$Mutation$DeleteMedicationReminder(
              reminderId: reminderId,
            ),
          ),
        );

        if (deleteReminderResult.hasException) {
          print('Error deleting reminder $reminderId: ${deleteReminderResult.exception}');
          throw deleteReminderResult.exception!;
        }
      }

      // Then delete the medication
      final result = await _client.mutate$DeleteMedication(
        Options$Mutation$DeleteMedication(
          variables: Variables$Mutation$DeleteMedication(
            medicationId: medicationId
          )
        )
      );

      print('Medication deletion result: ${result.data}');
      
      if (result.hasException) {
        print('Error deleting medication: ${result.exception}');
        throw result.exception!;
      }

      // Update the state by removing the deleted medication
      state.whenData((medications) {
        final updatedList = medications.where((med) => med.id != medicationId).toList();
        state = AsyncValue.data(updatedList);
      });

      return true;
    } catch (e, stackTrace) {
      print('Failed to delete medication:');
      print('Error: $e');
      print('Stack trace: $stackTrace');
      return false;
    }
  }
}