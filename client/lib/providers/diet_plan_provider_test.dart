import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meditrax/providers/diet_plan_provider.dart';
import 'package:meditrax/models/diet_plan.dart';

final _mockClient = GraphQLClient(
  link: HttpLink(''),
  cache: GraphQLCache(),
);

class FoodSpecsNotifierTest extends FoodSpecsNotifier {
  FoodSpecsNotifierTest() : super(_mockClient);

  @override
  Future<void> getMockFoodSpecs(String food) async {
    state = const AsyncValue.loading();
    
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Return test food specs
    final specs = [
      FoodSpec(
        name: "Calories",
        value: "250",
        unit: "kcal",
        howHigh: "moderate",
      ),
      FoodSpec(
        name: "Protein",
        value: "15",
        unit: "g",
        howHigh: "high",
      ),
      FoodSpec(
        name: "Carbs",
        value: "30",
        unit: "g",
        howHigh: "low",
      ),
    ];

    state = AsyncValue.data(
      FoodSpecs(
        specs: specs,
        howRecommend: "Recommended for balanced diet",
      ),
    );
  }

  @override
  Future<void> getFoodSpecs(String food) async {
    // Reuse mock implementation for testing
    await getMockFoodSpecs(food);
  }
}

class FoodRecommendationNotifierTest extends FoodRecommendationNotifier {
  FoodRecommendationNotifierTest() : super(_mockClient);

  @override
  Future<void> getMockFoodRecommendation() async {
    state = const AsyncValue.loading();
    
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    state = AsyncValue.data(
      FoodRecommendation(
        name: "Test Recommended Food",
      ),
    );
  }

  @override
  Future<void> getFoodRecommendation() async {
    // Reuse mock implementation for testing
    await getMockFoodRecommendation();
  }
}

// Test providers that use the test notifiers
final foodSpecsTestProvider = StateNotifierProvider<FoodSpecsNotifierTest, AsyncValue<FoodSpecs?>>((ref) {
  return FoodSpecsNotifierTest();
});

final foodRecommendationTestProvider = StateNotifierProvider<FoodRecommendationNotifierTest, AsyncValue<FoodRecommendation?>>((ref) {
  return FoodRecommendationNotifierTest();
});
