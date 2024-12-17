import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/health_risk_provider.dart';
import 'package:meditrax/screens/health_risk_report_screen.dart';
import 'package:intl/intl.dart';
import 'package:meditrax/models/health_risk_assessment.dart';

class HealthRiskHistoryScreen extends ConsumerStatefulWidget {
  const HealthRiskHistoryScreen({super.key});

  @override
  ConsumerState<HealthRiskHistoryScreen> createState() => _HealthRiskHistoryScreenState();
}

class _HealthRiskHistoryScreenState extends ConsumerState<HealthRiskHistoryScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(healthRiskProvider.notifier).fetchHealthRiskAssessment();
    });
  }

  Widget _buildAssessmentCard(HealthRiskAssessment assessment) {
    Color riskColor;
    IconData riskIcon;
    
    switch (assessment.riskLevel) {
      case '低风险':
        riskColor = Colors.green;
        riskIcon = Icons.check_circle;
        break;
      case '中风险':
        riskColor = Colors.orange;
        riskIcon = Icons.warning;
        break;
      case '高风险':
        riskColor = Colors.red;
        riskIcon = Icons.error;
        break;
      default:
        riskColor = Colors.grey;
        riskIcon = Icons.help;
    }

    String formattedDate;
    try {
      print('\n=== Date Formatting Debug Info ===');
      print('Raw createdAt: ${assessment.createdAt}');
      print('createdAt type: ${assessment.createdAt.runtimeType}');
      print('createdAt timestamp: ${assessment.createdAt.millisecondsSinceEpoch}');
      
      formattedDate = DateFormat('yyyy年MM月dd日 HH:mm').format(assessment.createdAt);
      print('Formatted date: $formattedDate');
      print('===============================\n');
    } catch (e, stackTrace) {
      print('\n=== Date Formatting Error ===');
      print('Error: $e');
      print('Stack trace: $stackTrace');
      print('Assessment ID: ${assessment.assessmentId}');
      print('CreatedAt raw value: ${assessment.createdAt}');
      print('==========================\n');
      
      formattedDate = DateFormat('yyyy年MM月dd日 HH:mm').format(DateTime.now());
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () {
          ref.read(healthRiskProvider.notifier).setSelectedAssessment(assessment);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HealthRiskReportScreen(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    riskIcon,
                    color: riskColor,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    assessment.riskLevel,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: riskColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                assessment.recommendations,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final assessmentState = ref.watch(healthRiskProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('健康风险评估记录'),
      ),
      body: assessmentState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('加载失败: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(healthRiskProvider.notifier).fetchHealthRiskAssessment();
                },
                child: const Text('重试'),
              ),
            ],
          ),
        ),
        data: (assessments) {
          if (assessments.isEmpty) {
            return const Center(
              child: Text('暂无评估记录'),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(healthRiskProvider.notifier).fetchHealthRiskAssessment();
            },
            child: ListView.builder(
              itemCount: assessments.length,
              itemBuilder: (context, index) => _buildAssessmentCard(assessments[index]),
            ),
          );
        },
      ),
    );
  }
} 