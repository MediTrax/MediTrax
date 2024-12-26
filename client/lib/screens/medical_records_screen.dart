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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.history_edu_rounded,
                    color: Colors.blue.shade400,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    '就诊历史',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (canEdit)
                FilledButton.icon(
                  onPressed: () => _showAddVisitDialog(context, ref),
                  icon: const Icon(Icons.add),
                  label: const Text('添加记录'),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: recordsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('加载失败: $error'),
                    ElevatedButton(
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
                if (visitRecords.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.history_edu_outlined,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '暂无就诊记录',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: visitRecords.length,
                  itemBuilder: (context, index) {
                    final record = visitRecords[index];
                    final content = jsonDecode(record.content.toString())
                        as Map<String, dynamic>;
                    return _buildVisitCard(
                      recordId: record.id,
                      date: DateTime.tryParse(content['date'] as String)
                              ?.toString()
                              .split(' ')[0] ??
                          "",
                      type: content['type'] as String,
                      diagnosis: content['diagnosis'] as String,
                      prescription: content['prescription'] as String,
                      canEdit: canEdit,
                      onEdit: () => _showEditVisitDialog(
                        context,
                        ref,
                        recordId: record.id,
                        type: content['type'] as String,
                        diagnosis: content['diagnosis'] as String,
                        prescription: content['prescription'] as String,
                        date: DateTime.tryParse(content['date'] as String) ??
                            DateTime.now(),
                      ),
                      onDelete: () => _showDeleteConfirmationDialog(
                          context, ref, record.id),
                    );
                  },
                );
              },
            ),
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
    required String recordId,
    required Function() onEdit,
    required Function() onDelete,
    required bool canEdit,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Container(
        constraints: const BoxConstraints(minHeight: 100),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.medical_services_rounded,
                          color: Colors.green.shade400,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            type,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (canEdit)
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.grey.shade600,
                      ),
                      onSelected: (value) {
                        if (value == 'edit') {
                          onEdit();
                        } else if (value == 'delete') {
                          onDelete();
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Row(
                            children: [
                              Icon(Icons.edit),
                              SizedBox(width: 8),
                              Text('编辑'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: Colors.red),
                              SizedBox(width: 8),
                              Text('删除', style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue.shade300),
                    ),
                    child: Text(
                      date,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildInfoTag(
              icon: Icons.medical_information_rounded,
              text: '诊断：$diagnosis',
              color: Colors.purple,
            ),
            const SizedBox(height: 8),
            _buildInfoTag(
              icon: Icons.medication_rounded,
              text: '处方：$prescription',
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTag({
    required IconData icon,
    required String text,
    required MaterialColor color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: color.shade700,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: color.shade700,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void _showAddVisitDialog(BuildContext context, WidgetRef ref) {
    DateTime selectedDate = DateTime.now();
    final diagnosisController = TextEditingController();
    final prescriptionController = TextEditingController();
    String visitType = '门诊';
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500,
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title Bar
                    Row(
                      children: [
                        Icon(
                          Icons.add_rounded,
                          color: Colors.blue.shade400,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            '添加就诊记录',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 16),

                    // Date Picker
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.event_rounded,
                          color: Colors.blue.shade300,
                        ),
                        title: const Text('就诊日期'),
                        subtitle: Text(
                          selectedDate.toString().split(' ')[0],
                          style: TextStyle(color: Colors.blue.shade700),
                        ),
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
                    ),
                    const SizedBox(height: 16),

                    // Visit Type
                    DropdownButtonFormField<String>(
                      value: visitType,
                      decoration: InputDecoration(
                        labelText: '就诊类型',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(
                          Icons.medical_services_rounded,
                          color: Colors.purple.shade300,
                        ),
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

                    // Diagnosis
                    TextFormField(
                      controller: diagnosisController,
                      decoration: InputDecoration(
                        labelText: '诊断结果',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(
                          Icons.medical_information_rounded,
                          color: Colors.green.shade300,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入诊断结果';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Prescription
                    TextFormField(
                      controller: prescriptionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: '处方',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(
                          Icons.medication_rounded,
                          color: Colors.orange.shade300,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入处方';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('取消'),
                        ),
                        const SizedBox(width: 8),
                        FilledButton.icon(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                await ref
                                    .read(medicalRecordsProvider.notifier)
                                    .addRecord(
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
                            }
                          },
                          icon: const Icon(Icons.save_rounded),
                          label: const Text('保存'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showEditVisitDialog(
    BuildContext context,
    WidgetRef ref, {
    required String recordId,
    required String type,
    required String diagnosis,
    required String prescription,
    required DateTime date,
  }) {
    // Move controllers outside of the builder
    final diagnosisController = TextEditingController(text: diagnosis);
    final prescriptionController = TextEditingController(text: prescription);
    final formKey = GlobalKey<FormState>();
    DateTime selectedDate = date;
    String visitType = type;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 500,
                maxHeight: MediaQuery.of(context).size.height * 0.9,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Title Bar
                        Row(
                          children: [
                            Icon(
                              Icons.edit_rounded,
                              color: Colors.blue.shade400,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                '编辑就诊记录',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.pop(context),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 16),

                        // Date Picker
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.event_rounded,
                              color: Colors.blue.shade300,
                            ),
                            title: const Text('就诊日期'),
                            subtitle: Text(
                              selectedDate.toString().split(' ')[0],
                              style: TextStyle(color: Colors.blue.shade700),
                            ),
                            onTap: () async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime.now(),
                              );
                              if (date != null) {
                                setState(() => selectedDate = date);
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Visit Type
                        DropdownButtonFormField<String>(
                          value: visitType,
                          decoration: InputDecoration(
                            labelText: '就诊类型',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: Icon(
                              Icons.medical_services_rounded,
                              color: Colors.purple.shade300,
                            ),
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

                        // Diagnosis
                        TextFormField(
                          controller: diagnosisController,
                          decoration: InputDecoration(
                            labelText: '诊断结果',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: Icon(
                              Icons.medical_information_rounded,
                              color: Colors.green.shade300,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '请输入诊断结果';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Prescription
                        TextFormField(
                          controller: prescriptionController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            labelText: '处方',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: Icon(
                              Icons.medication_rounded,
                              color: Colors.orange.shade300,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '请输入处方';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),

                        // Action Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('取消'),
                            ),
                            const SizedBox(width: 8),
                            FilledButton.icon(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  try {
                                    await ref
                                        .read(medicalRecordsProvider.notifier)
                                        .updateRecord(
                                          recordId: recordId,
                                          recordType: 'visit',
                                          content: jsonEncode({
                                            'type': visitType,
                                            'diagnosis':
                                                diagnosisController.text,
                                            'prescription':
                                                prescriptionController.text,
                                            'date':
                                                selectedDate.toIso8601String(),
                                          }),
                                        );
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  } catch (e) {
                                    if (context.mounted) {
                                      ErrorHandler.showErrorSnackBar(
                                          context, e);
                                    }
                                  }
                                }
                              },
                              icon: const Icon(Icons.save_rounded),
                              label: const Text('保存'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, WidgetRef ref, String recordId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: const Text('确定要删除这条记录吗？此操作无法撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () async {
              try {
                await ref
                    .read(medicalRecordsProvider.notifier)
                    .deleteRecord(recordId);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              } catch (e) {
                if (context.mounted) {
                  ErrorHandler.showErrorSnackBar(context, e);
                }
              }
            },
            child: const Text('删除'),
          ),
        ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.medication_rounded,
                    color: Colors.orange.shade400,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    '用药历史',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (canEdit)
                FilledButton.icon(
                  onPressed: () => _showAddMedicationDialog(context, ref),
                  icon: const Icon(Icons.add),
                  label: const Text('添加用药'),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: recordsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('加载失败: $error'),
                    ElevatedButton(
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
                if (medicationRecords.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.medication_outlined,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '暂无用药记录',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: medicationRecords.length,
                  itemBuilder: (context, index) {
                    final record = medicationRecords[index];
                    final content = jsonDecode(record.content.toString())
                        as Map<String, dynamic>;
                    return _buildMedicationCard(
                      recordId: record.id,
                      name: content['name'] as String,
                      dosage: content['dosage'].toString(),
                      frequency: content['frequency'] as String,
                      startDate:
                          DateTime.tryParse(content['startDate'] as String)
                                  ?.toString()
                                  .split(' ')[0] ??
                              "",
                      endDate: content['endDate'] == null
                          ? ""
                          : DateTime.tryParse(content['endDate'] as String)
                                  ?.toString()
                                  .split(' ')[0] ??
                              "",
                      canEdit: canEdit,
                      onEdit: () => _showEditMedicationDialog(
                        context,
                        ref,
                        recordId: record.id,
                        name: content['name'] as String,
                        dosage: content['dosage'] as String,
                        frequency: content['frequency'] as String,
                        startDate:
                            DateTime.tryParse(content['startDate'] as String) ??
                                DateTime.now(),
                        endDate:
                            DateTime.tryParse(content['endDate'] as String) ??
                                DateTime.now(),
                      ),
                      onDelete: () => _showDeleteConfirmationDialog(
                          context, ref, record.id),
                    );
                  },
                );
              },
            ),
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
    required String endDate,
    required String recordId,
    required Function() onEdit,
    required Function() onDelete,
    required bool canEdit,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Container(
        constraints: const BoxConstraints(minHeight: 100),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.medication_rounded,
                          color: Colors.orange.shade400,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (canEdit)
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.grey.shade600,
                      ),
                      onSelected: (value) {
                        if (value == 'edit') {
                          onEdit();
                        } else if (value == 'delete') {
                          onDelete();
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Row(
                            children: [
                              Icon(Icons.edit),
                              SizedBox(width: 8),
                              Text('编辑'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: Colors.red),
                              SizedBox(width: 8),
                              Text('删除', style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue.shade300),
                    ),
                    child: Text(
                      startDate,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildInfoTag(
              icon: Icons.straighten_rounded,
              text: '剂量：$dosage',
              color: Colors.green,
            ),
            const SizedBox(height: 8),
            _buildInfoTag(
              icon: Icons.schedule_rounded,
              text: '频率：$frequency',
              color: Colors.purple,
            ),
            const SizedBox(height: 8),
            _buildInfoTag(
              icon: Icons.date_range_rounded,
              text: '服用期间：$startDate 至 ${endDate.isNotEmpty ? endDate : "持续中"}',
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTag({
    required IconData icon,
    required String text,
    required MaterialColor color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: color.shade700,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: color.shade700,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void _showAddMedicationDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final dosageController = TextEditingController();
    final frequencyController = TextEditingController();
    DateTime selectedStartDate = DateTime.now();
    DateTime? selectedEndDate;
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 500,
                maxHeight: MediaQuery.of(context).size.height * 0.9,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Title Bar
                        Row(
                          children: [
                            Icon(
                              Icons.add_rounded,
                              color: Colors.orange.shade400,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                '添加用药记录',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.pop(context),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 16),

                        // Medication Name
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: '药品名称',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: Icon(
                              Icons.medication_rounded,
                              color: Colors.orange.shade300,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '请输入药品名称';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Dosage
                        TextFormField(
                          controller: dosageController,
                          decoration: InputDecoration(
                            labelText: '剂量',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: Icon(
                              Icons.straighten_rounded,
                              color: Colors.green.shade300,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '请输入剂量';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Frequency
                        TextFormField(
                          controller: frequencyController,
                          decoration: InputDecoration(
                            labelText: '服用频率',
                            hintText: '例如：每日一次',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: Icon(
                              Icons.schedule_rounded,
                              color: Colors.purple.shade300,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '请输入服用频率';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Start Date
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.event_rounded,
                              color: Colors.blue.shade300,
                            ),
                            title: const Text('开始日期'),
                            subtitle: Text(
                              selectedStartDate.toString().split(' ')[0],
                              style: TextStyle(color: Colors.blue.shade700),
                            ),
                            onTap: () async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate: selectedStartDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)),
                              );
                              if (date != null) {
                                setState(() {
                                  selectedStartDate = date;
                                  if (selectedEndDate != null &&
                                      selectedEndDate!.isBefore(date)) {
                                    selectedEndDate = date;
                                  }
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        // End Date
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.event_rounded,
                              color: Colors.red.shade300,
                            ),
                            title: const Text('结束日期（可选）'),
                            subtitle: Text(
                              selectedEndDate?.toString().split(' ')[0] ??
                                  '持续中',
                              style: TextStyle(
                                color: selectedEndDate != null
                                    ? Colors.red.shade700
                                    : Colors.grey.shade600,
                              ),
                            ),
                            trailing: selectedEndDate != null
                                ? IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () =>
                                        setState(() => selectedEndDate = null),
                                  )
                                : null,
                            onTap: () async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate:
                                    selectedEndDate ?? selectedStartDate,
                                firstDate: selectedStartDate,
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)),
                              );
                              if (date != null) {
                                setState(() => selectedEndDate = date);
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Action Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('取消'),
                            ),
                            const SizedBox(width: 8),
                            FilledButton.icon(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  try {
                                    await ref
                                        .read(medicalRecordsProvider.notifier)
                                        .addRecord(
                                      recordType: 'medication',
                                      content: {
                                        'name': nameController.text,
                                        'dosage': dosageController.text,
                                        'frequency': frequencyController.text,
                                        'startDate':
                                            selectedStartDate.toIso8601String(),
                                        'endDate': selectedEndDate
                                                ?.toIso8601String() ??
                                            '',
                                      },
                                    );
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  } catch (e) {
                                    if (context.mounted) {
                                      ErrorHandler.showErrorSnackBar(
                                          context, e);
                                    }
                                  }
                                }
                              },
                              icon: const Icon(Icons.save_rounded),
                              label: const Text('保存'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showEditMedicationDialog(
    BuildContext context,
    WidgetRef ref, {
    required String recordId,
    required String name,
    required String dosage,
    required String frequency,
    required DateTime startDate,
    DateTime? endDate,
  }) {
    // Move controllers outside of the builder
    final nameController = TextEditingController(text: name);
    final dosageController = TextEditingController(text: dosage);
    final frequencyController = TextEditingController(text: frequency);
    final formKey = GlobalKey<FormState>();
    DateTime selectedStartDate = startDate;
    DateTime? selectedEndDate = endDate;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 500,
                maxHeight: MediaQuery.of(context).size.height * 0.9,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Title Bar
                        Row(
                          children: [
                            Icon(
                              Icons.edit_rounded,
                              color: Colors.orange.shade400,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                '编辑用药记录',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.pop(context),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 16),

                        // Same form fields as add dialog
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: '药品名称',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: Icon(
                              Icons.medication_rounded,
                              color: Colors.orange.shade300,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '请输入药品名称';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        TextFormField(
                          controller: dosageController,
                          decoration: InputDecoration(
                            labelText: '剂量',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: Icon(
                              Icons.straighten_rounded,
                              color: Colors.green.shade300,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '请输入剂量';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        TextFormField(
                          controller: frequencyController,
                          decoration: InputDecoration(
                            labelText: '服用频率',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: Icon(
                              Icons.schedule_rounded,
                              color: Colors.purple.shade300,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '请输入服用频率';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.event_rounded,
                              color: Colors.blue.shade300,
                            ),
                            title: const Text('开始日期'),
                            subtitle: Text(
                              selectedStartDate.toString().split(' ')[0],
                              style: TextStyle(color: Colors.blue.shade700),
                            ),
                            onTap: () async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate: selectedStartDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)),
                              );
                              if (date != null) {
                                setState(() => selectedStartDate = date);
                                if (selectedEndDate != null &&
                                    selectedEndDate!.isBefore(date)) {
                                  selectedEndDate = date;
                                }
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        // End Date
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.event_rounded,
                              color: Colors.red.shade300,
                            ),
                            title: const Text('结束日期（可选）'),
                            subtitle: Text(
                              selectedEndDate?.toString().split(' ')[0] ??
                                  '持续中',
                              style: TextStyle(
                                color: selectedEndDate != null
                                    ? Colors.red.shade700
                                    : Colors.grey.shade600,
                              ),
                            ),
                            trailing: selectedEndDate != null
                                ? IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () =>
                                        setState(() => selectedEndDate = null),
                                  )
                                : null,
                            onTap: () async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate:
                                    selectedEndDate ?? selectedStartDate,
                                firstDate: selectedStartDate,
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)),
                              );
                              if (date != null) {
                                setState(() => selectedEndDate = date);
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Action Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('取消'),
                            ),
                            const SizedBox(width: 8),
                            FilledButton.icon(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  try {
                                    await ref
                                        .read(medicalRecordsProvider.notifier)
                                        .updateRecord(
                                          recordId: recordId,
                                          recordType: 'medication',
                                          content: jsonEncode({
                                            'name': nameController.text,
                                            'dosage': dosageController.text,
                                            'frequency':
                                                frequencyController.text,
                                            'startDate': selectedStartDate
                                                .toIso8601String(),
                                            'endDate': selectedEndDate
                                                    ?.toIso8601String() ??
                                                '',
                                          }),
                                        );
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  } catch (e) {
                                    if (context.mounted) {
                                      ErrorHandler.showErrorSnackBar(
                                          context, e);
                                    }
                                  }
                                }
                              },
                              icon: const Icon(Icons.save_rounded),
                              label: const Text('保存'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, WidgetRef ref, String recordId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: const Text('确定要删除这条用药记录吗？此操作无法撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () async {
              try {
                await ref
                    .read(medicalRecordsProvider.notifier)
                    .deleteRecord(recordId);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              } catch (e) {
                if (context.mounted) {
                  ErrorHandler.showErrorSnackBar(context, e);
                }
              }
            },
            child: const Text('删除'),
          ),
        ],
      ),
    );
  }
}
