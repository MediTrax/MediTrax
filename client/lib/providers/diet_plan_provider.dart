import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

class DietPlanProvider with ChangeNotifier {
  final GraphQLClient _client;
  List<DietPlan> _dietPlans = [];
  bool _loading = false;
  String? _error;

  DietPlanProvider(this._client);

  List<DietPlan> get dietPlans => _dietPlans;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> getDietPlans(String userId) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _client.query(
        QueryOptions(
          document: gql(getDietPlansQuery),
          variables: {'userId': userId},
        ),
      );

      if (result.hasException) {
        _error = result.exception?.graphqlErrors.first.message ?? 'An error occurred';
      } else {
        final List<dynamic> plansData = result.data?['getDietPlans'] ?? [];
        _dietPlans = plansData.map((plan) => DietPlan.fromJson(plan)).toList();
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<String?> createDietPlan({
    required String userId,
    required String mealType,
    required String foodItems,
    required double calories,
  }) async {
    try {
      final result = await _client.mutate(
        MutationOptions(
          document: gql(createDietPlanMutation),
          variables: {
            'userId': userId,
            'mealType': mealType,
            'foodItems': foodItems,
            'calories': calories,
          },
        ),
      );

      if (result.hasException) {
        _error = result.exception?.graphqlErrors.first.message ?? 'An error occurred';
        return null;
      }

      await getDietPlans(userId);
      return result.data?['createDietPlan']['planId'];
    } catch (e) {
      _error = e.toString();
      return null;
    }
  }

  Future<bool> updateDietPlan({
    required String planId,
    String? mealType,
    String? foodItems,
    double? calories,
  }) async {
    try {
      final result = await _client.mutate(
        MutationOptions(
          document: gql(updateDietPlanMutation),
          variables: {
            'planId': planId,
            if (mealType != null) 'mealType': mealType,
            if (foodItems != null) 'foodItems': foodItems,
            if (calories != null) 'calories': calories,
          },
        ),
      );

      if (result.hasException) {
        _error = result.exception?.graphqlErrors.first.message ?? 'An error occurred';
        return false;
      }

      // Refresh the diet plans list
      final userId = _dietPlans.firstWhere((plan) => plan.planId == planId).userId;
      await getDietPlans(userId);
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    }
  }

  Future<bool> deleteDietPlan(String planId) async {
    try {
      final result = await _client.mutate(
        MutationOptions(
          document: gql(deleteDietPlanMutation),
          variables: {
            'planId': planId,
          },
        ),
      );

      if (result.hasException) {
        _error = result.exception?.graphqlErrors.first.message ?? 'An error occurred';
        return false;
      }

      _dietPlans.removeWhere((plan) => plan.planId == planId);
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    }
  }
}

class DietPlan {
  final String planId;
  final String userId;
  final String mealType;
  final String foodItems;
  final double calories;
  final DateTime createdAt;

  DietPlan({
    required this.planId,
    required this.userId,
    required this.mealType,
    required this.foodItems,
    required this.calories,
    required this.createdAt,
  });

  factory DietPlan.fromJson(Map<String, dynamic> json) {
    return DietPlan(
      planId: json['planId'],
      userId: json['userId'],
      mealType: json['mealType'],
      foodItems: json['foodItems'],
      calories: json['calories'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}