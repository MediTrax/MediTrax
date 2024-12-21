import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/models/diet_plan.dart';
import 'package:meditrax/providers/diet_plan_provider_test.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('FoodSpecsNotifier Tests', () {
    test('should fetch food specs successfully', () async {
      final notifier = container.read(foodSpecsTestProvider.notifier);
      await notifier.getFoodSpecs('Apple');
      
      final specs = container.read(foodSpecsTestProvider);
      
      // Verify successful response
      expect(specs.hasError, false);
      expect(specs.value?.specs.length, 3);
      
      // Verify data structure
      final firstSpec = specs.value?.specs[0];
      expect(firstSpec?.name, 'Calories');
      expect(firstSpec?.value, '250');
      expect(firstSpec?.unit, 'kcal');
      expect(firstSpec?.howHigh, '0.5');
      
      // Verify recommendation
      expect(specs.value?.howRecommend, 'Recommended for balanced diet');
    });

    test('should handle empty food search', () async {
      final notifier = container.read(foodSpecsTestProvider.notifier);
      await notifier.getFoodSpecs('');
      
      final specs = container.read(foodSpecsTestProvider);
      expect(specs.value, isNull);
    });

    test('should handle error state', () async {
      final notifier = container.read(foodSpecsTestProvider.notifier);
      await notifier.getFoodSpecs('invalid_food_that_causes_error');
      
      final specs = container.read(foodSpecsTestProvider);
      expect(specs.hasError, true);
      expect(specs.error, isA<Exception>());
    });
  });

  group('FoodRecommendationNotifier Tests', () {
    test('should fetch food recommendation successfully', () async {
      final notifier = container.read(foodRecommendationTestProvider.notifier);
      await notifier.getFoodRecommendation();
      
      final recommendation = container.read(foodRecommendationTestProvider);
      
      // Verify successful response
      expect(recommendation.hasError, false);
      expect(recommendation.value?.name, 'Test Recommended Food');
    });

    test('should start with null state', () {
      final recommendation = container.read(foodRecommendationTestProvider);
      expect(recommendation.value, isNull);
    });

    test('should show loading state', () async {
      final notifier = container.read(foodRecommendationTestProvider.notifier);
      
      // Start the async operation but don't await it
      final future = notifier.getFoodRecommendation();
      
      // Check loading state
      final loadingState = container.read(foodRecommendationTestProvider);
      expect(loadingState.isLoading, true);
      
      // Wait for completion
      await future;
    });
  });
}