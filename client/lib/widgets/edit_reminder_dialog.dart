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
    final localTime = widget.reminder.reminderTime.toLocal();
    selectedTime = TimeOfDay(
      hour: localTime.hour,
      minute: localTime.minute,
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
            trailing: Text(
              selectedTime.format(context),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () async {
              final TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: selectedTime,
                builder: (BuildContext context, Widget? child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                    child: child!,
                  );
                },
              );
              if (time != null) {
                setState(() {
                  selectedTime = time;
                });
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _getNextReminderText(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
            ),
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
              DateTime reminderTime = DateTime(
                now.year,
                now.month,
                now.day,
                selectedTime.hour,
                selectedTime.minute,
              );

              if (reminderTime.isBefore(now)) {
                reminderTime = reminderTime.add(const Duration(days: 1));
              }

              final notificationService = NotificationService();
              await notificationService.cancelReminder(widget.reminder.id);

              final success = await ref.read(medicationReminderProvider.notifier)
                  .updateReminder(
                    reminderId: widget.reminder.id,
                    reminderTime: reminderTime,
                    isTaken: widget.reminder.isTaken,
                  );

              if (!mounted) return;

              if (success) {
                await notificationService.scheduleReminder(
                  MedicationReminder(
                    id: widget.reminder.id,
                    medicationId: widget.reminder.medicationId,
                    reminderTime: reminderTime,
                    isTaken: widget.reminder.isTaken,
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

  String _getNextReminderText() {
    final now = DateTime.now();
    DateTime nextReminder = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    if (nextReminder.isBefore(now)) {
      nextReminder = nextReminder.add(const Duration(days: 1));
    }

    final difference = nextReminder.difference(now);
    if (difference.inHours < 24) {
      if (difference.inHours == 0) {
        return '下次提醒将在 ${difference.inMinutes} 分钟后';
      }
      return '下次提醒将在 ${difference.inHours} 小时 ${difference.inMinutes % 60} 分钟后';
    } else {
      return '下次提醒将在明天 ${selectedTime.format(context)}';
    }
  }
} 