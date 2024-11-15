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

  Future<void> fetchReminders(String userId) async {
    state = const AsyncValue.loading();
    try {
      final result = await _client.query(
        QueryOptions(
          document: gql('''
            query GetMedicationReminders {
              getMedicationReminders {
                reminderId
                medicationId
                reminderTime
                isTaken
              }
            }
          '''), 
        ),
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
      DateTime parsedReminderTime = DateTime.parse(reminderTime);

      final result = await _client.mutate(
        MutationOptions(
          document: gql('''
            mutation CreateMedicationReminder(
              \$medicationId: String!
              \$reminderTime: DateTime!
            ) {
              createMedicationReminder(
                medicationId: \$medicationId
                reminderTime: \$reminderTime
              ) {
                reminderId
                message
              }
            }
          '''), // GraphQL Mutation 查询
          variables: {
            'medicationId': medicationId,
            'reminderTime': parsedReminderTime.toIso8601String(), // 转换为 ISO 8601 字符串
          },
        ),
      );

      if (result.hasException) {
        print("GraphQL Exception: ${result.exception}");
        throw result.exception!;
      }

      // await fetchReminders();
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
      final result = await _client.mutate(
        MutationOptions(
          document: gql('''
            mutation UpdateMedicationReminder(
              \$reminderId: String!
              \$reminderTime: String
              \$isTaken: Boolean
            ) {
              updateMedicationReminder(
                reminderId: \$reminderId
                reminderTime: \$reminderTime
                isTaken: \$isTaken
              ) {
                reminderId
              }
            }
          '''),
          variables: {
            'reminderId': reminderId,
            if (reminderTime != null) 'reminderTime': reminderTime,
            if (isTaken != null) 'isTaken': isTaken,
          },
        ),
      );

      if (!result.hasException) {
        state.whenData((reminders) async {
          final userId = reminders.first.userId;
          await fetchReminders(userId);
        });
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteReminder(String reminderId) async {
    try {
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
      final result = await _client.mutate(
        MutationOptions(
          document: gql('''
            mutation ToggleMedicationReminder(
              \$reminderId: String!
              \$isTaken: Boolean!
            ) {
              updateMedicationReminder(
                reminderId: \$reminderId
                isTaken: \$isTaken
              ) {
                reminderId
              }
            }
          '''),
          variables: {
            'reminderId': reminderId,
            'isTaken': isTaken,
          },
        ),
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
