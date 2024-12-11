import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/diet_plan_provider_test.dart';

void main() {
  group('Diet Plan Provider Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    test('FoodSpecsNotifierTest returns correct test data', () async {
      final notifier = container.read(foodSpecsTestProvider.notifier);
      
      // Test initial state
      expect(container.read(foodSpecsTestProvider).value, null);
      
      // Test loading state
      notifier.getMockFoodSpecs("apple");
      expect(container.read(foodSpecsTestProvider).isLoading, true);
      
      // Test data state
      await Future.delayed(const Duration(milliseconds: 600));
      final state = container.read(foodSpecsTestProvider);
      
      expect(state.hasValue, true);
      expect(state.value?.specs.length, 3);
      expect(state.value?.specs[0].name, "Calories");
      expect(state.value?.specs[0].value, "250");
      expect(state.value?.howRecommend, "Recommended for balanced diet");
    });

    test('getFoodSpecs calls getMockFoodSpecs', () async {
      final notifier = container.read(foodSpecsTestProvider.notifier);
      await notifier.getFoodSpecs("apple");
      
      final state = container.read(foodSpecsTestProvider);
      expect(state.hasValue, true);
      expect(state.value?.specs.length, 3);
    });

    test('FoodRecommendationNotifierTest returns correct test data', () async {
      final notifier = container.read(foodRecommendationTestProvider.notifier);
      
      await notifier.getMockFoodRecommendation();
      
      final state = container.read(foodRecommendationTestProvider);
      
      expect(state.hasValue, true);
      expect(state.value?.name, "Test Recommended Food");
    });
  });
} 