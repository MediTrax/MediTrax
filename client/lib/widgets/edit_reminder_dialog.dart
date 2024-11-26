import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/medication_reminder.dart';
import '../providers/medication_reminder_provider.dart';

class EditReminderDialog extends ConsumerStatefulWidget {
  final MedicationReminder reminder;
  final String medicationName;

  const EditReminderDialog({
    super.key,
    required this.reminder,
    required this.medicationName,
  });

  @override
  ConsumerState<EditReminderDialog> createState() => _EditReminderDialogState();
}

class _EditReminderDialogState extends ConsumerState<EditReminderDialog> {
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    selectedTime = TimeOfDay(hour: now.hour, minute: now.minute);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('编辑${widget.medicationName}的提醒'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('提醒时间'),
            trailing: Text(selectedTime.format(context)),
            onTap: () async {
              final TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: selectedTime,
              );
              if (time != null) {
                setState(() {
                  selectedTime = time;
                });
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: () async {
            final now = DateTime.now();
            var reminderTime = DateTime(
              now.year,
              now.month,
              now.day,
              selectedTime.hour,
              selectedTime.minute,
            );

            if (reminderTime.isBefore(now)) {
              reminderTime = reminderTime.add(const Duration(days: 1));
            }

            final utcReminderTime = reminderTime.toUtc();

            final success = await ref.read(medicationReminderProvider.notifier)
                .updateReminder(
                  reminderId: widget.reminder.id,
                  reminderTime: utcReminderTime.toIso8601String(),
                  isTaken: widget.reminder.isTaken,
                );

            if (success && mounted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('提醒已更新')),
              );
              await ref.read(medicationReminderProvider.notifier).fetchReminders();
            }
          },
          child: const Text('保存'),
        ),
      ],
    );
  }
} 