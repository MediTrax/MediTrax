import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:meditrax/providers/health_risk_provider.dart';
import 'package:meditrax/models/health_risk_assessment.dart';
import 'package:meditrax/screens/health_risk_report_screen.dart';

class HealthRiskAssessmentScreen extends ConsumerStatefulWidget {
  const HealthRiskAssessmentScreen({super.key});

  @override
  ConsumerState<HealthRiskAssessmentScreen> createState() => _HealthRiskAssessmentScreenState();
}

class _HealthRiskAssessmentScreenState extends ConsumerState<HealthRiskAssessmentScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize questionnaire after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(questionnaireProvider.notifier).fetchQuestionnaire();
    });
  }

  @override
  Widget build(BuildContext context) {
    final questionnaireState = ref.watch(questionnaireProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('健康风险评估')),
      body: questionnaireState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (questionnaire) => questionnaire == null
            ? const Center(child: Text('No questions available'))
            : QuestionnaireWidget(questionnaire: questionnaire),
      ),
    );
  }
}

class QuestionnaireWidget extends ConsumerStatefulWidget {
  final QuestionnaireObject questionnaire;

  const QuestionnaireWidget({
    super.key,
    required this.questionnaire,
  });

  @override
  ConsumerState<QuestionnaireWidget> createState() => _QuestionnaireWidgetState();
}

class _QuestionnaireWidgetState extends ConsumerState<QuestionnaireWidget> {
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;
  final Map<int, String> _answers = {};

  List<HealthResponse> _getResponses() {
    return _answers.entries.map((entry) => HealthResponse(
      questionId: entry.key + 1,
      choice: entry.value,
      answer: null,
    )).toList();
  }

  Future<void> _handleAnswerSelection(String? value) async {
    if (value == null) return;
    setState(() {
      _selectedAnswer = value;
      _answers[_currentQuestionIndex] = value;
    });
  }

  Future<void> _handleCompletion() async {
    try {
      final responses = _getResponses();
      final success = await ref.read(healthRiskProvider.notifier)
          .evaluateHealthRiskAssessment(
            questionnaireId: 1,
            responses: responses,
          );

      if (success && mounted) {
        final assessmentData = ref.read(healthRiskProvider).value;
        if (assessmentData != null) {
          if (context.mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HealthRiskReportScreen(),
              ),
            );
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('获取评估结果失败，请重试')),
            );
          }
        }
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
    if (_currentQuestionIndex < widget.questionnaire.data.length - 1) {
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

  List<Widget> _buildOptions(List<String>? choices, int questionType) {
    if (questionType == 2) {
      return [
        TextField(
          decoration: const InputDecoration(
            hintText: '请输入您的答案',
            border: OutlineInputBorder(),
          ),
          onChanged: _handleAnswerSelection,
        ),
      ];
    }

    if (questionType == 1) {
      return choices?.map((choice) => Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: CheckboxListTile(
          title: Text(choice),
          value: _answers[_currentQuestionIndex]?.split(',').contains(choice) ?? false,
          onChanged: (checked) {
            if (checked == true) {
              var currentAnswers = _answers[_currentQuestionIndex]?.split(',').toList() ?? [];
              currentAnswers.add(choice);
              _handleAnswerSelection(currentAnswers.join(','));
            } else {
              var currentAnswers = _answers[_currentQuestionIndex]?.split(',').toList() ?? [];
              currentAnswers.remove(choice);
              _handleAnswerSelection(currentAnswers.join(','));
            }
          },
          activeColor: Colors.black,
          contentPadding: EdgeInsets.zero,
        ),
      )).toList() ?? [];
    }

    return choices?.map((choice) => Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: RadioListTile<String>(
        title: Text(choice),
        value: choice,
        groupValue: _selectedAnswer,
        onChanged: _handleAnswerSelection,
        activeColor: Colors.black,
        contentPadding: EdgeInsets.zero,
      ),
    )).toList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final questions = widget.questionnaire.data;
    final currentQuestion = questions[_currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '问题 ${_currentQuestionIndex + 1} / ${questions.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    currentQuestion.question,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ..._buildOptions(currentQuestion.choices, currentQuestion.questionType),
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
                          _currentQuestionIndex == questions.length - 1
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
        ],
      ),
    );
  }
}
