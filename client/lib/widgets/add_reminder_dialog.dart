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
  List<TimeOfDay> _selectedTimes = [TimeOfDay.now()];
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

  void _updateTimesBasedOnFrequency(String medicationId) {
    final medication = widget.medications.firstWhere((m) => m.id == medicationId);
    final frequency = parseFrequency(medication.frequency);
    final times = frequency['times']!;
    
    setState(() {
      // Initialize with current time for first reminder
      final currentTime = TimeOfDay.now();
      _selectedTimes = [currentTime];
      // Add additional time slots if needed
      for (int i = 1; i < times; i++) {
        // Add time slots 4 hours apart as default
        _selectedTimes.add(
          TimeOfDay(
            hour: (currentTime.hour + (i * 4)) % 24,
            minute: currentTime.minute,
          ),
        );
      }
    });
  }

  Widget _buildTimePickerList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_selectedTimes.length, (index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('提醒时间 ${index + 1}'),
          subtitle: Text(_selectedTimes[index].format(context)),
          onTap: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: _selectedTimes[index],
              builder: (BuildContext context, Widget? child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                  child: child!,
                );
              },
            );
            if (picked != null && picked != _selectedTimes[index]) {
              setState(() {
                _selectedTimes[index] = picked;
              });
            }
          },
        );
      }),
    );
  }

  Map<String, int> parseFrequency(String frequency) {
    final parts = frequency.split('/');
    final times = int.tryParse(parts[0]) ?? 1;
    final days = parts.length > 1 ? int.tryParse(parts[1]) ?? 1 : 1;
    return {'times': times, 'days': days};
  }

  Future<bool> _hasExistingReminder(String medicationId) async {
    final remindersState = ref.read(medicationReminderProvider);
    final reminders = remindersState.value ?? [];
    
    return reminders.any((reminder) => reminder.medicationId == medicationId);
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
                    if (value != null) {
                      setState(() {
                        _selectedMedicationId = value;
                        _updateTimesBasedOnFrequency(value);
                      });
                    }
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
                  title: const Text('开始日期'),
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
                _buildTimePickerList(),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              if (await _hasExistingReminder(_selectedMedicationId!)) {
                if (!mounted) return;
                
                // Show conflict dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Row(
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.orange.shade400,
                        ),
                        const SizedBox(width: 8),
                        const Text('提醒已存在'),
                      ],
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('该药品已设置提醒。'),
                        const SizedBox(height: 8),
                        Text(
                          '请编辑现有提醒时间。',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      FilledButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('确认'),
                      ),
                    ],
                  ),
                );
                return;
              }

              bool allSuccess = true;
              // Add reminders if no conflicts found
              for (final time in _selectedTimes) {
                final reminderTime = DateTime(
                  _selectedDate.year,
                  _selectedDate.month,
                  _selectedDate.day,
                  time.hour,
                  time.minute,
                );
                
                final success = await ref.read(medicationReminderProvider.notifier).addReminder(
                  medicationId: _selectedMedicationId!,
                  reminderTime: reminderTime,
                );
                
                if (!success) {
                  allSuccess = false;
                  break;
                }
              }

              if (allSuccess) {
                await ref.read(medicationReminderProvider.notifier).fetchReminders();
                if (mounted) Navigator.of(context).pop();
              } else {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('添加提醒失败')),
                  );
                }
              }
            }
          },
          child: const Text('保存'),
        ),
      ],
    );
  }
} 