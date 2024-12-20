import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/medication_reminder.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/medication_reminder_provider.graphql.dart';
import 'package:meditrax/providers/medication_provider.graphql.dart';




final medicationReminderProvider = StateNotifierProvider<MedicationReminderNotifier, AsyncValue<List<MedicationReminder>>>((ref) {
  final client = ref.watch(graphQLServiceProvider);
  return MedicationReminderNotifier(client);
});

class MedicationReminderNotifier extends StateNotifier<AsyncValue<List<MedicationReminder>>> {
  final GraphQLClient _client;

  MedicationReminderNotifier(this._client) : super(const AsyncValue.loading());

  Future<void> fetchReminders() async {
    state = const AsyncValue.loading();
    try {
      final result = await _client.query$GetMedicationReminders(
        Options$Query$GetMedicationReminders(
          fetchPolicy: FetchPolicy.networkOnly, 
        )
      );
      if (result.hasException) {
        throw result.exception!;
      }

      final remindersData = result.parsedData!.getMedicationReminders ?? [];
      
      print('\n=== Fetched Reminders Debug Info ===');
      final reminders = remindersData.map((item) {
        print('\nReminder ID: ${item!.reminderId}');
        print('Raw reminderTime from backend: ${item.reminderTime}');

        return MedicationReminder(
          id: item.reminderId,
          medicationId: item.medicationId,
          reminderTime: item.reminderTime,
          isTaken: item.isTaken, 
        );
      }).toList();
      print('===============================\n');

      state = AsyncValue.data(reminders);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<bool> addReminder({
    required String medicationId,
    required DateTime reminderTime,
    String? frequency,
    int? intervalDays,
    String? dayOfWeek,
  }) async {
    try {
      
      final result = await _client.mutate$CreateMedicationReminder(
        Options$Mutation$CreateMedicationReminder(
          variables: Variables$Mutation$CreateMedicationReminder(
            medicationId: medicationId, 
            reminderTime: reminderTime,
          )
        )
      );

      if (result.hasException) {
        throw result.exception!;
      }

      await fetchReminders();
      return true;
    } catch (e, stackTrace) {
      return false;
    }
  }

  Future<bool> updateReminder({
    required String reminderId,
    required DateTime reminderTime,
    required bool isTaken,
  }) async {
    try {

      final result = await _client.mutate$UpdateMedicationReminder(
        Options$Mutation$UpdateMedicationReminder(
          variables: Variables$Mutation$UpdateMedicationReminder(
            reminderId: reminderId,
            reminderTime: reminderTime,
            isTaken: isTaken,
          ),
        ),
      );

      if (result.hasException) {
        return false;
      }

      await fetchReminders();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteReminder(String reminderId) async {
    try {
      final result = await _client.mutate$DeleteMedicationReminder(
        Options$Mutation$DeleteMedicationReminder(
          variables: Variables$Mutation$DeleteMedicationReminder(
            reminderId: reminderId,
          ),
        ),
      );

      if (!result.hasException) {
        state.whenData((reminders) {
          final updatedReminders = reminders.where((r) => r.id != reminderId).toList();
          state = AsyncValue.data(updatedReminders);
        });
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> toggleReminderStatus(String reminderId, bool isTaken) async {
    try {
      // For marking as taken, use takeMedication mutation
      final result = await _client.mutate$TakeMedication(
        Options$Mutation$TakeMedication(
          variables: Variables$Mutation$TakeMedication(
            reminderId: reminderId,
          ),
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      // Refresh reminders from server to get the next scheduled reminder
      await fetchReminders();
      return true;

    } catch (e) {
      return false;
    }
  }

  // Add helper method to check if reminder button should be visible
  bool shouldShowReminderButton(DateTime nextReminderTime) {
    final now = DateTime.now();
    final difference = now.difference(nextReminderTime);
    return difference.inDays >= 1;
  }

  // Add method to get reminder details including medication info
  Future<Map<String, dynamic>?> getReminderDetails(String reminderId) async {
    try {
      // First get the reminder
      final reminder = state.value?.firstWhere(
        (r) => r.id == reminderId,
        orElse: () => throw Exception('Reminder not found'),
      );

      if (reminder == null) {
        return null;
      }

      // Then get the medication info
      final medicationInfo = await getMedicationInfo(reminder.medicationId);
      
      if (medicationInfo == null) {
        return null;
      }

      return {
        'reminder': reminder,
        'medication': medicationInfo,
        'nextReminderTime': reminder.reminderTime,
        'showButton': shouldShowReminderButton(reminder.reminderTime),
      };
    } catch (e) {
      return null;
    }
  }

  // Add method to handle the confirmation flow
  Future<bool> confirmAndTakeMedication(String reminderId) async {
    try {
      final details = await getReminderDetails(reminderId);
      
      if (details == null) {
        return false;
      }

      // Take the medication
      final success = await takeMedication(reminderId);
      
      if (success) {
        // Refresh reminders to get the next scheduled reminder
        await fetchReminders();
      }

      return success;
    } catch (e) {
      return false;
    }
  }

  Future<bool> takeMedication(String reminderId) async {
    try {

      final result = await _client.mutate$TakeMedication(
        Options$Mutation$TakeMedication(
          variables: Variables$Mutation$TakeMedication(
            reminderId: reminderId,
          ),
        ),
      );

      if (result.hasException) {
        return false;
      }
      // Refresh from server to ensure consistency
      await fetchReminders();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Add a new method to get medication dosage info
  Future<Map<String, dynamic>?> getMedicationInfo(String medicationId) async {
    try {
      final result = await _client.query$GetMedications(
        Options$Query$GetMedications(
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      final medications = ((result.data?['getMedications'] as List?) ?? [])
          .map((item) => Query$GetMedications$getMedications.fromJson(item))
          .toList();

      if (medications.isEmpty) {
        return null;
      }

      // Find the specific medication
      final medicationData = medications.firstWhere(
        (med) => med.medicationId == medicationId,
        orElse: () => throw Exception('Medication not found'),
      );

      return {
        'name': medicationData.name,
        'dosage': medicationData.dosage,
        'unit': medicationData.unit,
        'inventory': medicationData.inventory,
      };
    } catch (e) {
      return null;
    }
  }
}