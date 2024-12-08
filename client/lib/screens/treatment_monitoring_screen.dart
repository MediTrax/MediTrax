import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/health_metrics_provider.dart';
import 'package:meditrax/utils/error_handler.dart';

class TreatmentMonitoringScreen extends StatelessWidget {
  const TreatmentMonitoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('治疗监测'),
          bottom: const TabBar(
            tabs: [
              Tab(text: '健康指标'),
              Tab(text: '治疗日程'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _HealthMetricsTab(),
            _TreatmentSchedulesTab(),
          ],
        ),
      ),
    );
  }
}

class _HealthMetricsTab extends ConsumerWidget {
  const _HealthMetricsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metricsAsync = ref.watch(healthMetricsProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '健康指标',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            '记录和追踪您的健康数据',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: metricsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('加载失败'),
                    TextButton(
                      onPressed: () => ref.refresh(healthMetricsProvider),
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
              data: (metrics) => metrics.isEmpty
                  ? const Center(child: Text('暂无健康指标记录'))
                  : ListView.builder(
                      itemCount: metrics.length,
                      itemBuilder: (context, index) {
                        final metric = metrics[index];
                        return _buildMetricCard(
                          context,
                          ref,
                          metric.id,
                          metric.metricType,
                          metric.value,
                          metric.unit,
                          metric.recordedAt,
                        );
                      },
                    ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => _showAddMetricDialog(context, ref),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('添加新指标'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(
    BuildContext context,
    WidgetRef ref,
    String id,
    String type,
    double value,
    String unit,
    DateTime recordedAt,
  ) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$value $unit',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    '记录于 ${recordedAt.toString().split(' ')[0]}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              onSelected: (action) {
                if (action == 'edit') {
                  _showEditMetricDialog(context, ref, id, type, value, unit);
                } else if (action == 'delete') {
                  _showDeleteConfirmation(context, ref, id);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('编辑'),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text(
                    '删除',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAddMetricDialog(BuildContext context, WidgetRef ref) {
    final typeController = TextEditingController();
    final valueController = TextEditingController();
    final unitController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('添加健康指标'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: typeController,
              decoration: const InputDecoration(
                labelText: '指标类型',
                hintText: '例如：血压、血糖等',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(
                labelText: '数值',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: unitController,
              decoration: const InputDecoration(
                labelText: '单位',
                hintText: '例如：mmHg、mg/dL等',
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
                await ref.read(healthMetricsProvider.notifier).addMetric(
                      metricType: typeController.text,
                      value: double.parse(valueController.text),
                      unit: unitController.text,
                      recordedAt: DateTime.now(),
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
            child: const Text('添加'),
          ),
        ],
      ),
    );
  }

  void _showEditMetricDialog(
    BuildContext context,
    WidgetRef ref,
    String id,
    String type,
    double value,
    String unit,
  ) {
    final valueController = TextEditingController(text: value.toString());
    final unitController = TextEditingController(text: unit);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('编辑健康指标'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('指标类型: $type'),
            const SizedBox(height: 16),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(labelText: '数值'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: unitController,
              decoration: const InputDecoration(labelText: '单位'),
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
                await ref.read(healthMetricsProvider.notifier).updateMetric(
                      metricId: id,
                      value: double.parse(valueController.text),
                      unit: unitController.text,
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

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: const Text('确定要删除这条健康指标记录吗？此操作不可撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                await ref.read(healthMetricsProvider.notifier).deleteMetric(id);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              } catch (e) {
                if (context.mounted) {
                  ErrorHandler.showErrorSnackBar(context, e);
                }
              }
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('删除'),
          ),
        ],
      ),
    );
  }
}

class _TreatmentSchedulesTab extends ConsumerWidget {
  const _TreatmentSchedulesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedulesAsync = ref.watch(treatmentSchedulesProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '治疗日程',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            '管理您的治疗和复诊安排',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: schedulesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('加载失败'),
                    TextButton(
                      onPressed: () => ref.refresh(treatmentSchedulesProvider),
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
              data: (schedules) => schedules.isEmpty
                  ? const Center(child: Text('暂无治疗日程'))
                  : ListView.builder(
                      itemCount: schedules.length,
                      itemBuilder: (context, index) {
                        final schedule = schedules[index];
                        return _buildScheduleCard(
                          context,
                          ref,
                          schedule.id,
                          schedule.treatmentType,
                          schedule.scheduledTime,
                          schedule.location,
                          schedule.notes,
                        );
                      },
                    ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => _showAddScheduleDialog(context, ref),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('添加新日程'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleCard(
    BuildContext context,
    WidgetRef ref,
    String id,
    String type,
    DateTime scheduledTime,
    String location,
    String? notes,
  ) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '时间：${scheduledTime.toString().split('.')[0]}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    '地点：$location',
                    style: const TextStyle(fontSize: 16),
                  ),
                  if (notes != null && notes.isNotEmpty)
                    Text(
                      '备注：$notes',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                  _showEditScheduleDialog(
                    context,
                    ref,
                    id,
                    type,
                    scheduledTime,
                    location,
                    notes,
                  );
                } else if (value == 'delete') {
                  _showDeleteConfirmation(context, ref, id);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('编辑'),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text(
                    '删除',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAddScheduleDialog(BuildContext context, WidgetRef ref) {
    final typeController = TextEditingController();
    final locationController = TextEditingController();
    final notesController = TextEditingController();
    DateTime selectedTime = DateTime.now();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('添加治疗日程'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: typeController,
                decoration: const InputDecoration(
                  labelText: '治疗类型',
                  hintText: '例如：复诊、理疗等',
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('选择时间'),
                subtitle: Text(selectedTime.toString().split('.')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: selectedTime,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null && context.mounted) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(selectedTime),
                    );
                    if (time != null) {
                      selectedTime = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        time.hour,
                        time.minute,
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(
                  labelText: '地点',
                  hintText: '例如：XX医院',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: notesController,
                decoration: const InputDecoration(
                  labelText: '备注',
                  hintText: '可选',
                ),
                maxLines: 2,
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
                await ref.read(treatmentSchedulesProvider.notifier).addSchedule(
                      treatmentType: typeController.text,
                      scheduledTime: selectedTime,
                      location: locationController.text,
                      notes: notesController.text.isEmpty
                          ? null
                          : notesController.text,
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
            child: const Text('添加'),
          ),
        ],
      ),
    );
  }

  void _showEditScheduleDialog(
    BuildContext context,
    WidgetRef ref,
    String id,
    String currentType,
    DateTime currentTime,
    String currentLocation,
    String? currentNotes,
  ) {
    final typeController = TextEditingController(text: currentType);
    final locationController = TextEditingController(text: currentLocation);
    final notesController = TextEditingController(text: currentNotes ?? '');
    DateTime selectedTime = currentTime;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('编辑治疗日程'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: typeController,
                decoration: const InputDecoration(labelText: '治疗类型'),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('选择时间'),
                subtitle: Text(selectedTime.toString().split('.')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: selectedTime,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null && context.mounted) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(selectedTime),
                    );
                    if (time != null) {
                      selectedTime = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        time.hour,
                        time.minute,
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(labelText: '地点'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: notesController,
                decoration: const InputDecoration(labelText: '备注'),
                maxLines: 2,
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
                await ref
                    .read(treatmentSchedulesProvider.notifier)
                    .updateSchedule(
                      scheduleId: id,
                      treatmentType: typeController.text,
                      scheduledTime: selectedTime,
                      location: locationController.text,
                      notes: notesController.text.isEmpty
                          ? null
                          : notesController.text,
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

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: const Text('确定要删除这条治疗日程吗？此操作不可撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                await ref
                    .read(treatmentSchedulesProvider.notifier)
                    .deleteSchedule(id);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              } catch (e) {
                if (context.mounted) {
                  ErrorHandler.showErrorSnackBar(context, e);
                }
              }
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('删除'),
          ),
        ],
      ),
    );
  }
}
