import 'package:flutter/material.dart';
import 'package:meditrax/models/medication.dart';
import 'package:meditrax/models/medication_reminder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/medication_provider.dart';
import 'package:meditrax/providers/medication_reminder_provider.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:meditrax/widgets/add_reminder_dialog.dart';
import 'package:meditrax/widgets/edit_reminder_dialog.dart';
import 'package:flutter/services.dart';
import 'package:meditrax/services/notification_service.dart';

class MedicineInventoryScreen extends ConsumerStatefulWidget {
  const MedicineInventoryScreen({super.key});

  @override
  ConsumerState<MedicineInventoryScreen> createState() =>
      _MedicineInventoryScreenState();
}

class _MedicineInventoryScreenState
    extends ConsumerState<MedicineInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedProfile = ref.watch(appStateProvider).selectedProfile;
    final currentUser = ref.watch(userDataProvider).value;

    final bool canEdit =
        selectedProfile == null || selectedProfile == currentUser?.id;
    return canEdit
        ? DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('药品管理'),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: '药品库存'),
                    Tab(text: '添加药品'),
                    Tab(text: '服药提醒'),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  _InventoryTab(),
                  _AddMedicineTab(),
                  _ReminderTab(),
                ],
              ),
            ),
          )
        : DefaultTabController(
            length: 1,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('药品管理'),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: '药品库存'),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  _InventoryTab(),
                ],
              ),
            ),
          );
  }
}

class _InventoryTab extends ConsumerStatefulWidget {
  @override
  ConsumerState<_InventoryTab> createState() => _InventoryTabState();
}

class _InventoryTabState extends ConsumerState<_InventoryTab> {
  @override
  void initState() {
    super.initState();
    // Fetch medications when the tab is initialized
    _fetchMedications();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Fetch medications whenever dependencies change, such as when the tab is switched
    _fetchMedications();
  }

  Future<void> _fetchMedications() async {
    try {
      final userData = await ref.read(userDataProvider.future);
      if (userData != null) {
        await ref.read(medicationProviderProvider.notifier).fetchMedications();
        setState(() {}); // Notify the framework to rebuild the UI
      }
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('加载失败'),
            content: Text('加载失败: $e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.read(userDataProvider).value;
    final medicationsState = ref.watch(medicationProviderProvider);
    final selectedProfile = ref.watch(appStateProvider).selectedProfile;

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
                    color: Colors.blue.shade400,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    '药品库存',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (canEdit)
                FilledButton.icon(
                  onPressed: () {
                    DefaultTabController.of(context).animateTo(1);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('添加药品'),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _fetchMedications,
              child: medicationsState.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('加载失败: $error'),
                        ElevatedButton(
                          onPressed: _fetchMedications,
                          child: const Text('重试'),
                        ),
                      ],
                    ),
                  );
                },
                data: (medications) {
                  if (medications.isEmpty) {
                    return const Center(
                      child: Text('暂无药品，请添加'),
                    );
                  }
                  return ListView.builder(
                    itemCount: medications.length,
                    itemBuilder: (context, index) {
                      final medication = medications[index];
                      return Dismissible(
                        key: Key(medication.id),
                        background: _buildDismissibleBackground(),
                        direction: DismissDirection.endToStart,
                        confirmDismiss: (direction) async {
                          // Show confirmation dialog before deleting
                          if (canEdit) {
                            return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('确认删除'),
                                  content: Text('确定要删除 ${medication.name} 吗？'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(false); // Don't delete
                                      },
                                      child: const Text('取消'),
                                    ),
                                    FilledButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(true); // Confirm delete
                                      },
                                      style: FilledButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      child: const Text('删除'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          return false;
                        },
                        onDismissed: (_) async {
                          try {
                            final deletedMedication = medication;
                            // 保存 ScaffoldMessenger 的引用
                            final messenger = ScaffoldMessenger.of(context);

                            // Delete medication and its reminders
                            final success = await ref
                                .read(medicationProviderProvider.notifier)
                                .deleteMedication(medication.id);

                            // Refresh reminders after medication deletion
                            await ref
                                .read(medicationReminderProvider.notifier)
                                .fetchReminders();

                            if (success && mounted) {
                              // 使用保存的 messenger 引用来显示 SnackBar
                              messenger.showSnackBar(
                                SnackBar(
                                  content: Row(
                                    children: [
                                      const Icon(
                                        Icons.delete_outline_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Text('${deletedMedication.name} 已删除'),
                                    ],
                                  ),
                                  duration: const Duration(seconds: 2),
                                  behavior: SnackBarBehavior.fixed,
                                ),
                              );
                            } else if (mounted) {
                              messenger.showSnackBar(
                                const SnackBar(
                                  content: Text('删除失败'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              await _fetchMedications();
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('错误: $e'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              await _fetchMedications();
                            }
                          }
                        },
                        child: _buildMedicineCard(
                          context: context,
                          ref: ref,
                          medication: medication,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicineCard({
    required BuildContext context,
    required WidgetRef ref,
    required Medication medication,
  }) {
    final frequencyParts = medication.frequency.split('/');

    final times =
        frequencyParts.isNotEmpty ? int.tryParse(frequencyParts[0]) ?? 1 : 1;

    final days =
        frequencyParts.length > 1 ? int.tryParse(frequencyParts[1]) ?? 1 : 1;

    final dailyUsage = (times * medication.dosage) / days;

    final remainingDays = medication.inventory / dailyUsage;

    // Determine if low stock warning should be triggered
    final isLowStock = remainingDays < 3;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isLowStock ? Colors.orange.shade200 : Colors.grey.shade200,
          width: isLowStock ? 2 : 1,
        ),
      ),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 100,
        ),
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
                          Icons.medication_rounded,
                          color: Colors.green.shade400,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            medication.name,
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
                      color: isLowStock
                          ? Colors.orange.withAlpha(25)
                          : Colors.green.withAlpha(25),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isLowStock
                            ? Colors.orange.shade300
                            : Colors.green.shade300,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.inventory_2_rounded,
                          size: 16,
                          color: isLowStock
                              ? Colors.orange.shade700
                              : Colors.green.shade700,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${medication.inventory.toStringAsFixed(0)}${medication.unit}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isLowStock
                                ? Colors.orange.shade700
                                : Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 32,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.withAlpha(25),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.medication,
                          size: 16,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${medication.dosage}${medication.unit}/次',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple.withAlpha(25),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.schedule,
                          size: 16,
                          color: Colors.purple,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '每$days天$times次',
                          style: const TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: () =>
                            _showEditDialog(context, ref, medication),
                        icon: Icon(
                          Icons.edit_rounded,
                          color: Colors.blue.shade400,
                          size: 20,
                        ),
                        tooltip: '编辑',
                      ),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: () =>
                            _showRefillDialog(context, ref, medication),
                        icon: Icon(
                          Icons.add_circle_outline_rounded,
                          color: Colors.green.shade400,
                          size: 20,
                        ),
                        tooltip: '补充库存',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDismissibleBackground() {
    return Container(
      color: Colors.red.shade100,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.red.shade700,
          ),
          const SizedBox(width: 8),
          Text(
            '删除',
            style: TextStyle(
              color: Colors.red.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(
      BuildContext context, WidgetRef ref, Medication medication) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: medication.name);
    final dosageController =
        TextEditingController(text: medication.dosage.toString());
    final unitController = TextEditingController(text: medication.unit);
    final inventoryController =
        TextEditingController(text: medication.inventory.toString());

    // Split frequency into times and days
    final frequencyParts = medication.frequency.split('/');
    final timesController = TextEditingController(
        text: frequencyParts.isNotEmpty ? frequencyParts[0] : '1');
    final daysController = TextEditingController(
        text: frequencyParts.length > 1 ? frequencyParts[1] : '1');

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
                    // Title Bar
                    Row(
                      children: [
                        Icon(
                          Icons.edit_calendar_rounded,
                          color: Colors.blue.shade400,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '编辑${medication.name}',
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

                    // Medicine Name
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: '药品名称',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(
                          Icons.medication_liquid_rounded,
                          color: Colors.purple.shade300,
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

                    // Dosage Input with dynamic unit
                    TextFormField(
                      controller: dosageController,
                      decoration: InputDecoration(
                        labelText: '剂量',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(
                          Icons.scale_rounded,
                          color: Colors.green.shade300,
                        ),
                        suffixText: unitController.text, // 使用当前选择的单位
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(
                            r'^\d*\.?\d*$')), // Only allow numbers and one decimal point
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入剂量';
                        }
                        final number = double.tryParse(value);
                        if (number == null || number <= 0) {
                          return '请输入有效的剂量';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Unit Dropdown
                    DropdownButtonFormField<String>(
                      value: unitController.text.isEmpty
                          ? null
                          : unitController.text,
                      decoration: InputDecoration(
                        labelText: '单位',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(
                          Icons.straighten_rounded,
                          color: Colors.orange.shade300,
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: '片',
                          child: Text('片'),
                        ),
                        DropdownMenuItem(
                          value: '毫升',
                          child: Text('毫升'),
                        ),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请选择单位';
                        }
                        return null;
                      },
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            unitController.text = newValue;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    // Frequency fields
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: daysController,
                            decoration: InputDecoration(
                              labelText: '每隔几天',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: Icon(
                                Icons.calendar_today_rounded,
                                color: Colors.purple.shade300,
                              ),
                              suffixText: '天',
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter
                                  .digitsOnly, // Only allow digits
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '请输入天数';
                              }
                              final days = int.tryParse(value);
                              if (days == null || days <= 0) {
                                return '请输入有效天数';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: timesController,
                            decoration: InputDecoration(
                              labelText: '服用次数',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: Icon(
                                Icons.access_time_rounded,
                                color: Colors.blue.shade300,
                              ),
                              suffixText: '次',
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter
                                  .digitsOnly, // Only allow digits
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '请输入次数';
                              }
                              final times = int.tryParse(value);
                              if (times == null || times <= 0) {
                                return '请输入有效次数';
                              }
                              if (times > 24) {
                                return '次数不能超过24';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Inventory with dynamic unit
                    TextFormField(
                      controller: inventoryController,
                      decoration: InputDecoration(
                        labelText: '库存',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(
                          Icons.inventory_rounded,
                          color: Colors.orange.shade300,
                        ),
                        suffixText: unitController.text, // 使用当前选择的单位
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(
                            r'^\d*\.?\d*$')), // Only allow numbers and one decimal point
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入库存数量';
                        }
                        final number = double.tryParse(value);
                        if (number == null || number < 0) {
                          return '请输入有效的库存数量';
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
                                final success = await ref
                                    .read(medicationProviderProvider.notifier)
                                    .updateMedication(
                                      medicationId: medication.id,
                                      name: nameController.text,
                                      dosage:
                                          double.parse(dosageController.text),
                                      unit: unitController.text,
                                      inventory: double.parse(
                                          inventoryController.text),
                                      frequency:
                                          '${timesController.text}/${daysController.text}',
                                    );

                                if (success && context.mounted) {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('药品更新成功')),
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('更新失败: $e'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
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

  void _showRefillDialog(
      BuildContext context, WidgetRef ref, Medication medication) {
    final controller = TextEditingController();
    bool isDisposed = false;
    bool isClosing = false;
    final errorState = ValueNotifier<String?>(null);

    void disposeController() {
      if (!isDisposed) {
        controller.dispose();
        errorState.dispose(); // Dispose the ValueNotifier
        isDisposed = true;
      }
    }

    void closeDialog(BuildContext dialogContext) {
      if (!isClosing) {
        isClosing = true;
        Navigator.of(dialogContext).pop();
      }
    }

    showDialog(
      context: context,
      builder: (dialogContext) => PopScope(
        canPop: !isClosing,
        onPopInvokedWithResult: (didPop, _) {},
        child: AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.add_circle_outline_rounded,
                color: Colors.green.shade400,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  '补充${medication.name}的库存',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 当前库存信息卡片
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade100),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.inventory_2_rounded,
                      color: Colors.blue.shade700,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '当前库存: ${medication.inventory}${medication.unit}',
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // 补充量输入框
              ValueListenableBuilder<String?>(
                valueListenable: errorState,
                builder: (context, error, _) => TextField(
                  controller: controller,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                  ],
                  decoration: InputDecoration(
                    labelText: '补充量',
                    labelStyle: TextStyle(color: Colors.green.shade600),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green.shade400),
                    ),
                    errorText: error,
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                    prefixIcon: Icon(
                      Icons.add_box_rounded,
                      color: Colors.green.shade400,
                    ),
                    suffixText: medication.unit,
                    suffixStyle: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onChanged: (_) {
                    errorState.value = null;
                  },
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => closeDialog(dialogContext),
              child: Text(
                '取消',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            FilledButton.icon(
              onPressed: () async {
                if (controller.text.trim().isEmpty) {
                  errorState.value = '请输入补充剂量';
                  return;
                }
                final amount = double.tryParse(controller.text);
                if (amount == null || amount <= 0) {
                  errorState.value = '请输入有效的补充剂量';
                  return;
                }

                try {
                  final newInventory = medication.inventory + amount;
                  final success = await ref
                      .read(medicationProviderProvider.notifier)
                      .updateMedication(
                        medicationId: medication.id,
                        inventory: newInventory,
                      );
                  if (success && dialogContext.mounted && !isClosing) {
                    closeDialog(dialogContext);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text('库存更新成功'),
                          ],
                        ),
                        backgroundColor: Colors.green.shade600,
                      ),
                    );
                    // 刷新数据
                    ref.invalidate(medicationProviderProvider);
                    await ref
                        .read(medicationProviderProvider.notifier)
                        .fetchMedications();
                  }
                } catch (e) {
                  if (dialogContext.mounted && !isClosing) {
                    errorState.value = '更新失败: $e';
                  }
                }
              },
              icon: const Icon(Icons.save_rounded),
              label: const Text('保存'),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green.shade600,
              ),
            ),
          ],
        ),
      ),
    ).whenComplete(() {
      disposeController();
    });
  }
}

class _AddMedicineTab extends ConsumerStatefulWidget {
  @override
  ConsumerState<_AddMedicineTab> createState() => _AddMedicineTabState();
}

class _AddMedicineTabState extends ConsumerState<_AddMedicineTab> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final dosageController = TextEditingController();
  final unitController = TextEditingController();
  final inventoryController = TextEditingController();
  int _timesPerPeriod = 1;
  int _periodInDays = 1;
  bool _isLoading = false;

  final List<String> _unitOptions = ['片', '毫升'];

  String get formattedFrequency => '$_timesPerPeriod/$_periodInDays';

  // Add a state variable to track selected unit
  String? _selectedUnit;

  Future<void> _addMedication() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Explicitly dismiss keyboard before navigation
        FocusScope.of(context).unfocus();

        final success =
            await ref.read(medicationProviderProvider.notifier).addMedication(
                  name: nameController.text,
                  dosage: double.parse(dosageController.text),
                  unit: unitController.text,
                  frequency: formattedFrequency,
                  inventory: double.parse(inventoryController.text),
                );

        if (!mounted) return;

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('药品添加成功')),
          );

          // Clear the form
          _formKey.currentState!.reset();
          nameController.clear();
          dosageController.clear();
          unitController.clear();
          inventoryController.clear();
          setState(() {
            _timesPerPeriod = 1;
            _periodInDays = 1;
          });

          // Add a small delay before navigation to ensure keyboard is dismissed
          await Future.delayed(const Duration(milliseconds: 100));

          // Switch to inventory tab
          if (mounted) {
            DefaultTabController.of(context).animateTo(0);
          }
        } else {
          // Show error dialog for medication already exists
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
                  const Text('药品已存在'),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('药品"${nameController.text}"已存在。'),
                  const SizedBox(height: 8),
                  Text(
                    '请使用不同的药品名称。',
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
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('错误: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Medicine Name Card
            _buildSectionCard(
              title: '药品信息',
              icon: Icons.medication_rounded,
              iconColor: Colors.green.shade400,
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(
                    Icons.medication_liquid_rounded,
                    color: Colors.green.shade300,
                  ),
                  hintText: '输入药品名称',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入药品名称';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 12),

            // Dosage and Unit Card
            _buildSectionCard(
              title: '用药剂量',
              icon: Icons.scale_rounded,
              iconColor: Colors.blue.shade400,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dosage Input
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: dosageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(
                          Icons.scale_rounded,
                          color: Colors.blue.shade300,
                        ),
                        hintText: '输入剂量值',
                        suffixText: _selectedUnit,
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*$')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入剂量';
                        }
                        final number = double.tryParse(value);
                        if (number == null || number <= 0) {
                          return '请输入有效的剂量';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Unit Dropdown
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField<String>(
                      value: _selectedUnit,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.straighten_rounded,
                          color: Colors.blue.shade300,
                        ),
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                      ),
                      hint: const Text('单位'),
                      items: _unitOptions.map((String unit) {
                        return DropdownMenuItem<String>(
                          value: unit,
                          child: Text(unit),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请选择单位';
                        }
                        return null;
                      },
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _selectedUnit = newValue;
                            unitController.text = newValue;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Frequency Card
            _buildSectionCard(
              title: '服用频率',
              icon: Icons.calendar_month_rounded,
              iconColor: Colors.purple.shade400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.repeat_rounded,
                                  color: Colors.blue.shade400,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text('每隔几天'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<int>(
                              value: _periodInDays,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                prefixIcon: Icon(
                                  Icons.calendar_today_rounded,
                                  color: Colors.blue.shade300,
                                ),
                              ),
                              items: List.generate(7, (index) => index + 1)
                                  .map((days) => DropdownMenuItem(
                                        value: days,
                                        child: Text('$days天'),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    _periodInDays = value;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.alarm_rounded,
                                  color: Colors.orange.shade400,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text('服用次数'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              initialValue: _timesPerPeriod.toString(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                prefixIcon: Icon(
                                  Icons.medication_rounded,
                                  color: Colors.orange.shade300,
                                ),
                                suffixText: '次',
                                hintText: '输入次数',
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '请输入次数';
                                }
                                final times = int.tryParse(value);
                                if (times == null) {
                                  return '请输入有效数字';
                                }
                                if (times <= 0) {
                                  return '次数必须大于0';
                                }
                                if (times > 24) {
                                  return '次数不能超过24';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                final times = int.tryParse(value);
                                if (times != null && times > 0 && times <= 24) {
                                  setState(() {
                                    _timesPerPeriod = times;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.purple.shade100),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          size: 20,
                          color: Colors.purple.shade700,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '每$_periodInDays天服用$_timesPerPeriod次',
                          style: TextStyle(
                            color: Colors.purple.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Inventory Card
            _buildSectionCard(
              title: '库存信息',
              icon: Icons.inventory_2_rounded,
              iconColor: Colors.orange.shade400,
              child: TextFormField(
                controller: inventoryController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(
                    Icons.inventory_rounded,
                    color: Colors.orange.shade300,
                  ),
                  hintText:
                      '输入库存数量${_selectedUnit != null ? '(单位：$_selectedUnit)' : ''}',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入库存数量';
                  }
                  final number = double.tryParse(value);
                  if (number == null || number <= 0) {
                    return '请输入有效的库存数量';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),

            // Submit Button
            SizedBox(
              height: 48,
              child: FilledButton.icon(
                onPressed: _isLoading ? null : _addMedication,
                icon: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Icon(Icons.save_rounded),
                label: Text(_isLoading ? '保存中...' : '保存'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required Widget child,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _ReminderTab extends ConsumerStatefulWidget {
  @override
  ConsumerState<_ReminderTab> createState() => _ReminderTabState();
}

class _ReminderTabState extends ConsumerState<_ReminderTab> {
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
    _fetchReminders();
  }

  Future<void> _initializeNotifications() async {
    await _notificationService.initialize();
    // Set up notification response handler
    await _notificationService.setOnNotificationResponse((String? payload) {
      if (payload != null) {
        _handleNotificationResponse(payload);
      }
    });
  }

  void _handleNotificationResponse(String reminderId) async {
    // Show a dialog when notification is tapped
    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.medication_rounded,
                color: Colors.blue.shade400,
              ),
              const SizedBox(width: 8),
              const Text('服药提醒'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('现在是您的服药时间'),
              const SizedBox(height: 8),
              Text(
                '是否已经服用药物？',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('稍后提醒'),
            ),
            FilledButton.icon(
              onPressed: () async {
                // Mark reminder as taken
                final success = await ref
                    .read(medicationReminderProvider.notifier)
                    .toggleReminderStatus(reminderId, true);

                if (context.mounted) {
                  Navigator.of(context).pop();

                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('已标记为已服用')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('库存不足，无法标记为已服用。请及时补充库存。'),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  }
                }
              },
              icon: const Icon(Icons.check),
              label: const Text('已服用'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildReminderCard({
    required BuildContext context,
    required MedicationReminder reminder,
    required Medication medication,
    required Function(bool) onToggle,
  }) {
    if (!reminder.isTaken) {
      _notificationService.scheduleReminder(reminder, medication.name);
    }

    return Dismissible(
      key: Key(reminder.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red.shade100,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete_outline,
              color: Colors.red.shade700,
            ),
            const SizedBox(width: 8),
            Text(
              '删除',
              style: TextStyle(
                color: Colors.red.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.red.shade400,
                  ),
                  const SizedBox(width: 8),
                  const Text('确认删除'),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('确定要删除 ${medication.name} 的提醒吗？'),
                  const SizedBox(height: 8),
                  Text(
                    '此操作无法撤销。',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Don't delete
                  },
                  child: const Text('取消'),
                ),
                FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop(true); // Confirm delete
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('删除'),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (_) async {
        try {
          final success = await ref
              .read(medicationReminderProvider.notifier)
              .deleteReminder(reminder.id);

          if (success && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('提醒已删除'),
              ),
            );
          } else if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('删除失败'),
                backgroundColor: Colors.red,
              ),
            );
            await _fetchReminders();
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('错误: $e'),
                backgroundColor: Colors.red,
              ),
            );
            await _fetchReminders();
          }
        }
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _showEditReminderDialog(context, reminder, medication),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Time Display
                Container(
                  width: 100,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange.shade300, Colors.orange.shade400],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.access_time_rounded,
                          color: Colors.white, size: 24),
                      const SizedBox(height: 4),
                      Text(
                        _formatTime(reminder.reminderTime),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(50),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _formatReminderDate(reminder.reminderTime),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),

                // Medication Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        medication.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _buildTag(
                            text: '${medication.dosage}${medication.unit}/次',
                            backgroundColor: Colors.blue.shade50,
                            textColor: Colors.blue.shade700,
                          ),
                          const SizedBox(width: 8),
                          _buildTag(
                            text: _getFrequencyText(medication.frequency),
                            backgroundColor: Colors.purple.shade50,
                            textColor: Colors.purple.shade700,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Status Switch
                Column(
                  children: [
                    Switch(
                      value: reminder.isTaken,
                      onChanged: onToggle,
                    ),
                    Text(
                      reminder.isTaken ? '已服用' : '未服用',
                      style: TextStyle(
                        color: reminder.isTaken ? Colors.green : Colors.orange,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTag({
    required String text,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 12),
      ),
    );
  }

  String _getFrequencyText(String frequency) {
    final parts = frequency.split('/');
    final times = parts[0];
    final days = parts.length > 1 ? parts[1] : '1';
    return '每$days天$times次';
  }

  void _showEditReminderDialog(
    BuildContext context,
    MedicationReminder reminder,
    Medication medication,
  ) {
    showDialog(
      context: context,
      builder: (context) => EditReminderDialog(
        reminder: reminder,
        medicationName: medication.name,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final remindersState = ref.watch(medicationReminderProvider);
    final medicationsState = ref.watch(medicationProviderProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Title and Add Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.alarm_rounded,
                    color: Colors.purple.shade400,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    '服药提醒',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              FilledButton.icon(
                onPressed: () {
                  medicationsState.whenData((medications) {
                    if (medications.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('请先添加药品，然后再添加提醒')),
                      );
                      return;
                    }
                    showDialog(
                      context: context,
                      builder: (context) =>
                          AddReminderDialog(medications: medications),
                    );
                  });
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  minimumSize: const Size(120, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                icon: const Icon(Icons.add, size: 20),
                label: const Text('添加提醒'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Reminders List
          Expanded(
            child: remindersState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text('Error: $error')),
              data: (reminders) => medicationsState.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(child: Text('Error: $error')),
                data: (medications) {
                  if (reminders.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications_none_rounded,
                            size: 64,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '暂无提醒',
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
                    itemCount: reminders.length,
                    itemBuilder: (context, index) {
                      final medication = medications.firstWhere(
                        (m) => m.id == reminders[index].medicationId,
                        orElse: () => throw Exception('Medication not found'),
                      );
                      return _buildReminderCard(
                        context: context,
                        reminder: reminders[index],
                        medication: medication,
                        onToggle: (value) =>
                            _handleReminderToggle(reminders[index], value),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _fetchReminders() async {
    try {
      final userData = await ref.read(userDataProvider.future);
      if (userData != null) {
        await ref.read(medicationReminderProvider.notifier).fetchReminders();
      }
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('加载失败'),
            content: Text('加载失败: $e'),
          ),
        );
      }
    }
  }

  String _formatTime(DateTime time) {
    final localTime = time.toLocal();
    return '${localTime.hour.toString().padLeft(2, '0')}:${localTime.minute.toString().padLeft(2, '0')}';
  }

  String _formatReminderDate(DateTime reminderTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final reminderDate =
        DateTime(reminderTime.year, reminderTime.month, reminderTime.day);

    if (reminderDate == today) {
      return '今天';
    } else if (reminderDate == tomorrow) {
      return '明天';
    } else {
      return '${reminderDate.day}/${reminderDate.month}';
    }
  }

  Future<void> _handleReminderToggle(
      MedicationReminder reminder, bool value) async {
    // Only show confirmation dialog when marking as taken
    if (value) {
      // Check if the reminder is for today or past
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final reminderDate = DateTime(
        reminder.reminderTime.year,
        reminder.reminderTime.month,
        reminder.reminderTime.day,
      );

      // If the reminder is for a future date, show warning and return
      if (reminderDate.isAfter(today)) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text('不能提前服用未来的药物'),
                ],
              ),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.fixed,
            ),
          );
        }
        return;
      }

      final reminderDetails = await ref
          .read(medicationReminderProvider.notifier)
          .getReminderDetails(reminder.id);

      if (reminderDetails == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('无法获取药品信息'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }

      if (!mounted) return;

      // Show confirmation dialog
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          final medication = reminderDetails['medication'];
          return AlertDialog(
            title: Row(
              children: [
                Icon(
                  Icons.medication_rounded,
                  color: Colors.blue.shade400,
                ),
                const SizedBox(width: 8),
                const Text('确认服用药物'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('您确定要服用以下药物吗？'),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.shade100),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${medication['name']}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '剂量: ${medication['dosage']}${medication['unit']}',
                          style: TextStyle(
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (medication['inventory'] != null) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.inventory_2_rounded,
                              size: 16,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '当前库存: ${medication['inventory']}${medication['unit']}',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('取消'),
              ),
              FilledButton.icon(
                onPressed: () => Navigator.of(context).pop(true),
                icon: const Icon(Icons.check),
                label: const Text('确认服用'),
              ),
            ],
          );
        },
      );

      if (confirmed == true) {
        final success = await ref
            .read(medicationReminderProvider.notifier)
            .confirmAndTakeMedication(reminder.id);

        if (success) {
          // 使用 invalidate 来强制重新获取数据并触发 UI 更新
          ref.invalidate(medicationProviderProvider);
          await ref
              .read(medicationProviderProvider.notifier)
              .fetchMedications();

          // 如果需要确保提醒列表也更新
          ref.invalidate(medicationReminderProvider);
          await ref.read(medicationReminderProvider.notifier).fetchReminders();
        }

        if (!success && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('库存不足，无法标记为已服用。请及时补充库存。'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }
    } else {
      // For marking as not taken, just update the reminder
      final success =
          await ref.read(medicationReminderProvider.notifier).updateReminder(
                reminderId: reminder.id,
                reminderTime: reminder.reminderTime,
                isTaken: false,
              );

      if (!success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('更新失败，请重试'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
