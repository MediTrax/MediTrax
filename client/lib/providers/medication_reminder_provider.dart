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
        print("GraphQL Exception: ${result.exception}");
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
      print('Error fetching reminders: $error');
      print('Stack trace: $stackTrace');
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
      print('\n=== Add Reminder Debug Info ===');
      print('Medication ID: $medicationId');
      print('Original reminderTime: $reminderTime');
      
      final result = await _client.mutate$CreateMedicationReminder(
        Options$Mutation$CreateMedicationReminder(
          variables: Variables$Mutation$CreateMedicationReminder(
            medicationId: medicationId, 
            reminderTime: reminderTime,
          )
        )
      );

      print('\nGraphQL Response:');
      if (result.hasException) {
        print("GraphQL Exception: ${result.exception}");
        print("GraphQL Errors: ${result.exception?.graphqlErrors}");
        throw result.exception!;
      }
      print('Response data: ${result.data}');
      print('===============================\n');

      await fetchReminders();
      return true;
    } catch (e, stackTrace) {
      print('Error adding reminder:');
      print('Error type: ${e.runtimeType}');
      print('Error: $e');
      print('Stack trace: $stackTrace');
      return false;
    }
  }

  Future<bool> updateReminder({
    required String reminderId,
    required DateTime reminderTime,
    required bool isTaken,
  }) async {
    try {
      print('\n=== Update Reminder Debug Info ===');
      print('Original reminderTime: $reminderTime');

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
        print('Error updating reminder: ${result.exception}');
        return false;
      }

      await fetchReminders();
      return true;
    } catch (e) {
      print('Error in updateReminder: $e');
      return false;
    }
  }

  Future<bool> deleteReminder(String reminderId) async {
    try {
      print('Deleting reminder with ID: $reminderId');
      final result = await _client.mutate$DeleteMedicationReminder(
        Options$Mutation$DeleteMedicationReminder(
          variables: Variables$Mutation$DeleteMedicationReminder(
            reminderId: reminderId,
          ),
        ),
      );
      print('GraphQL result: ${result.data}');

      if (!result.hasException) {
        state.whenData((reminders) {
          final updatedReminders = reminders.where((r) => r.id != reminderId).toList();
          state = AsyncValue.data(updatedReminders);
        });
        return true;
      }
      print('Error occurred during mutation: ${result.exception.toString()}');
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> toggleReminderStatus(String reminderId, bool isTaken) async {
    try {
      print('Attempting to update reminder status:');
      print('ReminderId: $reminderId');
      print('New status (isTaken): $isTaken');

      // For marking as taken, use takeMedication mutation
      final result = await _client.mutate$TakeMedication(
        Options$Mutation$TakeMedication(
          variables: Variables$Mutation$TakeMedication(
            reminderId: reminderId,
          ),
        ),
      );

      if (result.hasException) {
        print('Error in takeMedication:');
        print('Exception: ${result.exception}');
        throw result.exception!;
      }

      // Refresh reminders from server to get the next scheduled reminder
      await fetchReminders();
      return true;

    } catch (e) {
      print('Error in toggleReminderStatus:');
      print('Error type: ${e.runtimeType}');
      print('Error details: $e');
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
      print('Error getting reminder details: $e');
      return null;
    }
  }

  // Add method to handle the confirmation flow
  Future<bool> confirmAndTakeMedication(String reminderId) async {
    try {
      final details = await getReminderDetails(reminderId);
      
      if (details == null) {
        print('Could not get reminder details');
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
      print('Error in confirmAndTakeMedication: $e');
      return false;
    }
  }

  Future<bool> takeMedication(String reminderId) async {
    try {
      print('\n=== Taking Medication Debug Info ===');
      print('ReminderId: $reminderId');
      print('Current state: ${state.value?.length} reminders');

      final result = await _client.mutate$TakeMedication(
        Options$Mutation$TakeMedication(
          variables: Variables$Mutation$TakeMedication(
            reminderId: reminderId,
          ),
        ),
      );

      print('\nGraphQL Response Details:');
      print('Has Exception: ${result.hasException}');
      if (result.hasException) {
        print('GraphQL Errors: ${result.exception?.graphqlErrors}');
        print('Link Exception: ${result.exception?.linkException}');
        print('Raw Exception: ${result.exception}');
        return false;
      }

      final message = result.data?['takeMedication']?['message'];
      print('Response Message: $message');
      print('Response Data: ${result.data}');
      print('===============================\n');

      // Refresh from server to ensure consistency
      await fetchReminders();
      return true;
    } catch (e, stackTrace) {
      print('Error in takeMedication:');
      print('Error type: ${e.runtimeType}');
      print('Error: $e');
      print('Stack trace: $stackTrace');
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
      print('Error getting medication info: $e');
      return null;
    }
  }
}