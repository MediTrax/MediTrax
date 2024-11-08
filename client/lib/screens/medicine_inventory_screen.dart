import 'package:flutter/material.dart';
import 'package:meditrax/models/medication.dart';
import 'package:meditrax/models/medication_reminder.dart';

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

class _InventoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '药品库存',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '查看和管理您的药品库存',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: [
                _buildMedicineCard(
                  name: '阿司匹林',
                  dosage: '100mg - 每天一次',
                  stock: 30,
                ),
                const SizedBox(height: 12),
                _buildMedicineCard(
                  name: '降压药',
                  dosage: '50mg - 每天两次',
                  stock: 60,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicineCard({
    required String name,
    required String dosage,
    required int stock,
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
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dosage,
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
                  '库存: $stock',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('补充'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AddMedicineTab extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final dosageController = TextEditingController();
    final unitController = TextEditingController();
    final frequencyController = TextEditingController();
    final inventoryController = TextEditingController();

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
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入剂量';
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
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入库存数量';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // TODO: Implement actual medication creation
                  Navigator.pop(context);
                }
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReminderTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '服药提醒',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '设置您的服药提醒',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: [
                _buildReminderCard(
                  context: context,
                  name: '阿司匹林',
                  frequency: '每天一次',
                ),
                const SizedBox(height: 12),
                _buildReminderCard(
                  context: context,
                  name: '降压药',
                  frequency: '每天两次',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReminderCard({
    required BuildContext context,
    required String name,
    required String frequency,
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
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    frequency,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            FilledButton(
              onPressed: () => _showSetReminderDialog(context, name),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text('设置提醒'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSetReminderDialog(BuildContext context, String medicationName) {
    final timeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('设置 $medicationName 的提醒'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: timeController,
              decoration: const InputDecoration(
                labelText: '提醒时间',
                hintText: 'HH:MM',
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
            onPressed: () {
              // TODO: Implement reminder setting
              Navigator.pop(context);
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }
}
