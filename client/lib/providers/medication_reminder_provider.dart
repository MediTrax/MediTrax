import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/user.dart';
import '../models/medication_reminder.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/medication_reminder_provider.graphql.dart';




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

    final List<dynamic> remindersData = result.data?['getMedicationReminders'] ?? [];

    final reminders = remindersData.map((item) {
      return MedicationReminder(
        id: item['reminderId'] ?? '',
        medicationId: item['medicationId'] ?? '',
        userId: item['userId'] ?? '',  
        reminderTime: item['reminderTime'] != null
            ? DateTime.parse(item['reminderTime'])
            : DateTime.now(), 
        isTaken: item['isTaken'] ?? false, 
        createdAt: item['createdAt'] != null
            ? DateTime.parse(item['createdAt']) 
            : DateTime.now(),  
      );
    }).toList();

    state = AsyncValue.data(reminders);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<bool> addReminder({
    required String medicationId,
    required String reminderTime,
  }) async {
    try {
      final result = await _client.mutate$CreateMedicationReminder(
        Options$Mutation$CreateMedicationReminder(
          variables: Variables$Mutation$CreateMedicationReminder(
            medicationId: medicationId, 
            reminderTime: DateTime.parse(reminderTime),
            )
          )
      );

      if (result.hasException) {
        print("GraphQL Exception: ${result.exception}");
        throw result.exception!;
      }

      await fetchReminders();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateReminder({
    required String reminderId,
    String? reminderTime,
    bool? isTaken,
  }) async {
    try {
      final result = await _client.mutate$UpdateMedicationReminder(
        Options$Mutation$UpdateMedicationReminder(
          variables: Variables$Mutation$UpdateMedicationReminder(
            reminderId: reminderId,
            reminderTime: reminderTime != null ? DateTime.parse(reminderTime) : null, 
            isTaken: isTaken,
          ),
        ),
      );

      if (result.hasException) {
        print('Error updating reminder: ${result.exception}');
        throw result.exception!;
      }

      // Update the state with the updated reminder
      state.whenData((reminders) {
        final updatedReminder = MedicationReminder.fromJson(
          result.data!['updateMedicationReminder'],
        );
        final updatedList = reminders.map((reminder) =>
          reminder.id == reminderId ? updatedReminder : reminder
        ).toList();
        state = AsyncValue.data(updatedList);
      });

      return true;
    } catch (e) {
      print('Error in updateReminder: $e');
      return false;
    }
  }

  Future<bool> deleteReminder(String reminderId) async {
    try {
      print('Deleting reminder with ID: $reminderId');
      final result = await _client.mutate(
        MutationOptions(
          document: gql('''
            mutation DeleteMedicationReminder(\$reminderId: String!) {
              deleteMedicationReminder(reminderId: \$reminderId) {
                message
              }
            }
          '''),
          variables: {
            'reminderId': reminderId,
          },
        ),
      );
       print('GraphQL result: ${result.data}');

      if (!result.hasException) {
        print('Delete operation successful. Updating reminders list.');
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

      // Only check inventory when marking as taken
      if (isTaken) {
        // Get the current reminder
        final currentReminder = state.value?.firstWhere(
          (reminder) => reminder.id == reminderId,
          orElse: () => throw Exception('提醒未找到'),
        );

        if (currentReminder == null) {
          throw Exception('提醒未找到');
        }

        // Get the medication details
        final medicationResult = await _client.query(
          QueryOptions(
            document: gql('''
              query GetMedications {
                getMedications {
                  medicationId
                  inventory
                  dosage
                }
              }
            '''),
          ),
        );

        if (medicationResult.hasException) {
          throw medicationResult.exception!;
        }

        final medications = medicationResult.data?['getMedications'] as List?;
        if (medications == null) {
          throw Exception('药品未找到');
        }

        final medicationData = medications.firstWhere(
          (med) => med['medicationId'] == currentReminder.medicationId,
          orElse: () => throw Exception('药品未找到'),
        );

        final currentInventory = (medicationData['inventory'] as num).toDouble();
        final dosage = (medicationData['dosage'] as num).toDouble();

        // Check if there's enough inventory
        if (currentInventory < dosage) {
          throw Exception('库存不足，无法标记为已服用。请及时补充库存。');
        }
      }

      final result = await _client.mutate$UpdateMedicationReminder(
        Options$Mutation$UpdateMedicationReminder(
          variables: Variables$Mutation$UpdateMedicationReminder(
            reminderId: reminderId,
            isTaken: isTaken,
          ),
        ),
      );

      if (result.hasException) {
        print('Backend returned error:');
        print('Exception: ${result.exception}');
        print('GraphQL Errors: ${result.exception?.graphqlErrors}');
        print('Link Exception: ${result.exception?.linkException}');
        throw result.exception!;
      }

      print('Backend response:');
      print('Data: ${result.data}');
      print('Response data type: ${result.data.runtimeType}');
      print('UpdateMedicationReminder result: ${result.data?['updateMedicationReminder']}');

      // Update the local state
      state.whenData((reminders) {
        final updatedReminders = reminders.map((reminder) {
          if (reminder.id == reminderId) {
            print('Updating local reminder state:');
            print('Old status: ${reminder.isTaken}');
            print('New status: $isTaken');
            return reminder.copyWith(isTaken: isTaken);
          }
          return reminder;
        }).toList();
        state = AsyncValue.data(updatedReminders);
      });

      return true;
    } catch (e) {
      print('Error in toggleReminderStatus:');
      print('Error type: ${e.runtimeType}');
      print('Error details: $e');
      
      // Update the local state to show "Taken Failed" status
      state.whenData((reminders) {
        final updatedReminders = reminders.map((reminder) {
          if (reminder.id == reminderId) {
            return reminder.copyWith(isTaken: false);  // Set to not taken
          }
          return reminder;
        }).toList();
        state = AsyncValue.data(updatedReminders);
      });
      
      rethrow;  // Rethrow to show error message to user
    }
  }
}
