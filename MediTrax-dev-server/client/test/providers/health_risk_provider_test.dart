import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/models/health_risk_assessment.dart';
import 'package:meditrax/providers/health_risk_provider_test.dart';

void main() {
  group('Health Risk Provider Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    test('QuestionnaireNotifierTest returns correct test data with various question types', () async {
      final notifier = container.read(questionnaireTestProvider.notifier);
      
      // Test initial state
      expect(container.read(questionnaireTestProvider).value, null);
      
      // Test loading state
      notifier.fetchQuestionnaire();
      expect(container.read(questionnaireTestProvider).isLoading, true);
      
      // Test data state
      await Future.delayed(const Duration(milliseconds: 600));
      final state = container.read(questionnaireTestProvider);
      
      expect(state.hasValue, true);
      expect(state.value?.questionnaireId, 1);
      expect(state.value?.data.length, 4); // Now testing 4 different types of questions
      
      // Test single choice question (Type 0)
      expect(state.value?.data[0].questionType, 0);
      expect(state.value?.data[0].question, "Do you smoke?");
      expect(state.value?.data[0].choices, ["Yes", "No"]);
      
      // Test multiple choice question (Type 1)
      expect(state.value?.data[1].questionType, 1);
      expect(state.value?.data[1].question, "How often do you exercise?");
      expect(state.value?.data[1].choices, ["Daily", "Weekly", "Monthly", "Never"]);
      
      // Test fill in the blank question (Type 2)
      expect(state.value?.data[2].questionType, 2);
      expect(state.value?.data[2].question, "What is your current weight in kg?");
      expect(state.value?.data[2].choices, null);
      
      // Test another fill in the blank question
      expect(state.value?.data[3].questionType, 2);
      expect(state.value?.data[3].question, "What is your current height in cm?");
      expect(state.value?.data[3].choices, null);
    });

    test('HealthRiskNotifierTest returns correct assessment data with various responses', () async {
      final notifier = container.read(healthRiskTestProvider.notifier);
      
      // Test initial state
      expect(container.read(healthRiskTestProvider).value, isEmpty);
      
      // Test loading state
      notifier.fetchHealthRiskAssessment();
      expect(container.read(healthRiskTestProvider).isLoading, true);
      
      // Test data state
      await Future.delayed(const Duration(milliseconds: 600));
      final state = container.read(healthRiskTestProvider);
      
      expect(state.hasValue, true);
      expect(state.value?.length, 1);
      
      final assessment = state.value![0];
      expect(assessment.assessmentId, "test_assessment_1");
      expect(assessment.questionnaireData.length, 4);
      
      // Verify responses for different question types
      expect(assessment.questionnaireData[0].questionId, 1);
      expect(assessment.questionnaireData[0].choice, "No"); // Single choice
      
      expect(assessment.questionnaireData[1].questionId, 2);
      expect(assessment.questionnaireData[1].choice, "Weekly"); // Multiple choice
      
      expect(assessment.questionnaireData[2].questionId, 3);
      expect(assessment.questionnaireData[2].answer, "70"); // Fill in the blank
      
      expect(assessment.questionnaireData[3].questionId, 4);
      expect(assessment.questionnaireData[3].answer, "175"); // Fill in the blank
    });

    test('evaluateHealthRiskAssessment creates new assessment', () async {
      final notifier = container.read(healthRiskTestProvider.notifier);
      
      final responses = [
        HealthResponse(
          questionId: 1,
          choice: "Daily",
          answer: null,
        ),
      ];
      
      final result = await notifier.evaluateHealthRiskAssessment(
        questionnaireId: 1,
        responses: responses,
      );
      
      expect(result, true);
      
      final state = container.read(healthRiskTestProvider);
      expect(state.value?.length, 1);
      expect(state.value?[0].assessmentId, "new_test_assessment");
      expect(state.value?[0].riskLevel, "MEDIUM");
      expect(
        state.value?[0].recommendations, 
        "Consider increasing exercise frequency"
      );
    });
  });
} 