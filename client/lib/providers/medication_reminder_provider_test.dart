import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meditrax/models/medication_reminder.dart';
import 'package:meditrax/providers/medication_reminder_provider.dart';

final _mockClient = GraphQLClient(
  link: HttpLink(''),
  cache: GraphQLCache(),
);

class MedicationReminderNotifierTest extends MedicationReminderNotifier {
  MedicationReminderNotifierTest() : super(_mockClient);

  @override
  Future<void> fetchReminders() async {
    state = const AsyncValue.loading();
    
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Return test reminders
    final reminders = [
      MedicationReminder(
        id: "reminder1",
        medicationId: "med1",
        reminderTime: DateTime.now(),
        isTaken: false,
      ),
      MedicationReminder(
        id: "reminder2",
        medicationId: "med2",
        reminderTime: DateTime.now().add(const Duration(hours: 4)),
        isTaken: true,
      ),
    ];

    state = AsyncValue.data(reminders);
  }

  @override
  Future<bool> addReminder({
    required String medicationId,
    required DateTime reminderTime,
    String? frequency,
    int? intervalDays,
    String? dayOfWeek,
  }) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    state.whenData((reminders) {
      final newReminder = MedicationReminder(
        id: "reminder${reminders.length + 1}",
        medicationId: medicationId,
        reminderTime: reminderTime,
        isTaken: false,
      );
      state = AsyncValue.data([...reminders, newReminder]);
    });
    
    return true;
  }

  @override
  Future<bool> updateReminder({
    required String reminderId,
    required DateTime reminderTime,
    required bool isTaken,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    state.whenData((reminders) {
      final updatedReminders = reminders.map((reminder) {
        if (reminder.id == reminderId) {
          return MedicationReminder(
            id: reminder.id,
            medicationId: reminder.medicationId,
            reminderTime: reminderTime,
            isTaken: isTaken,
          );
        }
        return reminder;
      }).toList();
      state = AsyncValue.data(updatedReminders);
    });
    
    return true;
  }

  @override
  Future<bool> deleteReminder(String reminderId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    state.whenData((reminders) {
      final updatedReminders = reminders.where((r) => r.id != reminderId).toList();
      state = AsyncValue.data(updatedReminders);
    });
    
    return true;
  }

  @override
  Future<bool> takeMedication(String reminderId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    state.whenData((reminders) {
      final updatedReminders = reminders.map((reminder) {
        if (reminder.id == reminderId) {
          return MedicationReminder(
            id: reminder.id,
            medicationId: reminder.medicationId,
            reminderTime: reminder.reminderTime,
            isTaken: true,
          );
        }
        return reminder;
      }).toList();
      state = AsyncValue.data(updatedReminders);
    });
    
    return true;
  }

  @override
  Future<Map<String, dynamic>?> getMedicationInfo(String medicationId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Return mock medication info
    return {
      'name': 'Test Medication',
      'dosage': '100',
      'unit': 'mg',
      'inventory': 30,
    };
  }
}

// Test provider that uses the test notifier
final medicationReminderTestProvider = StateNotifierProvider<MedicationReminderNotifierTest, AsyncValue<List<MedicationReminder>>>((ref) {
  return MedicationReminderNotifierTest();
});
