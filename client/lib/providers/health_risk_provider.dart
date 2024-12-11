import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/health_risk_provider.graphql.dart';
import 'package:meditrax/models/health_risk_assessment.dart';

final healthRiskProvider = StateNotifierProvider<HealthRiskNotifier, AsyncValue<List<HealthRiskAssessment>>>((ref) {
  final client = ref.watch(graphQLServiceProvider);
  return HealthRiskNotifier(client);
});

final questionnaireProvider = StateNotifierProvider<QuestionnaireNotifier, AsyncValue<QuestionnaireObject?>>((ref) {
  final client = ref.watch(graphQLServiceProvider);
  return QuestionnaireNotifier(client);
});

class QuestionnaireNotifier extends StateNotifier<AsyncValue<QuestionnaireObject?>> {
  final GraphQLClient _client;

  QuestionnaireNotifier(this._client) : super(const AsyncValue.data(null));

  Future<void> fetchQuestionnaire() async {
    try {
      state = const AsyncValue.loading();
      final result = await _client.query$GetHealthRiskAssessmentQuestion(
        Options$Query$GetHealthRiskAssessmentQuestion(
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      final data = result.data?['getHealthRiskAssessmentQuestion'];
      if (data == null) {
        state = const AsyncValue.data(null);
        return;
      }

      final questions = (data['data'] as List).map((q) => Question(
        questionId: q['questionId'],
        question: q['question'],
        questionType: q['questionType'],
        choices: q['choices']?.cast<String>(),
      )).toList();

      final questionnaire = QuestionnaireObject(
        questionnaireId: data['questionnaireId'],
        data: questions,
      );

      state = AsyncValue.data(questionnaire);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

class HealthRiskNotifier extends StateNotifier<AsyncValue<List<HealthRiskAssessment>>> {
  final GraphQLClient _client;
  HealthRiskAssessment? _selectedAssessment;

  HealthRiskAssessment? get selectedAssessment => _selectedAssessment;

  void setSelectedAssessment(HealthRiskAssessment assessment) {
    _selectedAssessment = assessment;
  }

  HealthRiskNotifier(this._client) : super(const AsyncValue.data([]));

  Future<void> fetchHealthRiskAssessment() async {
    try {
      state = const AsyncValue.loading();
      final result = await _client.query$GetHealthRiskAssessment(
        Options$Query$GetHealthRiskAssessment(
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      final data = result.data?['getHealthRiskAssessment'] as List?;
      if (data == null) {
        state = const AsyncValue.data([]);
        return;
      }

      final assessments = data.map((item) {
        final responses = (item['questionnaireData'] as List).map((r) => HealthResponse(
          questionId: r['questionId'],
          choice: r['choice'],
          answer: r['answer'],
        )).toList();

        return HealthRiskAssessment(
          assessmentId: item['assessmentId'],
          questionnaireData: responses,
          riskLevel: item['riskLevel'],
          recommendations: item['recommendations'],
          createdAt: DateTime.parse(item['createdAt']),
        );
      }).toList();

      assessments.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      
      state = AsyncValue.data(assessments);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<bool> evaluateHealthRiskAssessment({
    required int questionnaireId,
    required List<HealthResponse> responses,
  }) async {
    try {
      final result = await _client.mutate(
        MutationOptions(
          document: gql('''
            mutation EvaluateHealthRiskAssessment(\$filledQuestionnaire: FilledQuestionnaire!) {
              evaluateHealthRiskAssessment(filledQuestionnaire: \$filledQuestionnaire) {
                assessmentId
                riskLevel
                recommendations
              }
            }
          '''),
          variables: {
            'filledQuestionnaire': {
              'questionnaireId': questionnaireId,
              'responses': responses.map((r) => {
                'questionId': r.questionId,
                'choice': r.choice,
                'answer': r.answer,
              }).toList(),
            },
          },
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      final evaluationData = result.data?['evaluateHealthRiskAssessment'];
      if (evaluationData != null) {
        final newAssessment = HealthRiskAssessment(
          assessmentId: evaluationData['assessmentId'],
          questionnaireData: responses,
          riskLevel: evaluationData['riskLevel'],
          recommendations: evaluationData['recommendations'],
          createdAt: DateTime.now(),
        );

        await fetchHealthRiskAssessment();
        return true;
      }
      return false;
    } catch (e, stackTrace) {
      return false;
    }
  }
}
