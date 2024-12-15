import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/medication_reminder.dart';
import '../providers/medication_reminder_provider.dart';
import '../services/notification_service.dart';

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
    final reminderLocalTime = widget.reminder.reminderTime.toLocal();
    selectedTime = TimeOfDay(
      hour: reminderLocalTime.hour,
      minute: reminderLocalTime.minute,
    );
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
            try {
              final now = DateTime.now();
              final reminderTime = DateTime(
                now.year,
                now.month,
                now.day,
                selectedTime.hour,
                selectedTime.minute,
              ).toLocal();

              print('\n=== Edit Reminder Debug Info ===');
              print('Selected time: ${selectedTime.format(context)}');
              print('Created DateTime: $reminderTime');
              print('Hour: ${reminderTime.hour}, Minute: ${reminderTime.minute}');

              final adjustedReminderTime = reminderTime.isBefore(now)
                  ? reminderTime.add(const Duration(days: 1))
                  : reminderTime;

              print('\n=== Edit Reminder Debug Info ===');
              print('Selected time: ${selectedTime.format(context)}');
              print('Created DateTime: $reminderTime');
              print('Hour: ${reminderTime.hour}, Minute: ${reminderTime.minute}');

              final formattedTimeString = '${adjustedReminderTime.year}-'
                  '${adjustedReminderTime.month.toString().padLeft(2, '0')}-'
                  '${adjustedReminderTime.day.toString().padLeft(2, '0')}T'
                  '${adjustedReminderTime.hour.toString().padLeft(2, '0')}:'
                  '${adjustedReminderTime.minute.toString().padLeft(2, '0')}:00.000';

              print('Adjusted DateTime: $formattedTimeString');

              final notificationService = NotificationService();
              await notificationService.cancelReminder(widget.reminder.id);

              final success = await ref.read(medicationReminderProvider.notifier)
                  .updateReminder(
                    reminderId: widget.reminder.id,
                    reminderTime: formattedTimeString,
                    isTaken: widget.reminder.isTaken,
                  );

              if (!mounted) return;

              if (success) {
                await notificationService.scheduleReminder(
                  MedicationReminder(
                    id: widget.reminder.id,
                    medicationId: widget.reminder.medicationId,
                    reminderTime: adjustedReminderTime,
                    isTaken: widget.reminder.isTaken,
                    userId: widget.reminder.userId,
                    createdAt: widget.reminder.createdAt,
                  ),
                  widget.medicationName,
                );

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('提醒已更新')),
                );
                await ref.read(medicationReminderProvider.notifier).fetchReminders();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('更新失败，请重试'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            } catch (e) {
              if (!mounted) return;
              
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('错误: $e'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: const Text('保存'),
        ),
      ],
    );
  }
} 