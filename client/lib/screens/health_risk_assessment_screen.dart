import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:meditrax/providers/health_risk_provider.dart';
import 'package:meditrax/screens/health_risk_report_screen.dart';

class HealthRiskAssessmentScreen extends ConsumerStatefulWidget {
  const HealthRiskAssessmentScreen({super.key});

  @override
  ConsumerState<HealthRiskAssessmentScreen> createState() => _HealthRiskAssessmentScreenState();
}

class _HealthRiskAssessmentScreenState extends ConsumerState<HealthRiskAssessmentScreen> {
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;
  final Map<int, String> _answers = {};  // Store answers for each question

  // Update the questions structure to include IDs
  final List<Map<String, dynamic>> _questions = [
    {
      'id': 'q1',
      'question': '您最近是否经常感到疲劳？',
      'options': ['从不', '偶尔', '经常', '总是'],
    },
    {
      'id': 'q2',
      'question': '您的睡眠质量如何？',
      'options': ['很好', '一般', '较差', '很差'],
    },
    {
      'id': 'q3',
      'question': '您是否有规律运动的习惯？',
      'options': ['每天', '每周3-4次', '偶尔', '从不'],
    },
  ];

  String _getQuestionnaireData() {
    final List<Map<String, dynamic>> questionnaireData = _questions.map((q) {
      return {
        'questionId': q['id'],
        'question': q['question'],
        'answer': _answers[_questions.indexOf(q)] ?? '',
      };
    }).toList();
    return jsonEncode(questionnaireData);
  }

  Future<void> _handleAnswerSelection(String? value) async {
    if (value == null) return;

    setState(() {
      _selectedAnswer = value;
      _answers[_currentQuestionIndex] = value;
    });

    // If we have an existing assessment, update it
    final currentAssessment = ref.read(healthRiskProvider).value;
    if (currentAssessment != null) {
      try {
        await ref.read(healthRiskProvider.notifier).updateHealthRiskAssessment(
          assessmentId: currentAssessment.assessmentId,
          questionnaireData: _getQuestionnaireData(),
        );
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('更新失败: $e')),
          );
        }
      }
    }
  }

  Future<void> _handleCompletion() async {
    try {
      final success = await ref.read(healthRiskProvider.notifier)
          .createHealthRiskAssessment(_getQuestionnaireData());

      if (success && mounted) {
        // Use push instead of pushReplacement
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HealthRiskReportScreen(),
          ),
        );
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('提交失败，请重试')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('错误: $e')),
        );
      }
    }
  }

  void _handleNext() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = _answers[_currentQuestionIndex];
      });
    } else {
      _handleCompletion();
    }
  }

  void _handlePrevious() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
        _selectedAnswer = _answers[_currentQuestionIndex];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final assessmentState = ref.watch(healthRiskProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('健康风险评估'),
      ),
      body: assessmentState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('加载失败: $error'),
              ElevatedButton(
                onPressed: () {
                  ref.read(healthRiskProvider.notifier).fetchHealthRiskAssessment();
                },
                child: const Text('重试'),
              ),
            ],
          ),
        ),
        data: (_) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '健康风险评估',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '请回答以下问题，以帮助我们评估您的健康风险。',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          '问题 ${_currentQuestionIndex + 1} / ${_questions.length}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _questions[_currentQuestionIndex]['question'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ..._buildOptions(),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (_currentQuestionIndex > 0)
                              OutlinedButton(
                                onPressed: _handlePrevious,
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(120, 48),
                                ),
                                child: const Text('上一题'),
                              )
                            else
                              const SizedBox(width: 120),
                            ElevatedButton(
                              onPressed: _selectedAnswer != null ? _handleNext : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(120, 48),
                                disabledBackgroundColor: Colors.grey[300],
                              ),
                              child: Text(
                                _currentQuestionIndex == _questions.length - 1
                                    ? '完成'
                                    : '下一题',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (_currentQuestionIndex == _questions.length - 1)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      '注意：完成所有问题后，系统将生成您的健康风险评估报告。',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOptions() {
    return (_questions[_currentQuestionIndex]['options'] as List<String>)
        .map((option) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: _selectedAnswer,
                onChanged: _handleAnswerSelection,
                activeColor: Colors.black,
                contentPadding: EdgeInsets.zero,
              ),
            ))
        .toList();
  }
}
