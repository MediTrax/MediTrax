import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meditrax/models/health_risk_assessment.dart';
import 'package:meditrax/providers/health_risk_provider.dart';

final _mockClient = GraphQLClient(
  link: HttpLink(''),
  cache: GraphQLCache(),
);

class QuestionnaireNotifierTest extends QuestionnaireNotifier {
  QuestionnaireNotifierTest() : super(_mockClient);

  @override
  Future<void> fetchQuestionnaire() async {
    state = const AsyncValue.loading();
    
    await Future.delayed(const Duration(milliseconds: 500));
    
    final questions = [
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
    ];

    final questionnaire = QuestionnaireObject(
      questionnaireId: 1,
      data: questions,
    );

    state = AsyncValue.data(questionnaire);
  }
}

class HealthRiskNotifierTest extends HealthRiskNotifier {
  HealthRiskNotifierTest() : super(_mockClient);

  @override
  Future<void> fetchHealthRiskAssessment() async {
    state = const AsyncValue.loading();
    
    await Future.delayed(const Duration(milliseconds: 500));

    final responses = [
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
    ];

    final assessment = HealthRiskAssessment(
      assessmentId: "test_assessment_1",
      questionnaireData: responses,
      riskLevel: "LOW",
      recommendations: "Keep up the good work!",
      createdAt: DateTime.now(),
    );

    state = AsyncValue.data([assessment]);
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

// Test providers
final questionnaireTestProvider = StateNotifierProvider<QuestionnaireNotifierTest, AsyncValue<QuestionnaireObject?>>((ref) {
  return QuestionnaireNotifierTest();
});

final healthRiskTestProvider = StateNotifierProvider<HealthRiskNotifierTest, AsyncValue<List<HealthRiskAssessment>>>((ref) {
  return HealthRiskNotifierTest();
});
