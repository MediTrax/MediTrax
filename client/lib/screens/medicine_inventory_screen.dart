import 'package:flutter/material.dart';
import 'package:meditrax/models/medication.dart';
import 'package:meditrax/models/medication_reminder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/medication_provider.dart';
import 'package:meditrax/providers/medication_reminder_provider.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:meditrax/widgets/add_reminder_dialog.dart';
import 'package:meditrax/widgets/edit_reminder_dialog.dart';

class MedicineInventoryScreen extends StatelessWidget {
  const MedicineInventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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

  Future<void> _fetchMedications() async {
    try {
      final userData = await ref.read(userDataProvider.future);
      if (userData != null) {
        print("Fetching medications for user: ${userData.id}");
        await ref.read(medicationProvider.notifier).fetchMedications(userData.id);
      } else {
        print("No user data available");
      }
    } catch (e) {
      print("Error fetching medications: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final medicationsState = ref.watch(medicationProvider);
    
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
              FilledButton.icon(
                onPressed: () {
                  DefaultTabController.of(context)?.animateTo(1);
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
                  print("Error in medications state: $error");
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
                          return await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('确认删除'),
                                content: Text('确定要删除 ${medication.name} 吗？'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false); // Don't delete
                                    },
                                    child: const Text('取消'),
                                  ),
                                  FilledButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true); // Confirm delete
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
                        },
                        onDismissed: (_) async {
                          try {
                            final deletedMedication = medication;
                            
                            // Delete medication and its reminders
                            final success = await ref.read(medicationProvider.notifier)
                                .deleteMedication(medication.id);
                            
                            // Refresh reminders after medication deletion
                            await ref.read(medicationReminderProvider.notifier).fetchReminders();
                            
                            if (success && mounted) {
                              _showUndoSnackBar(context, deletedMedication);
                            } else if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('删除失败'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              await _fetchMedications();
                            }
                          } catch (e) {
                            if (mounted) {
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
    final isLowStock = medication.inventory < 10;
    final frequencyParts = medication.frequency.split('/');
    final times = frequencyParts.isNotEmpty ? frequencyParts[0] : '1';
    final days = frequencyParts.length > 1 ? frequencyParts[1] : '1';
    
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
          minHeight: 100, // Minimum height to prevent jumping
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top row with name and inventory
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Medicine name and icon
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
                  // Current inventory display
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isLowStock 
                          ? Colors.orange.withOpacity(0.1)
                          : Colors.green.withOpacity(0.1),
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
            // Information row with fixed height
            SizedBox(
              height: 32, // Fixed height for info row
              child: Row(
                children: [
                  // Dosage info
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
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
                  // Frequency info
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.1),
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
                  // Action buttons
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: () => _showEditDialog(context, ref, medication),
                        icon: Icon(
                          Icons.edit_rounded,
                          color: Colors.blue.shade400,
                          size: 20,
                        ),
                        tooltip: '编辑',
                      ),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: () => _showRefillDialog(context, ref, medication),
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

  void _showEditDialog(BuildContext context, WidgetRef ref, Medication medication) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: medication.name);
    final dosageController = TextEditingController(text: medication.dosage.toString());
    final unitController = TextEditingController(text: medication.unit);
    final frequencyController = TextEditingController(text: medication.frequency);
    final inventoryController = TextEditingController(text: medication.inventory.toString());

    bool isDisposed = false;

    // Function to dispose controllers
    void disposeControllers() {
      if (!isDisposed) {
        nameController.dispose();
        dosageController.dispose();
        unitController.dispose();
        frequencyController.dispose();
        inventoryController.dispose();
        isDisposed = true;
      }
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500,
              maxHeight: MediaQuery.of(dialogContext).size.height * 0.9,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                      Expanded(
                        child: Text(
                          '编辑${medication.name}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                          disposeControllers(); // Dispose controllers on cancel
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                  const Divider(),
                  // Scrollable Content
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Medicine Name Section
                            _buildFormField(
                              controller: nameController,
                              hintText: '入药品名称',
                              prefixIcon: Icons.medication_liquid_rounded,
                              iconColor: Colors.green.shade300,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '请输入药品名称';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Dosage and Unit Section
                            _buildSectionHeader(
                              title: '用药剂量',
                              icon: Icons.scale_rounded,
                              iconColor: Colors.blue.shade400,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: _buildFormField(
                                    controller: dosageController,
                                    hintText: '输入剂量数值',
                                    prefixIcon: Icons.scale_rounded,
                                    iconColor: Colors.blue.shade300,
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '请输入剂量';
                                      }
                                      final number = double.tryParse(value);
                                      if (number == null || number <= 0 || number > 9999) {
                                        return '请输入有效的剂量';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  flex: 2,
                                  child: _buildFormField(
                                    controller: unitController,
                                    hintText: '如: 片',
                                    prefixIcon: Icons.straighten_rounded,
                                    iconColor: Colors.blue.shade300,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '请输入单位';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // Frequency Section
                            _buildSectionHeader(
                              title: '服用频率',
                              icon: Icons.calendar_month_rounded,
                              iconColor: Colors.purple.shade400,
                            ),
                            const SizedBox(height: 8),
                            _buildFormField(
                              controller: frequencyController,
                              hintText: '格式：次数/天数，如 3/1',
                              prefixIcon: Icons.schedule_rounded,
                              iconColor: Colors.purple.shade300,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '请输入服用频率';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Inventory Section
                            _buildSectionHeader(
                              title: '库存信息',
                              icon: Icons.inventory_2_rounded,
                              iconColor: Colors.orange.shade400,
                            ),
                            const SizedBox(height: 8),
                            _buildFormField(
                              controller: inventoryController,
                              hintText: '输入库存数量',
                              prefixIcon: Icons.inventory_rounded,
                              iconColor: Colors.orange.shade300,
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                          disposeControllers(); // Dispose controllers on cancel
                        },
                        child: const Text('取消'),
                      ),
                      const SizedBox(width: 8),
                      FilledButton.icon(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              final success = await ref.read(medicationProvider.notifier)
                                  .updateMedication(
                                    medicationId: medication.id,
                                    name: nameController.text,
                                    dosage: double.parse(dosageController.text),
                                    unit: unitController.text,
                                    frequency: frequencyController.text,
                                    inventory: double.parse(inventoryController.text),
                                  );

                              if (success && dialogContext.mounted) {
                                Navigator.of(dialogContext).pop();
                                disposeControllers(); // Dispose controllers on save
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('药品信息已更新')),
                                );
                                await _fetchMedications();
                              }
                            } catch (e) {
                              if (dialogContext.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('错误: $e'),
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
        );
      },
    ).whenComplete(() {
      disposeControllers(); // Ensure controllers are disposed when dialog is closed
    });
  }

  // Helper method to build form section headers
  Widget _buildSectionHeader({
    required String title,
    required IconData icon,
    required Color iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build form fields with proper constraints
  Widget _buildFormField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    required Color iconColor,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: iconColor,
        ),
        hintText: hintText,
        errorMaxLines: 2,
        isCollapsed: false,
        isDense: true,
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  void _showRefillDialog(BuildContext context, WidgetRef ref, Medication medication) {
    final controller = TextEditingController();
    bool isDisposed = false;
    bool isClosing = false;
    // Add state variable for error
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
        onPopInvoked: (didPop) {
          // Do nothing here, let the then callback handle disposal
        },
        child: AlertDialog(
          title: Text('补充${medication.name}的库存'),
          content: ValueListenableBuilder<String?>(
            valueListenable: errorState,
            builder: (context, error, _) => TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '补充量',
                border: const OutlineInputBorder(),
                errorText: error, // Show error message if any
                errorStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
              onChanged: (_) {
                // Clear error when user types
                errorState.value = null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => closeDialog(dialogContext),
              child: const Text('取消'),
            ),
            FilledButton(
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
                  final success = await ref.read(medicationProvider.notifier)
                      .updateMedication(
                        medicationId: medication.id,
                        inventory: newInventory,
                      );
                  
                  if (success && dialogContext.mounted && !isClosing) {
                    closeDialog(dialogContext);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('库存更新')),
                    );
                    await _fetchMedications();
                  }
                } catch (e) {
                  if (dialogContext.mounted && !isClosing) {
                    errorState.value = '更新失败: $e';
                  }
                }
              },
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    ).whenComplete(() {
      disposeController();
    });
  }

  void _showUndoSnackBar(BuildContext context, Medication deletedMedication) {
    if (!context.mounted) return;
    
    final messenger = ScaffoldMessenger.of(context);
    
    Future.microtask(() async {
      if (!context.mounted) return;
      
      messenger.clearSnackBars();
      messenger.showSnackBar(
        SnackBar(
          content: Text('${deletedMedication.name} 已删除'),
          action: SnackBarAction(
            label: '撤销',
            onPressed: () async {
              try {
                // Restore the medication
                final successRestore = await ref.read(medicationProvider.notifier)
                  .addMedication(
                    name: deletedMedication.name,
                    dosage: deletedMedication.dosage,
                    unit: deletedMedication.unit,
                    frequency: deletedMedication.frequency,
                    inventory: deletedMedication.inventory,
                  );
                  
                if (successRestore) {
                  // Fetch medications after successful restore
                  await _fetchMedications();
                  // Also refresh reminders since they might have been restored
                  await ref.read(medicationReminderProvider.notifier).fetchReminders();
                  
                  if (context.mounted) {
                    messenger.showSnackBar(
                      const SnackBar(
                        content: Text('撤销成功'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                } else {
                  if (context.mounted) {
                    messenger.showSnackBar(
                      const SnackBar(
                        content: Text('撤销失败，请重试'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                  await _fetchMedications();
                }
              } catch (e) {
                print('Error in undo operation: $e');
                if (context.mounted) {
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text('撤销错误: $e'),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
                await _fetchMedications();
              }
            },
          ),
          duration: const Duration(seconds: 5),
          behavior: SnackBarBehavior.fixed,
        ),
      );
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
  int _timesPerPeriod = 1;  // Default to 1 time
  int _periodInDays = 1;    // Default to 1 day
  bool _isLoading = false;

  String get formattedFrequency => '$_timesPerPeriod/$_periodInDays';

  Widget _buildFrequencySelector() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_month_rounded,
                color: Colors.purple.shade400,
                size: 28,
              ),
              const SizedBox(width: 8),
              const Text(
                '服用频率',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
    );
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
            // Medicine Name Section
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.medication_rounded,
                        color: Colors.green.shade400,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '药品信息',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: '药品名称',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.medication_liquid_rounded,
                        color: Colors.green.shade300,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入药品名称';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            // Dosage and Unit Section
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.scale_rounded,
                        color: Colors.blue.shade400,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '用药剂量',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.straighten_rounded,
                                  color: Colors.blue.shade400,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text('剂量'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: dosageController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                prefixIcon: Icon(
                                  Icons.scale_rounded,
                                  color: Colors.blue.shade300,
                                ),
                                hintText: '输入剂量数值',
                              ),
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '请输入剂量';
                                }
                                if (double.tryParse(value) == null) {
                                  return '请输入有效的数字';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.straighten_rounded,
                                  color: Colors.blue.shade400,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text('单位'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: unitController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                prefixIcon: Icon(
                                  Icons.straighten_rounded,
                                  color: Colors.blue.shade300,
                                ),
                                hintText: '如: 片',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '请输入单位';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Frequency Selector (Already styled)
            _buildFrequencySelector(),

            // Inventory Section
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.inventory_2_rounded,
                        color: Colors.orange.shade400,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '库存信息',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: inventoryController,
                    decoration: InputDecoration(
                      labelText: '库存数量',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.inventory_rounded,
                        color: Colors.orange.shade300,
                      ),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入库存数量';
                      }
                      if (double.tryParse(value) == null) {
                        return '请输入有效的数字';
                      }
                      if (double.parse(value) <= 0) {
                        return '库存数必须大于0';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            // Submit Button
            SizedBox(
              height: 48,
              child: FilledButton.icon(
                onPressed: _isLoading ? null : () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _isLoading = true;
                    });

                    try {
                      final success = await ref.read(medicationProvider.notifier)
                          .addMedication(
                            name: nameController.text,
                            dosage: double.parse(dosageController.text),
                            unit: unitController.text,
                            frequency: formattedFrequency,  // Use the formatted frequency
                            inventory: double.parse(inventoryController.text),
                          );

                      if (success && mounted) {
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

                        // Switch to inventory tab
                        if (mounted) {
                          DefaultTabController.of(context)?.animateTo(0);
                        }
                      }
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('错: $e'),
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
                },
                icon: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
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
}

class _ReminderTab extends ConsumerStatefulWidget {
  @override
  ConsumerState<_ReminderTab> createState() => _ReminderTabState();
}

class _ReminderTabState extends ConsumerState<_ReminderTab> {
  // Add class fields
  final List<TextEditingController> _controllers = [];
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _fetchReminders();
  }

  Future<void> _fetchReminders() async {
    if (_isDisposed) return;
    
    try {
      final userData = await ref.read(userDataProvider.future);
      if (userData != null && !_isDisposed) {
        print("Fetching reminders for user: ${userData.id}"); // Debug log
        await ref.read(medicationReminderProvider.notifier).fetchReminders();
      } else {
        print("No user data available for reminders"); // Debug log
      }
    } catch (e, stack) {
      if (!_isDisposed) {
        print("Error fetching reminders: $e"); // Debug log
        print("Stack trace: $stack"); // Debug stack trace
      }
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    // Simply dispose all controllers
    for (final controller in _controllers) {
      controller.dispose();
    }
    _controllers.clear();
    super.dispose();
  }

  TextEditingController _createController(String text) {
    if (_isDisposed) return TextEditingController();
    final controller = TextEditingController(text: text);
    _controllers.add(controller);
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    if (_isDisposed) return const SizedBox();
    
    final remindersState = ref.watch(medicationReminderProvider);
    final medicationsState = ref.watch(medicationProvider);

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
              medicationsState.when(
                loading: () => const SizedBox(),
                error: (_, __) => const SizedBox(),
                data: (medications) {
                  if (medications.isEmpty) {
                    return FilledButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('请先添加药品，然后再添加提醒。'),
                            action: SnackBarAction(
                              label: '关闭',
                              onPressed: () {
                                // Dismiss the snackbar
                              },
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.notification_important),
                      label: const Text('添加提醒'),
                    );
                  }
                  return FilledButton.icon(
                    onPressed: () => _showAddReminderDialog(context, medications),
                    icon: const Icon(Icons.add),
                    label: const Text('添加提醒'),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: remindersState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('加载失败'),
                    ElevatedButton(
                      onPressed: _fetchReminders,
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
              data: (reminders) {
                if (reminders.isEmpty) {
                  return const Center(
                    child: Text('暂无提醒请添加'),
                  );
                }

                return RefreshIndicator(
                  onRefresh: _fetchReminders,
                  child: ListView.builder(
                    itemCount: reminders.length,
                    itemBuilder: (context, index) {
                      if (_isDisposed) return const SizedBox();
                      final reminder = reminders[index];
                      return medicationsState.when(
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (_, __) => const Center(child: Text('加载药品信息失败')),
                        data: (medications) {
                          final medication = medications.firstWhere(
                            (m) => m.id == reminder.medicationId,
                            orElse: () => Medication(
                              id: '',
                              name: '未知药品',
                              dosage: 0,
                              unit: '',
                              frequency: '',
                              inventory: 0,
                              userId: '',
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ),
                          );

                          // Automatically delete reminders for non-existent medications
                          if (medication.name == '未知药��') {
                            Future.microtask(() async {
                              try {
                                await ref.read(medicationReminderProvider.notifier)
                                    .deleteReminder(reminder.id);
                                await _fetchReminders();
                              } catch (e) {
                                print('Error deleting orphaned reminder: $e');
                              }
                            });
                            return const SizedBox(); // Don't show the reminder while it's being deleted
                          }

                          return Dismissible(
                            key: Key(reminder.id),
                            background: Container(
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
                            ),
                            direction: DismissDirection.endToStart,
                            confirmDismiss: (direction) async {
                              return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('确认删除'),
                                    content: Text('确定要删除 ${medication.name} 的提醒吗？'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false); // Don't delete
                                        },
                                        child: const Text('取消'),
                                      ),
                                      FilledButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true); // Confirm delete
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
                            },
                            onDismissed: (_) async {
                              try {
                                final deletedReminder = reminder;
                                
                                final success = await ref.read(medicationReminderProvider.notifier)
                                    .deleteReminder(reminder.id);
                                
                                if (success && mounted) {
                                  _showUndoDeleteSnackBar(context, deletedReminder, medication.name);
                                } else if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('删除失败'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  await _fetchReminders();
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
                                await _fetchReminders();
                              }
                            },
                            child: _buildReminderCard(
                              context: context,
                              reminder: reminder,
                              medication: medication,
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReminderCard({
    required BuildContext context,
    required MedicationReminder reminder,
    required Medication medication,
  }) {
    final frequencyParts = medication.frequency.split('/');
    final times = frequencyParts.isNotEmpty ? frequencyParts[0] : '1';
    final days = frequencyParts.length > 1 ? frequencyParts[1] : '1';
    final isLowStock = medication.inventory < 10;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () => _showEditReminderDialog(context, reminder, medication),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: reminder.isTaken ? Colors.green.shade200 : 
                     isLowStock ? Colors.orange.shade200 : Colors.transparent,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Time Column with fixed width
                SizedBox(
                  width: 90, // Reduced from 100
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange.shade300,
                          Colors.orange.shade400,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.access_alarm,
                          color: Colors.white,
                          size: 24, // Reduced from 28
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _formatTime(reminder.reminderTime),
                          style: const TextStyle(
                            fontSize: 20, // Reduced from 24
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Reduced from 16
                // Content Column
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  medication.name,
                                  style: const TextStyle(
                                    fontSize: 16, // Reduced from 18
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Wrap(
                                  spacing: 4, // Reduced from 8
                                  runSpacing: 4, // Reduced from 8
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6, // Reduced from 8
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        '${medication.dosage}${medication.unit}/次',
                                        style: TextStyle(
                                          color: Colors.blue.shade700,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isLowStock 
                                            ? Colors.orange.withOpacity(0.1)
                                            : Colors.green.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.inventory_2_outlined,
                                            size: 12,
                                            color: isLowStock 
                                                ? Colors.orange.shade700
                                                : Colors.green.shade700,
                                          ),
                                          const SizedBox(width: 2),
                                          Text(
                                            '${medication.inventory.toStringAsFixed(0)}',
                                            style: TextStyle(
                                              color: isLowStock 
                                                  ? Colors.orange.shade700
                                                  : Colors.green.shade700,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 4),
                          // Switch column
                          Column(
                            children: [
                              Switch(
                                value: reminder.isTaken,
                                onChanged: (bool newValue) async {
                                  // Get ScaffoldMessenger reference before async operation
                                  final scaffoldMessenger = ScaffoldMessenger.of(context);
                                  
                                  try {
                                    await ref.read(medicationReminderProvider.notifier)
                                        .toggleReminderStatus(reminder.id, newValue);

                                    if (!mounted) return;

                                    // Refresh both reminders and medications
                                    await _fetchReminders();
                                    final userData = ref.read(userDataProvider).value;
                                    if (userData != null) {
                                      await ref.read(medicationProvider.notifier)
                                          .fetchMedications(userData.id);
                                    }

                                    if (!mounted) return;
                                    
                                    // Use stored reference to show snackbar
                                    scaffoldMessenger.showSnackBar(
                                      SnackBar(
                                        content: Text(newValue ? '已标记为已服用' : '已标记为未服用'),
                                        backgroundColor: newValue ? Colors.green : Colors.orange,
                                      ),
                                    );
                                  } catch (e) {
                                    if (!mounted) return;
                                    
                                    // Use stored reference to show error snackbar
                                    scaffoldMessenger.showSnackBar(
                                      const SnackBar(
                                        content: Text('库存不足，无法标记为已服用。请及时补充库存。'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Text(
                                reminder.isTaken ? '已服用' : '未服用',
                                style: TextStyle(
                                  color: reminder.isTaken
                                      ? Colors.green
                                      : Colors.orange,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 12,
                                  color: Colors.purple.shade700,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '每$days天 $times次',
                                  style: TextStyle(
                                    color: Colors.purple.shade700,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (isLowStock)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.orange.shade200),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.warning_amber_rounded,
                                    size: 12,
                                    color: Colors.orange.shade700,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    '库存不足',
                                    style: TextStyle(
                                      color: Colors.orange.shade700,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddReminderDialog(BuildContext context, List<Medication> medications) {
    showDialog(
      context: context,
      builder: (context) => AddReminderDialog(medications: medications),
    );
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

  String _formatTime(DateTime time) {
    // Convert UTC time to local time
    final localTime = time.toLocal();
    
    // Format time as HH:mm
    return '${localTime.hour.toString().padLeft(2, '0')}:${localTime.minute.toString().padLeft(2, '0')}';
  }

  void _showUndoDeleteSnackBar(BuildContext context, MedicationReminder deletedReminder, String medicationName) {
    if (!context.mounted) return;
    
    final messenger = ScaffoldMessenger.of(context);
    
    Future.microtask(() {
      if (!context.mounted) return;
      
      messenger.clearSnackBars();
      messenger.showSnackBar(
        SnackBar(
          content: Text('$medicationName 的提醒删除'),
          action: SnackBarAction(
            label: '撤销',
            onPressed: () async {
              try {
                // Format the DateTime to ISO 8601 string
                final reminderTimeString = deletedReminder.reminderTime.toIso8601String();
                
                final success = await ref.read(medicationReminderProvider.notifier)
                  .addReminder(
                    medicationId: deletedReminder.medicationId,
                    reminderTime: reminderTimeString,  // Pass the formatted string
                  );
                  
                if (success) {
                  await _fetchReminders();
                  
                  if (context.mounted) {
                    messenger.showSnackBar(
                      const SnackBar(
                        content: Text('撤销成功'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                } else {
                  if (context.mounted) {
                    messenger.showSnackBar(
                      const SnackBar(
                        content: Text('撤销失败，请重试'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                  await _fetchReminders();
                }
              } catch (e) {
                print('Error in undo operation: $e');
                if (context.mounted) {
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text('撤销错误: $e'),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
                await _fetchReminders();
              }
            },
          ),
          duration: const Duration(seconds: 5),
          behavior: SnackBarBehavior.fixed,
        ),
      );
    });
  }
}