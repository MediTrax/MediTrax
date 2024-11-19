import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/health_risk_assessment.dart';
import 'health_risk_provider.graphql.dart';
import 'package:meditrax/providers/graphql.dart';

final healthRiskProvider = StateNotifierProvider<HealthRiskNotifier, AsyncValue<Query$GetHealthRiskAssessment$getHealthRiskAssessment?>>((ref) {
  final client = ref.read(graphQLServiceProvider);
  return HealthRiskNotifier(client);
});

class HealthRiskNotifier extends StateNotifier<AsyncValue<Query$GetHealthRiskAssessment$getHealthRiskAssessment?>> { /// Updated type
  HealthRiskNotifier(this.client) : super(const AsyncValue.loading());

  final GraphQLClient client;

  Future<void> fetchHealthRiskAssessment(String userId) async {
    try {
      state = const AsyncValue.loading();
      final result = await client.query$GetHealthRiskAssessment(
        Options$Query$GetHealthRiskAssessment(
          variables: Variables$Query$GetHealthRiskAssessment(userId: userId),
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      state = AsyncValue.data(result.parsedData?.getHealthRiskAssessment);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> createHealthRiskAssessment(String userId, String questionnaireData) async {
    try {
      final result = await client.mutate$CreateHealthRiskAssessment(
        Options$Mutation$CreateHealthRiskAssessment(
          variables: Variables$Mutation$CreateHealthRiskAssessment(
            userId: userId,
            questionnaireData: questionnaireData,
          ),
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      // Update the state with the new assessment
       state = AsyncValue.data(result.parsedData?.createHealthRiskAssessment as Query$GetHealthRiskAssessment$getHealthRiskAssessment?);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateHealthRiskAssessment(String assessmentId, String questionnaireData) async {
    try {
      final result = await client.mutate$UpdateHealthRiskAssessment(
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

      // Update the state with the updated assessment
      state = AsyncValue.data(result.parsedData?.updateHealthRiskAssessment as Query$GetHealthRiskAssessment$getHealthRiskAssessment?);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
