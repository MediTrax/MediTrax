import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/health_risk_provider.graphql.dart';

final healthRiskProvider = StateNotifierProvider<HealthRiskNotifier, AsyncValue<HealthRiskAssessment?>>((ref) {
  final client = ref.watch(graphQLServiceProvider);
  return HealthRiskNotifier(client);
});

class HealthRiskNotifier extends StateNotifier<AsyncValue<HealthRiskAssessment?>> {
  final GraphQLClient _client;

  HealthRiskNotifier(this._client) : super(const AsyncValue.data(null));

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

      if (result.data?['getHealthRiskAssessment'] == null) {
        state = const AsyncValue.data(null);
        return;
      }

      final assessment = HealthRiskAssessment(
        assessmentId: result.data!['getHealthRiskAssessment']['assessmentId'],
        questionnaireData: result.data!['getHealthRiskAssessment']['questionnaireData'],
        riskLevel: result.data!['getHealthRiskAssessment']['riskLevel'],
        recommendations: result.data!['getHealthRiskAssessment']['recommendations'],
        createdAt: DateTime.parse(result.data!['getHealthRiskAssessment']['createdAt']),
      );

      state = AsyncValue.data(assessment);
    } catch (error, stackTrace) {
      print('Error in fetchHealthRiskAssessment: $error');
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<bool> createHealthRiskAssessment(String questionnaireData) async {
    try {
      final result = await _client.mutate$CreateHealthRiskAssessment(
        Options$Mutation$CreateHealthRiskAssessment(
          variables: Variables$Mutation$CreateHealthRiskAssessment(
            questionnaireData: questionnaireData,
          ),
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      final newAssessment = HealthRiskAssessment(
        assessmentId: result.data!['createHealthRiskAssessment']['assessmentId'],
        questionnaireData: questionnaireData,
        riskLevel: result.data!['createHealthRiskAssessment']['riskLevel'],
        recommendations: result.data!['createHealthRiskAssessment']['recommendations'],
        createdAt: DateTime.now(),
      );

      state = AsyncValue.data(newAssessment);
      return true;
    } catch (e) {
      print('Error in createHealthRiskAssessment: $e');
      return false;
    }
  }

  Future<bool> updateHealthRiskAssessment({
    required String assessmentId,
    required String questionnaireData,
  }) async {
    try {
      final result = await _client.mutate$UpdateHealthRiskAssessment(
        Options$Mutation$UpdateHealthRiskAssessment(
          variables: Variables$Mutation$UpdateHealthRiskAssessment(
            assessmentId: assessmentId,
            questionnaireData: questionnaireData,
          ),
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      final updatedAssessment = HealthRiskAssessment(
        assessmentId: result.data!['updateHealthRiskAssessment']['assessmentId'],
        questionnaireData: questionnaireData,
        riskLevel: result.data!['updateHealthRiskAssessment']['riskLevel'],
        recommendations: result.data!['updateHealthRiskAssessment']['recommendations'],
        createdAt: DateTime.now(),
      );

      state = AsyncValue.data(updatedAssessment);
      return true;
    } catch (e) {
      print('Error in updateHealthRiskAssessment: $e');
      return false;
    }
  }
}

// Models
class HealthRiskAssessment {
  final String assessmentId;
  final String questionnaireData;
  final String riskLevel;
  final String recommendations;
  final DateTime createdAt;

  HealthRiskAssessment({
    required this.assessmentId,
    required this.questionnaireData,
    required this.riskLevel,
    required this.recommendations,
    required this.createdAt,
  });
}
