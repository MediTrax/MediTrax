import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/models/health_risk_assessment.dart';
import 'package:meditrax/providers/health_risk_provider_test.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('Questionnaire Tests', () {
    test('should fetch questionnaire', () async {
      final notifier = container.read(questionnaireTestProvider.notifier);
      await notifier.fetchQuestionnaire();
      
      final questionnaire = container.read(questionnaireTestProvider);
      expect(questionnaire.value?.data.length, 4);
      expect(questionnaire.value?.data[0].question, "Do you smoke?");
      expect(questionnaire.value?.data[1].choices?.length, 4);
    });
  });

  group('Health Risk Assessment Tests', () {
    test('should fetch health risk assessment', () async {
      final notifier = container.read(healthRiskTestProvider.notifier);
      await notifier.fetchHealthRiskAssessment();
      
      final assessments = container.read(healthRiskTestProvider);
      expect(assessments.value?.length, 1);
      expect(assessments.value?[0].riskLevel, "LOW");
      expect(assessments.value?[0].recommendations, "Keep up the good work!");
    });

    test('should evaluate new health risk assessment', () async {
      final notifier = container.read(healthRiskTestProvider.notifier);
      
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
      ];

      final success = await notifier.evaluateHealthRiskAssessment(
        questionnaireId: 1,
        responses: responses,
      );
      
      expect(success, true);
      
      final assessments = container.read(healthRiskTestProvider);
      expect(assessments.value?.length, 1);
      expect(assessments.value?[0].riskLevel, "MEDIUM");
      expect(assessments.value?[0].recommendations, contains("exercise"));
    });
  });
} 