import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/medication.dart';
import '../providers/medication_reminder_provider.dart';
import 'package:meditrax/providers/user_provider.dart';

class AddReminderDialog extends ConsumerStatefulWidget {
  final List<Medication> medications;

  const AddReminderDialog({
    super.key,
    required this.medications,
  });

  @override
  ConsumerState<AddReminderDialog> createState() => _AddReminderDialogState();
}

class _AddReminderDialogState extends ConsumerState<AddReminderDialog> {
  late TimeOfDay selectedTime;
  late Medication selectedMedication;

  @override
  void initState() {
    super.initState();
    selectedTime = TimeOfDay.now();
    selectedMedication = widget.medications.first;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('添加提醒'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<Medication>(
            value: selectedMedication,
            items: widget.medications.map((medication) {
              return DropdownMenuItem(
                value: medication,
                child: Text(medication.name),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedMedication = value;
                });
              }
            },
            decoration: const InputDecoration(
              labelText: '选择药品',
            ),
          ),
          const SizedBox(height: 16),
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
            final reminderTime = DateTime(
              now.year,
              now.month,
              now.day,
              selectedTime.hour,
              selectedTime.minute,
            );

            final success = await ref.read(medicationReminderProvider.notifier)
                .addReminder(
                  medicationId: selectedMedication.id,
                  reminderTime: reminderTime.toIso8601String(),
                );

            if (success && mounted) {
              // 成功保存提醒后弹出对话框并显示提示信息
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('提醒已添加')),
              );

              try {
                final userData = await ref.read(userDataProvider.future);
                if (userData != null) {
                  await ref.read(medicationReminderProvider.notifier).fetchReminders();
                } else {
                  print("No user data available");
                }
              } catch (e) {
                print("Error fetching reminders: $e");
              }
            }
          },
          child: const Text('保存'),
        ),
      ],
    );
  }
} 