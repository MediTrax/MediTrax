import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;
import 'dart:convert';
import 'package:meditrax/providers/health_risk_provider.dart';
import 'package:meditrax/models/health_risk_assessment.dart';
import 'package:meditrax/screens/health_risk_report_screen.dart';
import 'package:flutter/services.dart';

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
            ? const Center(child: CircularProgressIndicator())
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

class _QuestionnaireWidgetState extends ConsumerState<QuestionnaireWidget> with SingleTickerProviderStateMixin {
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;
  final Map<int, String> _answers = {};
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _progressAnimation = Tween<double>(
      begin: 0,
      end: 1 / widget.questionnaire.data.length,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
        await ref.refresh(healthRiskProvider.future);

        final assessments = await ref.read(healthRiskProvider.future);
        if (assessments.isNotEmpty && mounted) {
          ref.read(healthRiskProvider.notifier)
              .setSelectedAssessment(assessments.first);
            
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
    // Handle numeric input (type 3)
    if (questionType == 3) {
      return [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: '请输入数字',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(16),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
            ],
            onChanged: (value) {
              if (value.isEmpty || double.tryParse(value) != null) {
                _handleAnswerSelection(value);
              }
            },
          ),
        ),
      ];
    }

    // Handle text input (type 2)
    if (questionType == 2) {
      return [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: '请输入您的答案',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(16),
            ),
            onChanged: _handleAnswerSelection,
            maxLines: 3,
          ),
        ),
      ];
    }

    // Handle multiple choice (type 1)
    if (questionType == 1) {
      return choices?.map((choice) => Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Container(
          decoration: BoxDecoration(
            color: _answers[_currentQuestionIndex]?.split(',').contains(choice) ?? false
                ? Colors.blue.shade50
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _answers[_currentQuestionIndex]?.split(',').contains(choice) ?? false
                  ? Colors.blue.shade400
                  : Colors.grey.shade300,
            ),
          ),
          child: CheckboxListTile(
            title: Text(
              choice,
              style: TextStyle(
                color: _answers[_currentQuestionIndex]?.split(',').contains(choice) ?? false
                    ? Colors.blue.shade700
                    : Colors.black87,
                fontWeight: _answers[_currentQuestionIndex]?.split(',').contains(choice) ?? false
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
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
            activeColor: Colors.blue.shade400,
            checkColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      )).toList() ?? [];
    }

    // Handle single choice (type 0)
    return choices?.map((choice) => Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: _selectedAnswer == choice ? Colors.blue.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _selectedAnswer == choice ? Colors.blue.shade400 : Colors.grey.shade300,
          ),
        ),
        child: RadioListTile<String>(
          title: Text(
            choice,
            style: TextStyle(
              color: _selectedAnswer == choice ? Colors.blue.shade700 : Colors.black87,
              fontWeight: _selectedAnswer == choice ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          value: choice,
          groupValue: _selectedAnswer,
          onChanged: _handleAnswerSelection,
          activeColor: Colors.blue.shade400,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    )).toList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final questions = widget.questionnaire.data;
    final currentQuestion = questions[_currentQuestionIndex];
    final progress = (_currentQuestionIndex + 1) / questions.length;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress Indicator
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '问题 ${_currentQuestionIndex + 1} / ${questions.length}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.blue.shade400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Question Card
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.1, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: Card(
                    key: ValueKey<int>(_currentQuestionIndex),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Question Text
                          Text(
                            currentQuestion.question,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Options
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: _buildOptions(
                                  currentQuestion.choices,
                                  currentQuestion.questionType,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Navigation Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentQuestionIndex > 0)
                    OutlinedButton.icon(
                      onPressed: _handlePrevious,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('上一题'),
                    )
                  else
                    const SizedBox(width: 120),
                  FilledButton.icon(
                    onPressed: _selectedAnswer != null ? _handleNext : null,
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.blue.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: Icon(
                      _currentQuestionIndex == questions.length - 1
                          ? Icons.check_circle
                          : Icons.arrow_forward,
                    ),
                    label: Text(
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
    );
  }
}