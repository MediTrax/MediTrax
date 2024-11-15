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
              const Text(
                '药品库存',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
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
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 16),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
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

                            final success = await ref.read(medicationProvider.notifier)
                                .deleteMedication(medication.id);
                            
                              if (success && mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${medication.name} 已删除'),
                                    action: SnackBarAction(
                                      label: '撤销',
                                      onPressed: () async {
                                        // Re-fetch medications to restore the list
                                        final successRestore = await ref.read(medicationProvider.notifier)
                                          .addMedication(
                                            name: deletedMedication.name,
                                            dosage: deletedMedication.dosage,
                                            unit: deletedMedication.unit,
                                            frequency: deletedMedication.frequency,
                                            inventory: deletedMedication.inventory,
                                          );
                                        if (successRestore) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('撤销成功')),
                                          );
                                          _fetchMedications();
                                        }
                                      },
                                    ),
                                  ),
                                );
                            } else if (mounted) {
                              // If deletion failed, show error and refresh the list
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('删除失败'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              _fetchMedications();
                            }
                          } catch (e) {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('错误: $e'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              _fetchMedications();
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
                    medication.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${medication.dosage}${medication.unit} - ${medication.frequency}',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '库存: ${medication.inventory.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: medication.inventory < 10 ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showEditDialog(context, ref, medication),
                    ),
                    TextButton(
                      onPressed: () => _showRefillDialog(context, ref, medication),
                      child: const Text('补充'),
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

  void _showEditDialog(BuildContext context, WidgetRef ref, Medication medication) {
    final nameController = TextEditingController(text: medication.name);
    final dosageController = TextEditingController(text: medication.dosage.toString());
    final unitController = TextEditingController(text: medication.unit);
    final frequencyController = TextEditingController(text: medication.frequency);
    final inventoryController = TextEditingController(text: medication.inventory.toString());
    final formKey = GlobalKey<FormState>();

    showDialog<void>(  // Specify the return type as void
      context: context,
      barrierDismissible: false,  // User must tap button to close dialog
      builder: (BuildContext dialogContext) {  // Use a different context variable
        return AlertDialog(
          title: Text('编辑${medication.name}'),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: '药品名称',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.medication),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入药品名称';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: dosageController,
                          decoration: const InputDecoration(
                            labelText: '剂量',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.scale),
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
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: unitController,
                          decoration: const InputDecoration(
                            labelText: '单位',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.straighten),
                          ),
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
                  TextFormField(
                    controller: frequencyController,
                    decoration: const InputDecoration(
                      labelText: '服用频率',
                      border: OutlineInputBorder(),
                      hintText: '例如：每日一次',
                      prefixIcon: Icon(Icons.schedule),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入服用频率';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: inventoryController,
                    decoration: const InputDecoration(
                      labelText: '库存数量',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.inventory),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入库存数量';
                      }
                      if (double.tryParse(value) == null) {
                        return '请输入有效的数字';
                      }
                      if (double.parse(value) < 0) {
                        return '库存数量不能为负数';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Use dialogContext instead of context
                Navigator.of(dialogContext).pop();
              },
              child: const Text('取消'),
            ),
            FilledButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    final success = await ref.read(medicationProvider.notifier)
                        .updateMedication(
                          id: medication.id,
                          name: nameController.text,
                          dosage: double.parse(dosageController.text),
                          unit: unitController.text,
                          frequency: frequencyController.text,
                          inventory: double.parse(inventoryController.text),
                        );

                    if (success && dialogContext.mounted) {
                      Navigator.of(dialogContext).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('药品信息已更新')),
                      );
                      await _fetchMedications();
                    } else if (dialogContext.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('更新失败，请重试'),
                          backgroundColor: Colors.red,
                        ),
                      );
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
              child: const Text('保存'),
            ),
          ],
        );
      },
    ).then((_) {
      // Clean up controllers when dialog is closed
      nameController.dispose();
      dosageController.dispose();
      unitController.dispose();
      frequencyController.dispose();
      inventoryController.dispose();
    });
  }

  void _showRefillDialog(BuildContext context, WidgetRef ref, Medication medication) {
    final controller = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('补充${medication.name}的库存'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: '补充数量',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              final amount = double.tryParse(controller.text);
              if (amount != null) {
                final newInventory = medication.inventory + amount;
                final success = await ref.read(medicationProvider.notifier)
                    .updateMedication(
                      id: medication.id,
                      inventory: newInventory,
                    );
                
                if (success && context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('库存已更新')),
                  );
                  await _fetchMedications();
                }
              }
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
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
  final frequencyController = TextEditingController();
  final inventoryController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    dosageController.dispose();
    unitController.dispose();
    frequencyController.dispose();
    inventoryController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Get the current user's ID from the UserData provider
      // print("Attempting to fetch user data...");
      final userData = await ref.read(userDataProvider.future);
      if (userData == null) {
        throw Exception('User not found');
      }
      else {
        print("User data fetched successfully. User ID: ${userData.id}");
      }

      // final medicationData = {
      //   'userId': userData.id,
      //   'name': nameController.text,
      //   'dosage': dosageController.text,
      //   'unit': unitController.text,
      //   'frequency': frequencyController.text,
      //   'inventory': inventoryController.text,
      // };
      // print("Attempting to add medication with data: $medicationData");

      final success = await ref.read(medicationProvider.notifier).addMedication(
            name: nameController.text,
            dosage: double.parse(dosageController.text),
            unit: unitController.text,
            frequency: frequencyController.text,
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
        frequencyController.clear();
        inventoryController.clear();

        // Switch to inventory tab
        if (mounted) {
          DefaultTabController.of(context)?.animateTo(0);
        }
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('添加失败，请重试'),
            backgroundColor: Colors.red,
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: '药品名称',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.medication),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入药品名称';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: dosageController,
                    decoration: const InputDecoration(
                      labelText: '剂量',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.scale),
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
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: unitController,
                    decoration: const InputDecoration(
                      labelText: '单位',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.straighten),
                    ),
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
            TextFormField(
              controller: frequencyController,
              decoration: const InputDecoration(
                labelText: '服用频率',
                border: OutlineInputBorder(),
                hintText: '例如：每日一次',
                prefixIcon: Icon(Icons.schedule),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入服用频率';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: inventoryController,
              decoration: const InputDecoration(
                labelText: '库存数量',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.inventory),
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
                  return '库存数量必须大于0';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _isLoading ? null : _submitForm,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Text('保存'),
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
  @override
  void initState() {
    super.initState();
    _fetchReminders();
  }

  Future<void> _fetchReminders() async {
    try {
      final userData = await ref.read(userDataProvider.future);
      if (userData != null) {
        await ref.read(medicationReminderProvider.notifier)
            .fetchReminders(userData.id);
      }
    } catch (e) {
      print("Error fetching reminders: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
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
              const Text(
                '服药提醒',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              medicationsState.when(
                loading: () => const SizedBox(),
                error: (_, __) => const SizedBox(),
                data: (medications) {
                  if (medications.isEmpty) {
                    return const SizedBox();
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
              loading: () {
                print("Loading reminders...");
                return const Center(child: CircularProgressIndicator());
              },
              error: (error, stack) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('加载失败: $error'),
                      ElevatedButton(
                        onPressed: _fetchReminders,
                        child: const Text('重试'),
                      ),
                    ],
                  ),
                );
              },
              data: (reminders) {
                if (reminders.isEmpty) {
                  return const Center(
                    child: Text('暂无提醒，请添加'),
                  );
                }

                return ListView.builder(
                  itemCount: reminders.length,
                  itemBuilder: (context, index) {
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
                        return _buildReminderCard(
                          context: context,
                          reminder: reminder,
                          medication: medication,
                        );
                      },
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

  Widget _buildReminderCard({
    required BuildContext context,
    required MedicationReminder reminder,
    required Medication medication,
  }) {
    final timeColor = reminder.isTaken ? Colors.green : Colors.orange;
    
    return Dismissible(
      key: Key(reminder.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
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
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('取消'),
                ),
                FilledButton(
                  onPressed: () => Navigator.of(context).pop(true),
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
          final success = await ref.read(medicationReminderProvider.notifier)
              .deleteReminder(reminder.id);
          
          if (success && mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${medication.name} 的提醒已删除'),
                action: SnackBarAction(
                  label: '撤销',
                  onPressed: () {
                    _fetchReminders();
                  },
                ),
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
        }
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: () => _showEditReminderDialog(context, reminder, medication),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.medication,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 8),
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
                          Text(
                            '${medication.dosage}${medication.unit} - ${medication.frequency}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 16, color: timeColor),
                            const SizedBox(width: 4),
                            Text(
                              _formatTime(reminder.reminderTime),
                              style: TextStyle(
                                color: timeColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Switch(
                          value: reminder.isTaken,
                          onChanged: (bool newValue) async {
                            final success = await ref.read(medicationReminderProvider.notifier)
                                .toggleReminderStatus(reminder.id, newValue);

                            if (success && mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(newValue ? '已标记为已服用' : '已标记为未服用'),
                                  backgroundColor: newValue ? Colors.green : Colors.orange,
                                ),
                              );
                            } else if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('更新失败，请重试'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                if (reminder.isTaken)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          size: 16,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '已服用',
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 12,
                          ),
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
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final reminderDate = DateTime(time.year, time.month, time.day);
    
    String timeStr = '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    
    if (reminderDate == today) {
      return '今天 $timeStr';
    } else if (reminderDate == today.add(const Duration(days: 1))) {
      return '明天 $timeStr';
    } else if (reminderDate == today.subtract(const Duration(days: 1))) {
      return '昨天 $timeStr';
    } else {
      return '${time.month}月${time.day}日 $timeStr';
    }
  }
}
