import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:meditrax/providers/medical_records_provider.dart';
import 'package:meditrax/utils/error_handler.dart';
import 'package:meditrax/providers/app_state.dart';

class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('医疗档案'),
          bottom: const TabBar(
            tabs: [
              Tab(text: '就诊历史'),
              Tab(text: '用药历史'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _VisitHistoryTab(),
            _MedicationHistoryTab(),
          ],
        ),
      ),
    );
  }
}

class _VisitHistoryTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordsAsync = ref.watch(medicalRecordsProvider);
    final selectedProfile = ref.watch(appStateProvider).selectedProfile;
    final currentUser = ref.watch(userDataProvider).value;

    final bool canEdit =
        selectedProfile == null || selectedProfile == currentUser?.id;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '就诊历史',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            '查看您的就诊记录和诊断结果',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: recordsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('加载失败'),
                    TextButton(
                      onPressed: () => ref.refresh(medicalRecordsProvider),
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
              data: (records) {
                final visitRecords = ref
                    .read(medicalRecordsProvider.notifier)
                    .getRecordsByType('visit');
                return visitRecords.isEmpty
                    ? const Center(child: Text('暂无就诊记录'))
                    : ListView.builder(
                        itemCount: visitRecords.length,
                        itemBuilder: (context, index) {
                          final record = visitRecords[index];
                          final content = jsonDecode(record.content.toString())
                              as Map<String, dynamic>;
                          return _buildVisitCard(
                            date: record.createdAt.toString().split(' ')[0],
                            type: content['type'] as String,
                            diagnosis: content['diagnosis'] as String,
                            prescription: content['prescription'] as String,
                          );
                        },
                      );
              },
            ),
          ),
          if (canEdit) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => _showAddVisitDialog(context, ref),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('添加新记录'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showAddVisitDialog(BuildContext context, WidgetRef ref) {
    DateTime selectedDate = DateTime.now();
    final diagnosisController = TextEditingController();
    final prescriptionController = TextEditingController();
    String visitType = '门诊'; // Default value

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('添加就诊记录'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('就诊日期'),
                subtitle: Text(selectedDate.toString().split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    selectedDate = date;
                  }
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: visitType,
                decoration: const InputDecoration(
                  labelText: '就诊类型',
                ),
                items: ['门诊', '住院'].map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  visitType = value!;
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: diagnosisController,
                decoration: const InputDecoration(
                  labelText: '诊断结果',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: prescriptionController,
                decoration: const InputDecoration(
                  labelText: '处方',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                await ref.read(medicalRecordsProvider.notifier).addRecord(
                  recordType: 'visit',
                  content: {
                    'type': visitType,
                    'diagnosis': diagnosisController.text,
                    'prescription': prescriptionController.text,
                    'date': selectedDate.toIso8601String(),
                  },
                );
                if (context.mounted) {
                  Navigator.pop(context);
                }
              } catch (e) {
                if (context.mounted) {
                  ErrorHandler.showErrorSnackBar(context, e);
                }
              }
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  Widget _buildVisitCard({
    required String date,
    required String type,
    required String diagnosis,
    required String prescription,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    type,
                    style: TextStyle(
                      color: Colors.blue.shade700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text('诊断：'),
                Text(
                  diagnosis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('处方：'),
                Expanded(
                  child: Text(
                    prescription,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MedicationHistoryTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordsAsync = ref.watch(medicalRecordsProvider);
    final selectedProfile = ref.watch(appStateProvider).selectedProfile;
    final currentUser = ref.watch(userDataProvider).value;

    final bool canEdit =
        selectedProfile == null || selectedProfile == currentUser?.id;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '用药历史',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            '查看您的用药记录和当前用药情况',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: recordsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('加载失败'),
                    TextButton(
                      onPressed: () => ref.refresh(medicalRecordsProvider),
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
              data: (records) {
                final medicationRecords = ref
                    .read(medicalRecordsProvider.notifier)
                    .getRecordsByType('medication');
                return medicationRecords.isEmpty
                    ? const Center(child: Text('暂无用药记录'))
                    : ListView.builder(
                        itemCount: medicationRecords.length,
                        itemBuilder: (context, index) {
                          final record = medicationRecords[index];
                          final content = jsonDecode(record.content.toString())
                              as Map<String, dynamic>;
                          return _buildMedicationCard(
                            name: content['name'] as String,
                            dosage: content['dosage'] as String,
                            frequency: content['frequency'] as String,
                            startDate:
                                record.createdAt.toString().split(' ')[0],
                          );
                        },
                      );
              },
            ),
          ),
          if (canEdit) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => _showAddMedicationDialog(context, ref),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('添加新用药'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showAddMedicationDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final dosageController = TextEditingController();
    final frequencyController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('添加用药记录'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: '药品名称',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: dosageController,
                decoration: const InputDecoration(
                  labelText: '剂量',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: frequencyController,
                decoration: const InputDecoration(
                  labelText: '服用频率',
                  hintText: '例如：每日一次',
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('开始日期'),
                subtitle: Text(selectedDate.toString().split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    selectedDate = date;
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                await ref.read(medicalRecordsProvider.notifier).addRecord(
                  recordType: 'medication',
                  content: {
                    'name': nameController.text,
                    'dosage': dosageController.text,
                    'frequency': frequencyController.text,
                    'startDate': selectedDate.toIso8601String(),
                  },
                );
                if (context.mounted) {
                  Navigator.pop(context);
                }
              } catch (e) {
                if (context.mounted) {
                  ErrorHandler.showErrorSnackBar(context, e);
                }
              }
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicationCard({
    required String name,
    required String dosage,
    required String frequency,
    required String startDate,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text('剂量：'),
                Text(
                  dosage,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('频率：'),
                Text(
                  frequency,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('开始日期：'),
                Text(
                  startDate,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
