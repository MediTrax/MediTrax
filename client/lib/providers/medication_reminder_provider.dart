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
    required String reminderTime,
    required bool? isTaken,
  }) async {
    try {
          DateTime parsedReminderTime;
            try {
            parsedReminderTime = DateTime.parse(reminderTime);
            print("Parsed reminderTime as DateTime: $parsedReminderTime");
          } catch (e) {
            print("Error parsing reminderTime: $e");
            return false;  
          }
          
      final result = await _client.mutate$UpdateMedicationReminder(
        Options$Mutation$UpdateMedicationReminder(
          variables: Variables$Mutation$UpdateMedicationReminder(
            reminderId: reminderId,
            reminderTime: DateTime.parse(reminderTime),
            isTaken: isTaken,
            )
          )
      );
      if (!result.hasException) {
        await fetchReminders();
        return true;
      }
      return false;
    } catch (e) {
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
      final result = await _client.mutate$UpdateMedicationReminder(
        Options$Mutation$UpdateMedicationReminder(
          variables: Variables$Mutation$UpdateMedicationReminder(
            reminderId: reminderId,
            isTaken: isTaken,
            )
          )
      );

      if (!result.hasException) {
        state.whenData((reminders) {
          final updatedReminders = reminders.map((reminder) {
            if (reminder.id == reminderId) {
              return reminder.copyWith(isTaken: isTaken);
            }
            return reminder;
          }).toList();
          state = AsyncValue.data(updatedReminders);
        });
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
