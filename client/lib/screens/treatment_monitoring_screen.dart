import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/health_metrics_provider.dart';
import 'package:meditrax/providers/user_provider.dart';
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
                    Icons.monitor_heart_rounded,
                    color: Colors.blue.shade400,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    '健康指标',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (canEdit)
                FilledButton.icon(
                  onPressed: () => _showAddMetricDialog(context, ref),
                  icon: const Icon(Icons.add),
                  label: const Text('添加指标'),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: metricsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('加载失败: $error'),
                    ElevatedButton(
                      onPressed: () => ref.refresh(healthMetricsProvider),
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
              data: (metrics) {
                if (metrics.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.monitor_heart_outlined,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '暂无健康指标',
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
                      canEdit,
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

  Widget _buildMetricCard(
    BuildContext context,
    WidgetRef ref,
    String id,
    String type,
    double value,
    String unit,
    DateTime recordedAt,
    bool canEdit,
  ) {
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
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.monitor_heart_rounded,
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
                      '$value $unit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 16,
                        color: Colors.grey.shade700,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        recordedAt.toString().split(' ')[0],
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (canEdit)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: () => _showEditMetricDialog(
                          context,
                          ref,
                          id,
                          type,
                          value,
                          unit,
                        ),
                        icon: Icon(
                          Icons.edit_rounded,
                          color: Colors.blue.shade400,
                          size: 20,
                        ),
                        tooltip: '编辑',
                      ),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: () => _showDeleteConfirmation(
                          context,
                          ref,
                          id,
                        ),
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.red.shade400,
                          size: 20,
                        ),
                        tooltip: '删除',
                      ),
                    ],
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
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500,
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
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
                          '添加健康指标',
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

                  // Form Fields
                  TextFormField(
                    controller: typeController,
                    decoration: InputDecoration(
                      labelText: '指标类型',
                      hintText: '例如：血压、血糖等',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.monitor_heart_rounded,
                        color: Colors.blue.shade300,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入指标类型';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: valueController,
                    decoration: InputDecoration(
                      labelText: '数值',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.straighten_rounded,
                        color: Colors.green.shade300,
                      ),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入数值';
                      }
                      final number = double.tryParse(value);
                      if (number == null || number <= 0) {
                        return '请输入有效的数值';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: unitController,
                    decoration: InputDecoration(
                      labelText: '单位',
                      hintText: '例如：mmHg、mg/dL等',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.science_rounded,
                        color: Colors.purple.shade300,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入单位';
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
                                  .read(healthMetricsProvider.notifier)
                                  .addMetric(
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
                    Icons.calendar_month_rounded,
                    color: Colors.purple.shade400,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    '治疗日程',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (canEdit)
                FilledButton.icon(
                  onPressed: () => _showAddScheduleDialog(context, ref),
                  icon: const Icon(Icons.add),
                  label: const Text('添加日程'),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: schedulesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('加载失败: $error'),
                    ElevatedButton(
                      onPressed: () => ref.refresh(treatmentSchedulesProvider),
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
              data: (schedules) {
                if (schedules.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_busy_rounded,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '暂无治疗日程',
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
                      canEdit,
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

  Widget _buildScheduleCard(
    BuildContext context,
    WidgetRef ref,
    String id,
    String type,
    DateTime scheduledTime,
    String location,
    String? notes,
    bool canEdit,
  ) {
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
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.event_rounded,
                          color: Colors.purple.shade400,
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.purple.shade300),
                    ),
                    child: Text(
                      scheduledTime.toString().split(' ')[0],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoTag(
                        icon: Icons.location_on_rounded,
                        text: location,
                        color: Colors.blue,
                      ),
                      if (notes != null && notes.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        _buildInfoTag(
                          icon: Icons.notes_rounded,
                          text: notes,
                          color: Colors.grey,
                        ),
                      ],
                    ],
                  ),
                ),
                if (canEdit)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: () => _showEditScheduleDialog(
                          context,
                          ref,
                          id,
                          type,
                          scheduledTime,
                          location,
                          notes,
                        ),
                        icon: Icon(
                          Icons.edit_rounded,
                          color: Colors.blue.shade400,
                          size: 20,
                        ),
                        tooltip: '编辑',
                      ),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: () => _showDeleteConfirmation(
                          context,
                          ref,
                          id,
                        ),
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.red.shade400,
                          size: 20,
                        ),
                        tooltip: '删除',
                      ),
                    ],
                  ),
              ],
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: color.shade700,
          ),
          const SizedBox(width: 4),
          Flexible(
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

  void _showAddScheduleDialog(BuildContext context, WidgetRef ref) {
    final typeController = TextEditingController();
    final locationController = TextEditingController();
    final notesController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    DateTime selectedTime = DateTime.now();

    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500,
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
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
                        Icons.calendar_month_rounded,
                        color: Colors.purple.shade400,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          '添加治疗日程',
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

                  // Treatment Type
                  TextFormField(
                    controller: typeController,
                    decoration: InputDecoration(
                      labelText: '治疗类型',
                      hintText: '例如：复诊、理疗等',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.medical_services_rounded,
                        color: Colors.purple.shade300,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入治疗类型';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Date Time Picker
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
                      title: const Text('选择时间'),
                      subtitle: Text(
                        '${selectedTime.toString().split('.')[0]}',
                        style: TextStyle(color: Colors.blue.shade700),
                      ),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: selectedTime,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
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
                  ),
                  const SizedBox(height: 16),

                  // Location
                  TextFormField(
                    controller: locationController,
                    decoration: InputDecoration(
                      labelText: '地点',
                      hintText: '例如：XX医院',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.location_on_rounded,
                        color: Colors.green.shade300,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入地点';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Notes
                  TextFormField(
                    controller: notesController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: '备注',
                      hintText: '可选',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.notes_rounded,
                        color: Colors.orange.shade300,
                      ),
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
                                  .read(treatmentSchedulesProvider.notifier)
                                  .addSchedule(
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
    final formKey = GlobalKey<FormState>();
    DateTime selectedTime = currentTime;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500,
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
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
                        Icons.edit_calendar_rounded,
                        color: Colors.blue.shade400,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          '编辑治疗日程',
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

                  // Form fields (same as add dialog)
                  TextFormField(
                    controller: typeController,
                    decoration: InputDecoration(
                      labelText: '治疗类型',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.medical_services_rounded,
                        color: Colors.purple.shade300,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入治疗类型';
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
                      title: const Text('选择时间'),
                      subtitle: Text(
                        selectedTime.toString().split('.')[0],
                        style: TextStyle(color: Colors.blue.shade700),
                      ),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: selectedTime,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
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
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: locationController,
                    decoration: InputDecoration(
                      labelText: '地点',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.location_on_rounded,
                        color: Colors.green.shade300,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入地点';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: notesController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: '备注',
                      hintText: '可选',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.notes_rounded,
                        color: Colors.orange.shade300,
                      ),
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
