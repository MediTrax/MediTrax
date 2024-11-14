
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HealthRiskProvider with ChangeNotifier {
  final GraphQLClient _client;
  
  HealthRiskAssessment? _currentAssessment;
  bool _loading = false;
  String? _error;

  HealthRiskProvider(this._client);

  HealthRiskAssessment? get currentAssessment => _currentAssessment;
  bool get isLoading => _loading;
  String? get error => _error;

  Future<void> createHealthRiskAssessment(String userId, String questionnaireData) async {
    try {
      _loading = true;
      _error = null;
      notifyListeners();

      final options = MutationOptions(
        document: gql(createHealthRiskAssessmentMutation),
        variables: {
          'userId': userId,
          'questionnaireData': questionnaireData,
        },
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw Exception(result.exception?.graphqlErrors.first.message);
      }

      final response = result.data?['createHealthRiskAssessment'];
      _currentAssessment = HealthRiskAssessment(
        assessmentId: response['assessmentId'],
        riskLevel: response['riskLevel'],
        recommendations: response['recommendations'],
      );
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> getHealthRiskAssessment(String userId) async {
    try {
      _loading = true;
      _error = null;
      notifyListeners();

      final options = QueryOptions(
        document: gql(getHealthRiskAssessmentQuery),
        variables: {
          'userId': userId,
        },
      );

      final result = await _client.query(options);

      if (result.hasException) {
        throw Exception(result.exception?.graphqlErrors.first.message);
      }

      final response = result.data?['getHealthRiskAssessment'];
      _currentAssessment = HealthRiskAssessment(
        assessmentId: response['assessmentId'],
        questionnaireData: response['questionnaireData'],
        riskLevel: response['riskLevel'],
        recommendations: response['recommendations'],
        createdAt: DateTime.parse(response['createdAt']),
      );
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> updateHealthRiskAssessment(String assessmentId, String questionnaireData) async {
    try {
      _loading = true;
      _error = null;
      notifyListeners();

      final options = MutationOptions(
        document: gql(updateHealthRiskAssessmentMutation),
        variables: {
          'assessmentId': assessmentId,
          'questionnaireData': questionnaireData,
        },
      );

      final result = await _client.mutate(options);

      if (result.hasException) {
        throw Exception(result.exception?.graphqlErrors.first.message);
      }

      final response = result.data?['updateHealthRiskAssessment'];
      _currentAssessment = HealthRiskAssessment(
        assessmentId: response['assessmentId'],
        riskLevel: response['riskLevel'],
        recommendations: response['recommendations'],
      );
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}

class HealthRiskAssessment {
  final String assessmentId;
  final String? questionnaireData;
  final String riskLevel;
  final String recommendations;
  final DateTime? createdAt;

  HealthRiskAssessment({
    required this.assessmentId,
    this.questionnaireData,
    required this.riskLevel,
    required this.recommendations,
    this.createdAt,
  });
}