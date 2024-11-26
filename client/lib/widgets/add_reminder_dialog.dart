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
  late String selectedMedicationId;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedMedicationId = widget.medications.first.id;
    final now = DateTime.now();
    selectedTime = TimeOfDay(hour: now.hour, minute: now.minute);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('添加提醒'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            value: selectedMedicationId,
            items: widget.medications.map((medication) {
              return DropdownMenuItem(
                value: medication.id,
                child: Text(medication.name),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedMedicationId = value;
                });
              }
            },
            decoration: const InputDecoration(
              labelText: '选择药品',
              border: OutlineInputBorder(),
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
                .addReminder(
                  medicationId: selectedMedicationId,
                  reminderTime: utcReminderTime.toIso8601String(),
                );

            if (success && mounted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('提醒已添加')),
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