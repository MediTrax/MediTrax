import 'package:flutter/material.dart';
import 'package:meditrax/models/medical_record.dart';

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

class _VisitHistoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '就诊历史',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '查看您的就诊记录和诊断结果',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: [
                _buildVisitCard(
                  date: '2023-09-15',
                  type: '门诊',
                  diagnosis: '高血压',
                  prescription: '降压药 10mg 每日一次',
                ),
                const SizedBox(height: 12),
                _buildVisitCard(
                  date: '2023-08-20',
                  type: '住院',
                  diagnosis: '肾功能检查',
                  prescription: '无',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => _showAddVisitDialog(context),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('添加新记录'),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddVisitDialog(BuildContext context) {
    final dateController = TextEditingController();
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
              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: '就诊日期',
                  hintText: 'YYYY-MM-DD',
                ),
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
            onPressed: () {
              // TODO: Implement actual record creation
              Navigator.pop(context);
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

class _MedicationHistoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '用药历史',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '查看您的用药记录和当前用药情况',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: [
                _buildMedicationCard(
                  name: '降压药',
                  dosage: '10mg',
                  frequency: '每日一次',
                  startDate: '2023-09-15',
                ),
                const SizedBox(height: 12),
                _buildMedicationCard(
                  name: '钙片',
                  dosage: '500mg',
                  frequency: '每日两次',
                  startDate: '2023-07-01',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => _showAddMedicationDialog(context),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('添加新用药'),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddMedicationDialog(BuildContext context) {
    final nameController = TextEditingController();
    final dosageController = TextEditingController();
    final frequencyController = TextEditingController();
    final startDateController = TextEditingController();

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
              TextField(
                controller: startDateController,
                decoration: const InputDecoration(
                  labelText: '开始日期',
                  hintText: 'YYYY-MM-DD',
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
            onPressed: () {
              // TODO: Implement actual medication record creation
              Navigator.pop(context);
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
