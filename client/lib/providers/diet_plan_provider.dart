import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/diet_plan.dart';

class DietPlanService {
  final GraphQLClient _client;

  DietPlanService(this._client);

  // Fetch all diet plans for a user
  Future<List<DietPlan>> fetchDietPlans(String userId) async {
    const String query = r'''
      query getDietPlans($userId: String!) {
        getDietPlans(userId: $userId) {
          id: planId
          userId
          mealType
          foodItems
          calories
          createdAt
          updatedAt
        }
      }
    ''';

    final result = await _client.query(
      QueryOptions(
        document: gql(query),
        variables: {'userId': userId},
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final plans = (result.data?['getDietPlans'] as List? ?? [])
        .map((plan) => DietPlan(
              id: plan['id'] ?? '',
              userId: plan['userId'] ?? '',
              mealType: plan['mealType'] ?? '',
              foodItems: (plan['foodItems'] as List<dynamic>? ?? [])
                  .map((item) => item.toString())
                  .toList(),
              calories: plan['calories'] ?? 0,
              createdAt: DateTime.parse(plan['createdAt']),
              updatedAt: DateTime.parse(plan['updatedAt']),
            ))
        .toList();

    return plans;
  }

  // Create a new diet plan
  Future<Map<String, dynamic>> createDietPlan({
    required String userId,
    required String mealType,
    required List<String> foodItems,
    required int calories,
  }) async {
    const String mutation = r'''
      mutation createDietPlan(
        $userId: String!
        $mealType: String!
        $foodItems: [String!]!
        $calories: Int!
      ) {
        createDietPlan(
          userId: $userId
          mealType: $mealType
          foodItems: $foodItems
          calories: $calories
        ) {
          id: planId
          message
        }
      }
    ''';

    final result = await _client.mutate(
      MutationOptions(
        document: gql(mutation),
        variables: {
          'userId': userId,
          'mealType': mealType,
          'foodItems': foodItems,
          'calories': calories,
        },
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return result.data?['createDietPlan'] ?? {};
  }

  // Update an existing diet plan
  Future<Map<String, dynamic>> updateDietPlan({
    required String id,
    String? mealType,
    List<String>? foodItems,
    int? calories,
  }) async {
    const String mutation = r'''
      mutation updateDietPlan(
        $planId: String!
        $mealType: String
        $foodItems: [String!]
        $calories: Int
      ) {
        updateDietPlan(
          planId: $planId
          mealType: $mealType
          foodItems: $foodItems
          calories: $calories
        ) {
          id: planId
          message
        }
      }
    ''';

    final result = await _client.mutate(
      MutationOptions(
        document: gql(mutation),
        variables: {
          'planId': id,
          'mealType': mealType,
          'foodItems': foodItems,
          'calories': calories,
        },
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return result.data?['updateDietPlan'] ?? {};
  }

  // Delete a diet plan
  Future<String> deleteDietPlan(String id) async {
    const String mutation = r'''
      mutation deleteDietPlan($planId: String!) {
        deleteDietPlan(planId: $planId) {
          message
        }
      }
    ''';

    final result = await _client.mutate(
      MutationOptions(
        document: gql(mutation),
        variables: {'planId': id},
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return result.data?['deleteDietPlan']['message'] ?? 'No message';
  }
}