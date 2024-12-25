import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/medication.dart';
import '../providers/medication_reminder_provider.dart';

class ReminderSchedule {
  DateTime date;
  TimeOfDay time;

  ReminderSchedule({required this.date, required this.time});
}

class AddReminderDialog extends ConsumerStatefulWidget {
  final List<Medication> medications;

  const AddReminderDialog({super.key, required this.medications});

  @override
  ConsumerState<AddReminderDialog> createState() => _AddReminderDialogState();
}

class _AddReminderDialogState extends ConsumerState<AddReminderDialog> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  String? _selectedMedicationId;
  List<ReminderSchedule> _reminderSchedules = [];

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

  void _updateSchedulesBasedOnFrequency(String medicationId) {
    final medication =
        widget.medications.firstWhere((m) => m.id == medicationId);
    final frequency = parseFrequency(medication.frequency);
    final timesPerPeriod = frequency['times']!;
    final periodInDays = frequency['days']!;

    // Calculate interval between reminders
    final intervalDays = (periodInDays / timesPerPeriod).ceil();

    setState(() {
      // Initialize with current time for first reminder
      final currentTime = TimeOfDay.now();
      final baseDate = DateTime.now();

      _reminderSchedules = List.generate(timesPerPeriod, (index) {
        return ReminderSchedule(
          date: DateTime(
            baseDate.year,
            baseDate.month,
            baseDate.day + (index * intervalDays),
          ),
          time: currentTime,
        );
      });
    });
  }

  Map<String, int> parseFrequency(String frequency) {
    final parts = frequency.split('/');
    final times = int.tryParse(parts[0]) ?? 1;
    final days = parts.length > 1 ? int.tryParse(parts[1]) ?? 1 : 1;
    return {'times': times, 'days': days};
  }

  Future<void> _saveReminder() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedMedicationId == null) return;
      bool allSuccess = true;
      // Create multiple reminders distributed across the period
      for (int i = 0; i < _reminderSchedules.length; i++) {
        final reminderTime = DateTime(
          _reminderSchedules[i].date.year,
          _reminderSchedules[i].date.month,
          _reminderSchedules[i].date.day,
          _reminderSchedules[i].time.hour,
          _reminderSchedules[i].time.minute,
        );

        final success =
            await ref.read(medicationReminderProvider.notifier).addReminder(
                  medicationId: _selectedMedicationId!,
                  reminderTime: reminderTime,
                );

        if (!success) {
          allSuccess = false;
          break;
        }
      }

      if (context.mounted) {
        if (allSuccess) {
          await ref.read(medicationReminderProvider.notifier).fetchReminders();
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('提醒已添加')),
            );
            Navigator.of(context).pop();
          } else {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('添加提醒失败')),
              );
            }
          }
        }
      }
    }
  }

  Widget _buildSchedulesList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_reminderSchedules.length, (index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '提醒 ${index + 1}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Add date picker button
                    TextButton.icon(
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _reminderSchedules[index].date,
                          firstDate: _selectedDate,
                          lastDate: _selectedDate.add(
                            Duration(
                              days: int.parse(widget.medications
                                  .firstWhere(
                                      (m) => m.id == _selectedMedicationId!)
                                  .frequency
                                  .split('/')[1]),
                            ),
                          ),
                        );
                        if (picked != null) {
                          setState(() {
                            _reminderSchedules[index].date = DateTime(
                              picked.year,
                              picked.month,
                              picked.day,
                              _reminderSchedules[index].time.hour,
                              _reminderSchedules[index].time.minute,
                            );
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_today),
                      label: Text(
                        '${_reminderSchedules[index].date.year}-'
                        '${_reminderSchedules[index].date.month.toString().padLeft(2, '0')}-'
                        '${_reminderSchedules[index].date.day.toString().padLeft(2, '0')}',
                      ),
                    ),
                  ],
                ),
                // Time Picker
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('时间'),
                  subtitle:
                      Text(_reminderSchedules[index].time.format(context)),
                  trailing: const Icon(Icons.access_time),
                  onTap: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: _reminderSchedules[index].time,
                    );
                    if (picked != null) {
                      setState(() {
                        _reminderSchedules[index].time = picked;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('添加提醒'),
      content: SingleChildScrollView(
        child: SizedBox(
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
                        _updateSchedulesBasedOnFrequency(value);
                      });
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: '选择药品',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                _buildSchedulesList(),
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
          onPressed: _saveReminder,
          child: const Text('保存'),
        ),
      ],
    );
  }
}
