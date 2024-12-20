import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/health_risk_provider.graphql.dart';
import 'package:meditrax/models/health_risk_assessment.dart';

part 'health_risk_provider.g.dart';

@riverpod
class HealthRisk extends _$HealthRisk {
  HealthRiskAssessment? _selectedAssessment;
  HealthRiskAssessment? get selectedAssessment => _selectedAssessment;

  @override
  Future<List<HealthRiskAssessment>> build() async {
    return _fetchHealthRiskAssessment();
  }

  void setSelectedAssessment(HealthRiskAssessment assessment) {
    _selectedAssessment = assessment;
  }

  Future<List<HealthRiskAssessment>> _fetchHealthRiskAssessment() async {
    final result =
        await ref.read(graphQLServiceProvider).query$GetHealthRiskAssessment(
              Options$Query$GetHealthRiskAssessment(
                fetchPolicy: FetchPolicy.networkOnly,
              ),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    final data = result.data?['getHealthRiskAssessment'] as List?;
    if (data == null) {
      return [];
    }

    final assessments = data.map((item) {
      final responses = (item['questionnaireData'] as List)
          .map((r) => HealthResponse(
                questionId: r['questionId'],
                choice: r['choice'],
                answer: r['answer'],
              ))
          .toList();

      return HealthRiskAssessment(
        assessmentId: item['assessmentId'],
        questionnaireData: responses,
        riskLevel: item['riskLevel'],
        recommendations: item['recommendations'],
        createdAt: DateTime.parse(item['createdAt']),
      );
    }).toList();

    assessments.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return assessments;
  }

  Future<bool> evaluateHealthRiskAssessment({
    required int questionnaireId,
    required List<HealthResponse> responses,
  }) async {
    try {
      final result = await ref.read(graphQLServiceProvider).mutate(
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
                  'responses': responses
                      .map((r) => {
                            'questionId': r.questionId,
                            'choice': r.choice,
                            'answer': r.answer,
                          })
                      .toList(),
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

        await _fetchHealthRiskAssessment();
        return true;
      }
      return false;
    } catch (e, stackTrace) {
      return false;
    }
  }
}

@riverpod
class Questionnaire extends _$Questionnaire {
  @override
  Future<QuestionnaireObject?> build() async {
    return null;
  }

  Future<void> fetchQuestionnaire() async {
    state = const AsyncValue.loading();

    try {
      final result = await ref
          .read(graphQLServiceProvider)
          .query$GetHealthRiskAssessmentQuestion(
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

      final questions = (data['data'] as List)
          .map((q) => Question(
                questionId: q['questionId'],
                question: q['question'],
                questionType: q['questionType'],
                choices: q['choices']?.cast<String>(),
              ))
          .toList();

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
