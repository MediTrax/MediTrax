import 'package:flutter/material.dart';

class HealthRiskReportScreen extends StatelessWidget {
  const HealthRiskReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('健康风险报告'),
      ),
      body: const Center(
        child: Text(
          '功能开发中...',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
