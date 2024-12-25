import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/health_metrics_provider.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:meditrax/utils/error_handler.dart';
import 'package:fl_chart/fl_chart.dart';

const Map<String, String> COMMON_HEALTH_METRICS = {
  '血压': 'mmHg',
  '血糖': 'mmol/L',
  '体重': 'kg',
  '尿量': 'mL',
  '肌酐': 'μmol/L',
  '尿素氮': 'mmol/L',
  '血钾': 'mmol/L',
  '血钠': 'mmol/L',
  '血磷': 'mmol/L',
  '血钙': 'mmol/L',
  '甲状旁腺激素': 'pg/mL',
  '血红蛋白': 'g/L',
  '白蛋白': 'g/L',
};

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

                // Group metrics by type
                final groupedMetrics = <String, List<dynamic>>{};
                for (var metric in metrics) {
                  if (!groupedMetrics.containsKey(metric.metricType)) {
                    groupedMetrics[metric.metricType] = [];
                  }
                  groupedMetrics[metric.metricType]!.add({
                    'value': metric.value,
                    'date': metric.recordedAt,
                    'unit': metric.unit,
                    'id': metric.id,
                  });
                }

                // Sort each group by date
                groupedMetrics.forEach((key, value) {
                  value.sort(
                      (a, b) => (a['date'] as DateTime).compareTo(b['date']));
                });

                return ListView.builder(
                  itemCount: groupedMetrics.length,
                  itemBuilder: (context, index) {
                    final type = groupedMetrics.keys.elementAt(index);
                    final typeMetrics = groupedMetrics[type]!;
                    final unit = typeMetrics.first['unit'];

                    return Card(
                      elevation: 0,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey.shade200),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  type,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  unit,
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              height: 200,
                              child: LineChart(
                                LineChartData(
                                  gridData: const FlGridData(show: true),
                                  titlesData: FlTitlesData(
                                    leftTitles: const AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 40,
                                      ),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: (value, meta) {
                                          if (value.toInt() >= 0 &&
                                              value.toInt() <
                                                  typeMetrics.length) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                _formatDate(
                                                    typeMetrics[value.toInt()]
                                                        ['date']),
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            );
                                          }
                                          return const Text('');
                                        },
                                        reservedSize: 30,
                                      ),
                                    ),
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                  ),
                                  borderData: FlBorderData(show: true),
                                  lineBarsData: [
                                    _createLineChartBarData(
                                      typeMetrics,
                                      context,
                                      ref,
                                      type,
                                      unit,
                                    ),
                                  ],
                                  lineTouchData: _createLineTouchData(
                                    typeMetrics,
                                    context,
                                    ref,
                                    type,
                                    unit,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            if (canEdit)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton.icon(
                                    onPressed: () => _showAddMetricDialog(
                                      context,
                                      ref,
                                      initialType: type,
                                      initialUnit: unit,
                                    ),
                                    icon: const Icon(Icons.add),
                                    label: const Text('添加数据点'),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
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

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}';
  }

  void _showAddMetricDialog(
    BuildContext context,
    WidgetRef ref, {
    String? initialType,
    String? initialUnit,
  }) {
    final formKey = GlobalKey<FormState>();
    final unitController = TextEditingController(text: initialUnit);
    String? selectedType = initialType;
    DateTime selectedDate = DateTime.now();

    // Get existing metric types and their units
    final metrics = ref.read(healthMetricsProvider).value ?? [];
    final existingMetrics = <String, String>{};
    for (var metric in metrics) {
      if (!existingMetrics.containsKey(metric.metricType)) {
        existingMetrics[metric.metricType] = metric.unit;
      }
    }

    // If initialType is provided, this is adding a data point to existing metric
    final bool isAddingToExisting = initialType != null;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Dialog(
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
                    // Dialog title
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

                    // Show type selection only if not adding to existing
                    if (!isAddingToExisting)
                      Autocomplete<String>(
                        initialValue: TextEditingValue(text: initialType ?? ''),
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            return [
                              ...COMMON_HEALTH_METRICS.keys,
                              ...existingMetrics.keys
                            ];
                          }
                          return [
                            ...COMMON_HEALTH_METRICS.keys,
                            ...existingMetrics.keys
                          ].where((type) => type
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()));
                        },
                        onSelected: (String selection) {
                          setState(() {
                            selectedType = selection;
                            // Set unit based on common metrics or existing metrics
                            if (COMMON_HEALTH_METRICS.containsKey(selection)) {
                              unitController.text =
                                  COMMON_HEALTH_METRICS[selection]!;
                            } else if (existingMetrics.containsKey(selection)) {
                              unitController.text = existingMetrics[selection]!;
                            }
                          });
                        },
                        fieldViewBuilder: (context, textEditingController,
                            focusNode, onFieldSubmitted) {
                          return TextFormField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              labelText: '指标类型',
                              hintText: '选择或输入新的指标类型',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: Icon(
                                Icons.monitor_heart_rounded,
                                color: Colors.purple.shade300,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '请输入指标类型';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                                // Clear unit if type is not in common or existing metrics
                                if (!COMMON_HEALTH_METRICS.containsKey(value) &&
                                    !existingMetrics.containsKey(value)) {
                                  unitController.text = '';
                                }
                              });
                            },
                          );
                        },
                      )
                    else
                      // Show read-only type field when adding to existing
                      TextFormField(
                        initialValue: initialType,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: '指标类型',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: Icon(
                            Icons.monitor_heart_rounded,
                            color: Colors.purple.shade300,
                          ),
                        ),
                      ),
                    const SizedBox(height: 16),

                    // Unit field (always read-only when adding to existing)
                    TextFormField(
                      controller: unitController,
                      decoration: InputDecoration(
                        labelText: '单位',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(
                          Icons.science_rounded,
                          color: Colors.orange.shade300,
                        ),
                      ),
                      readOnly: isAddingToExisting ||
                          (selectedType != null &&
                              (COMMON_HEALTH_METRICS
                                      .containsKey(selectedType) ||
                                  existingMetrics.containsKey(selectedType))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入单位';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Value and date editor
                    _MetricValueEditor(
                      initialValue: null,
                      unit: unitController.text,
                      date: selectedDate,
                      onSave: (newValue, newDate) async {
                        if (formKey.currentState!.validate() &&
                            selectedType != null) {
                          try {
                            await ref
                                .read(healthMetricsProvider.notifier)
                                .addMetric(
                                  metricType: selectedType!,
                                  value: newValue,
                                  unit: unitController.text,
                                  recordedAt: newDate,
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

  void _handleDataPointClick(
    BuildContext context,
    WidgetRef ref,
    String id,
    String type,
    double value,
    String unit,
    DateTime date,
  ) {
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.edit_rounded,
                      color: Colors.blue.shade400,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '编辑 $type 数据',
                        style: const TextStyle(
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

                // Value editor without unit editing capability
                _MetricValueEditor(
                  initialValue: value,
                  unit: unit,
                  date: date,
                  onSave: (newValue, newDate) async {
                    try {
                      await ref
                          .read(healthMetricsProvider.notifier)
                          .updateMetric(
                            metricId: id,
                            value: newValue,
                            unit: unit, // Keep the existing unit
                            recordedAt: newDate,
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
                  onDelete: () async {
                    // Show confirmation dialog
                    if (context.mounted) {
                      final shouldDelete = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('确认删除'),
                          content: Text('确定要删除这条 $type 的记录吗？此操作不可撤销。'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('取消'),
                            ),
                            FilledButton(
                              onPressed: () => Navigator.pop(context, true),
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: const Text('删除'),
                            ),
                          ],
                        ),
                      );

                      if (shouldDelete == true) {
                        try {
                          await ref
                              .read(healthMetricsProvider.notifier)
                              .deleteMetric(id);
                          if (context.mounted) {
                            Navigator.pop(context); // Close the edit dialog
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ErrorHandler.showErrorSnackBar(context, e);
                          }
                        }
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  LineChartBarData _createLineChartBarData(
    List<dynamic> typeMetrics,
    BuildContext context,
    WidgetRef ref,
    String type,
    String unit,
  ) {
    return LineChartBarData(
      spots: List.generate(
        typeMetrics.length,
        (i) => FlSpot(
          i.toDouble(),
          typeMetrics[i]['value'],
        ),
      ),
      isCurved: true,
      color: Colors.blue,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) {
          return FlDotCirclePainter(
            radius: 6,
            color: Colors.blue,
            strokeWidth: 2,
            strokeColor: Colors.white,
          );
        },
      ),
      belowBarData: BarAreaData(
        show: true,
        color: Colors.blue.withAlpha(25),
      ),
    );
  }

  LineTouchData _createLineTouchData(
    List<dynamic> typeMetrics,
    BuildContext context,
    WidgetRef ref,
    String type,
    String unit,
  ) {
    return LineTouchData(
      enabled: true,
      touchTooltipData: LineTouchTooltipData(
        // tooltipBgColor: Colors.blueAccent,
        getTooltipItems: (List<LineBarSpot> touchedSpots) {
          return touchedSpots.map((LineBarSpot touchedSpot) {
            final index = touchedSpot.x.toInt();
            if (index >= 0 && index < typeMetrics.length) {
              final value = typeMetrics[index]['value'];
              return LineTooltipItem(
                '$value $unit',
                const TextStyle(color: Colors.white),
              );
            }
            return null;
          }).toList();
        },
      ),
      handleBuiltInTouches: true,
      touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
        if (event is FlTapUpEvent && touchResponse?.lineBarSpots != null) {
          final spot = touchResponse!.lineBarSpots!.first;
          final index = spot.x.toInt();
          if (index >= 0 && index < typeMetrics.length) {
            final metric = typeMetrics[index];
            _handleDataPointClick(
              context,
              ref,
              metric['id'],
              type,
              metric['value'],
              unit,
              metric['date'],
            );
          }
        }
      },
    );
  }
}

class _MetricValueEditor extends StatefulWidget {
  final double? initialValue;
  final String unit;
  final DateTime date;
  final Function(double value, DateTime date) onSave;
  final VoidCallback? onDelete;

  const _MetricValueEditor({
    required this.initialValue,
    required this.unit,
    required this.date,
    required this.onSave,
    this.onDelete,
  });

  @override
  State<_MetricValueEditor> createState() => _MetricValueEditorState();
}

class _MetricValueEditorState extends State<_MetricValueEditor> {
  late final TextEditingController valueController;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    valueController = TextEditingController(
      text: widget.initialValue?.toString() ?? '',
    );
    selectedDate = widget.date;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: valueController,
          decoration: InputDecoration(
            labelText: '数值',
            suffixText: widget.unit,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: Icon(
              Icons.straighten_rounded,
              color: Colors.green.shade300,
            ),
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
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

        // Date picker
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
            title: const Text('记录时间'),
            subtitle: Text(
              selectedDate.toString().split('.')[0],
              style: TextStyle(color: Colors.blue.shade700),
            ),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );
              if (date != null && context.mounted) {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(selectedDate),
                  builder: (BuildContext context, Widget? child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: false),
                      child: child!,
                    );
                  },
                );
                if (time != null) {
                  setState(() {
                    selectedDate = DateTime(
                      date.year,
                      date.month,
                      date.day,
                      time.hour,
                      time.minute,
                    );
                  });
                }
              }
            },
          ),
        ),
        const SizedBox(height: 24),

        // Action buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (widget.onDelete != null) ...[
              TextButton.icon(
                onPressed: widget.onDelete,
                icon: Icon(Icons.delete_outline, color: Colors.red.shade400),
                label: Text(
                  '删除',
                  style: TextStyle(color: Colors.red.shade400),
                ),
              ),
              const SizedBox(width: 8),
            ],
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('取消'),
            ),
            const SizedBox(width: 8),
            FilledButton.icon(
              onPressed: () {
                final value = double.tryParse(valueController.text);
                if (value != null) {
                  widget.onSave(value, selectedDate);
                }
              },
              icon: const Icon(Icons.save_rounded),
              label: const Text('保存'),
            ),
          ],
        ),
      ],
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
                      color: Colors.purple.withAlpha(25),
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
                            builder: (BuildContext context, Widget? child) {
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: false),
                                child: child!,
                              );
                            },
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
                            builder: (BuildContext context, Widget? child) {
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: false),
                                child: child!,
                              );
                            },
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
