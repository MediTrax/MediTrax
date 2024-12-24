import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/health_risk_provider.dart';
import 'package:meditrax/widgets/risk_level_indicator.dart';
import 'package:meditrax/screens/health_risk_entry_screen.dart';

class HealthRiskReportScreen extends ConsumerWidget {
  const HealthRiskReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assessmentState = ref.watch(healthRiskProvider);

    return WillPopScope(
      onWillPop: () async {
        // Navigate to HealthRiskEntryScreen when back button is pressed
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HealthRiskEntryScreen(),
          ),
        );
        return false; // Prevent default back behavior
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('健康风险评估报告'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Use the same navigation logic for the back button
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HealthRiskEntryScreen(),
                ),
              );
            },
          ),
        ),
        body: assessmentState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
          data: (assessments) {
            if (assessments.isEmpty) {
              return const Center(child: Text('暂无评估数据'));
            }

            // Get the latest assessment
            final latestAssessment = assessments.first;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RiskLevelIndicator(riskLevel: latestAssessment.riskLevel),
                  const SizedBox(height: 24),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.lightbulb_outline_rounded,
                                color: Colors.amber.shade600,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                '建议',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ...latestAssessment.recommendations
                              .split('。')
                              .where((recommendation) => recommendation.isNotEmpty)
                              .map((recommendation) => Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline_rounded,
                                          color: Colors.green.shade600,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            '$recommendation。',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              height: 1.5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '评估时间: ${_formatDateTime(latestAssessment.createdAt)}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}年${dateTime.month}月${dateTime.day}日 '
           '${dateTime.hour.toString().padLeft(2, '0')}:'
           '${dateTime.minute.toString().padLeft(2, '0')}';
  }
}