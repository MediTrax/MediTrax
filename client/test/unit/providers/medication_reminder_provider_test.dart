import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/models/medication_reminder.dart';
import 'package:meditrax/providers/medication_reminder_provider_test.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('Medication Reminder Tests', () {
    test('should fetch reminders', () async {
      final notifier = container.read(medicationReminderTestProvider.notifier);
      await notifier.fetchReminders();
      
      final reminders = container.read(medicationReminderTestProvider);
      expect(reminders.value?.length, 2);
      expect(reminders.value?[0].id, "reminder1");
      expect(reminders.value?[1].id, "reminder2");
    });

    test('should add new reminder', () async {
      final notifier = container.read(medicationReminderTestProvider.notifier);
      await notifier.fetchReminders();
      
      final success = await notifier.addReminder(
        medicationId: "med1",
        reminderTime: DateTime.now().add(const Duration(hours: 8)),
      );
      
      expect(success, true);
      final reminders = container.read(medicationReminderTestProvider);
      expect(reminders.value?.length, 3);
    });

    test('should update reminder', () async {
      final notifier = container.read(medicationReminderTestProvider.notifier);
      await notifier.fetchReminders();
      
      final newTime = DateTime.now().add(const Duration(hours: 12));
      final success = await notifier.updateReminder(
        reminderId: "reminder1",
        reminderTime: newTime,
        isTaken: true,
      );
      
      expect(success, true);
      final reminders = container.read(medicationReminderTestProvider);
      final updatedReminder = reminders.value?.firstWhere((r) => r.id == "reminder1");
      expect(updatedReminder?.isTaken, true);
    });

    test('should delete reminder', () async {
      final notifier = container.read(medicationReminderTestProvider.notifier);
      await notifier.fetchReminders();
      
      final success = await notifier.deleteReminder("reminder1");
      
      expect(success, true);
      final reminders = container.read(medicationReminderTestProvider);
      expect(reminders.value?.length, 1);
      expect(reminders.value?.any((r) => r.id == "reminder1"), false);
    });

    test('should take medication', () async {
      final notifier = container.read(medicationReminderTestProvider.notifier);
      await notifier.fetchReminders();
      
      final success = await notifier.takeMedication("reminder1");
      
      expect(success, true);
      final reminders = container.read(medicationReminderTestProvider);
      final takenReminder = reminders.value?.firstWhere((r) => r.id == "reminder1");
      expect(takenReminder?.isTaken, true);
    });

    test('should get medication info', () async {
      final notifier = container.read(medicationReminderTestProvider.notifier);
      final medicationInfo = await notifier.getMedicationInfo("med1");
      
      expect(medicationInfo, isNotNull);
      expect(medicationInfo?['name'], 'Test Medication');
      expect(medicationInfo?['dosage'], '100');
      expect(medicationInfo?['unit'], 'mg');
    });
  });
} 