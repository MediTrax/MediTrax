import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/models/health_risk_assessment.dart';
import 'package:meditrax/widgets/risk_level_indicator.dart';

class HealthRiskReportScreen extends ConsumerWidget {
  const HealthRiskReportScreen({super.key, required this.latestAssessment});
  final HealthRiskAssessment? latestAssessment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('健康风险评估报告'),
      ),
      body: latestAssessment != null
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RiskLevelIndicator(riskLevel: latestAssessment!.riskLevel),
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
                          ...latestAssessment!.recommendations
                              .split('。')
                              .where(
                                  (recommendation) => recommendation.isNotEmpty)
                              .map((recommendation) => Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                    '评估时间: ${_formatDateTime(latestAssessment!.createdAt)}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          : const Center(child: Text('暂无评估数据')),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}年${dateTime.month}月${dateTime.day}日 '
        '${dateTime.hour.toString().padLeft(2, '0')}:'
        '${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
