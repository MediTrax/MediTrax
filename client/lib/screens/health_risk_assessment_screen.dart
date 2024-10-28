import 'package:flutter/material.dart';

class HealthRiskAssessmentScreen extends StatelessWidget {
  const HealthRiskAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('健康风险评估'),
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
