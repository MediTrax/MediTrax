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

  test('should fetch food specs', () async {
    final notifier = container.read(foodSpecsTestProvider.notifier);
    await notifier.getFoodSpecs('Apple');
    
    final specs = container.read(foodSpecsTestProvider);
    expect(specs.value?.specs.length, 3);
    expect(specs.value?.specs[0].name, 'Calories');
    expect(specs.value?.specs[0].value, '250');
  });

  test('should fetch food recommendation', () async {
    final notifier = container.read(foodRecommendationTestProvider.notifier);
    await notifier.getFoodRecommendation();
    
    final recommendation = container.read(foodRecommendationTestProvider);
    expect(recommendation.value?.name, 'Test Recommended Food');
  });

  test('should handle mock food specs', () async {
    final notifier = container.read(foodSpecsTestProvider.notifier);
    await notifier.getMockFoodSpecs('Apple');
    
    final specs = container.read(foodSpecsTestProvider);
    expect(specs.value?.howRecommend, 'Recommended for balanced diet');
    expect(specs.value?.specs.any((spec) => spec.name == 'Protein'), true);
  });
}