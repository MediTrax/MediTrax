import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/models/health_risk_assessment.dart';
import 'package:meditrax/providers/health_risk_provider.dart';

class QuestionnaireNotifierTest extends Questionnaire {
  @override
  Future<QuestionnaireObject?> build() async {
    return QuestionnaireObject(
      questionnaireId: 1,
      data: [
        Question(
          questionId: 1,
          question: "Do you smoke?",
          questionType: 0,
          choices: ["Yes", "No"],
        ),
        Question(
          questionId: 2,
          question: "How often do you exercise?",
          questionType: 1,
          choices: ["Daily", "Weekly", "Monthly", "Never"],
        ),
        Question(
          questionId: 3,
          question: "What is your current weight in kg?",
          questionType: 2,
          choices: null,
        ),
        Question(
          questionId: 4,
          question: "What is your current height in cm?",
          questionType: 2,
          choices: null,
        ),
      ],
    );
  }
}

class HealthRiskNotifierTest extends HealthRisk {
  @override
  Future<List<HealthRiskAssessment>> build() async {
    return [
      HealthRiskAssessment(
          riskLevel: "LOW",
          recommendations: "Keep up the good work!",
          createdAt: DateTime.now(),
          assessmentId: "test_assessment_1",
          questionnaireData: [
            HealthResponse(
              questionId: 1,
              choice: "No",
              answer: null,
            ),
            HealthResponse(
              questionId: 2,
              choice: "Weekly",
              answer: null,
            ),
            HealthResponse(
              questionId: 3,
              choice: "",
              answer: "70",
            ),
            HealthResponse(
              questionId: 4,
              choice: "",
              answer: "175",
            ),
          ])
    ];
  }

  @override
  Future<bool> evaluateHealthRiskAssessment({
    required int questionnaireId,
    required List<HealthResponse> responses,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final assessment = HealthRiskAssessment(
      assessmentId: "new_test_assessment",
      questionnaireData: responses,
      riskLevel: "MEDIUM",
      recommendations: "Consider increasing exercise frequency",
      createdAt: DateTime.now(),
    );

    state = AsyncValue.data([assessment]);
    return true;
  }
}