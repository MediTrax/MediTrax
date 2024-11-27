import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/medication.dart';
import '../providers/medication_reminder_provider.dart';

class AddReminderDialog extends ConsumerStatefulWidget {
  final List<Medication> medications;

  const AddReminderDialog({Key? key, required this.medications}) : super(key: key);

  @override
  _AddReminderDialogState createState() => _AddReminderDialogState();
}

class _AddReminderDialogState extends ConsumerState<AddReminderDialog> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String? _selectedMedicationId;

  // Get frequency text based on medication frequency
  String _getFrequencyText(String frequency) {
    final parts = frequency.split('/');
    final times = parts.isNotEmpty ? parts[0] : '1';
    final days = parts.length > 1 ? parts[1] : '1';
    
    if (days == '1') {
      return '每天提醒${times}次';
    } else {
      return '每$days天提醒${times}次';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('添加提醒'),
      content: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedMedicationId,
                  isExpanded: true,
                  items: widget.medications.map((medication) {
                    return DropdownMenuItem<String>(
                      value: medication.id,
                      child: Tooltip(
                        message: _getFrequencyText(medication.frequency),
                        child: Text(
                          medication.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedMedicationId = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: '选择药品',
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  validator: (value) => value == null ? '请选择药品' : null,
                ),
                const SizedBox(height: 16),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('选择日期'),
                  subtitle: Text('${_selectedDate.toLocal()}'.split(' ')[0]),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != _selectedDate) {
                      setState(() {
                        _selectedDate = picked;
                      });
                    }
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('选择时间'),
                  subtitle: Text(_selectedTime.format(context)),
                  onTap: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: _selectedTime,
                    );
                    if (picked != null && picked != _selectedTime) {
                      setState(() {
                        _selectedTime = picked;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('取消'),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final success = await ref.read(medicationReminderProvider.notifier).addReminder(
                medicationId: _selectedMedicationId!,
                reminderTime: _selectedDate.add(Duration(
                  hours: _selectedTime.hour,
                  minutes: _selectedTime.minute,
                )).toIso8601String(),
              );

              if (success) {
                await ref.read(medicationReminderProvider.notifier).fetchReminders();
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('添加提醒失败')),
                );
              }
            }
          },
          child: const Text('保存'),
        ),
      ],
    );
  }
} 