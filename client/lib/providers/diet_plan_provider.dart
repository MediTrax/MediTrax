import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/diet_plan_provider.graphql.dart';

final foodSpecsProvider = StateNotifierProvider<FoodSpecsNotifier, AsyncValue<FoodSpecs?>>((ref) {
  final client = ref.watch(graphQLServiceProvider);
  return FoodSpecsNotifier(client);
});

final foodRecommendationProvider = StateNotifierProvider<FoodRecommendationNotifier, AsyncValue<FoodRecommendation?>>((ref) {
  final client = ref.watch(graphQLServiceProvider);
  return FoodRecommendationNotifier(client);
});

class FoodSpecsNotifier extends StateNotifier<AsyncValue<FoodSpecs?>> {
  final GraphQLClient _client;

  FoodSpecsNotifier(this._client) : super(const AsyncValue.data(null));

  Future<void> getMockFoodSpecs(String food) async {
    try {
      print('\n=== getMockFoodSpecs Debug Info ===');
      print('Searching for food: $food');
      
      state = const AsyncValue.loading();
      
      final result = await _client.query$GetMockFoodSpecs(
        Options$Query$GetMockFoodSpecs(
          variables: Variables$Query$GetMockFoodSpecs(
            food: food,
          ),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      print('\nGraphQL Response:');
      print('Has Exception: ${result.hasException}');
      
      if (result.hasException) {
        print('Exception: ${result.exception}');
        throw result.exception!;
      }

      print('\nRaw Data:');
      print('getMockFoodSpecs: ${result.data}');

      if (result.data?['getMockFoodSpecs'] == null) {
        print('No data returned from getMockFoodSpecs');
        state = const AsyncValue.data(null);
        return;
      }

      final specs = (result.data!['getMockFoodSpecs']['specs'] as List)
          .map((spec) {
            print('\nProcessing Spec:');
            print('  name: ${spec['name']}');
            print('  value: ${spec['value']}');
            print('  unit: ${spec['unit']}');
            print('  howHigh: ${spec['howHigh']}');
            return FoodSpec(
              name: spec['name'].toString(),
              value: spec['value'].toString(),
              unit: spec['unit']?.toString() ?? '',
              howHigh: spec['howHigh']?.toString() ?? '',
            );
          })
          .toList();

      final foodSpecs = FoodSpecs(
        specs: specs,
        howRecommend: result.data!['getMockFoodSpecs']['howRecommend'].toString(),
      );

      print('\nProcessed FoodSpecs:');
      print('Number of specs: ${foodSpecs.specs.length}');
      print('How Recommend: ${foodSpecs.howRecommend}');
      print('================================\n');

      state = AsyncValue.data(foodSpecs);
    } catch (error, stackTrace) {
      print('\nError in getMockFoodSpecs:');
      print('Error: $error');
      print('Stack Trace: $stackTrace');
      print('================================\n');
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> getFoodSpecs(String food) async {
    try {
      state = const AsyncValue.loading();
      final result = await _client.query$GetFoodSpecs(
        Options$Query$GetFoodSpecs(
          variables: Variables$Query$GetFoodSpecs(
            food: food,
          ),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      if (result.data?['getFoodSpecs'] == null) {
        state = const AsyncValue.data(null);
        return;
      }

      final specs = (result.data!['getFoodSpecs']['specs'] as List)
          .map((spec) => FoodSpec(
                name: spec['name'].toString(),
                value: spec['value'].toString(),
                unit: spec['unit']?.toString() ?? '',
                howHigh: spec['howHigh']?.toString() ?? '',
              ))
          .toList();

      final foodSpecs = FoodSpecs(
        specs: specs,
        howRecommend: result.data!['getFoodSpecs']['howRecommend'].toString(),
      );

      state = AsyncValue.data(foodSpecs);
    } catch (error, stackTrace) {
      print('Error in getFoodSpecs: $error');
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

class FoodRecommendationNotifier extends StateNotifier<AsyncValue<FoodRecommendation?>> {
  final GraphQLClient _client;

  FoodRecommendationNotifier(this._client) : super(const AsyncValue.data(null));

  Future<void> getMockFoodRecommendation() async {
    try {
      state = const AsyncValue.loading();
      
      final result = await _client.query$GetMockFoodRecommendation(
        Options$Query$GetMockFoodRecommendation(
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      if (result.data?['getMockFoodRecommendation'] == null) {
        state = const AsyncValue.data(null);
        return;
      }

      final recommendation = FoodRecommendation(
        name: result.data!['getMockFoodRecommendation']['name'].toString(),
      );

      state = AsyncValue.data(recommendation);
    } catch (error, stackTrace) {
      print('Error in getMockFoodRecommendation: $error');
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> getFoodRecommendation() async {
    try {
      state = const AsyncValue.loading();
      
      final result = await _client.query$GetFoodRecommendation(
        Options$Query$GetFoodRecommendation(
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      if (result.data?['getFoodRecommendation'] == null) {
        state = const AsyncValue.data(null);
        return;
      }

      final recommendation = FoodRecommendation(
        name: result.data!['getFoodRecommendation']['name'].toString(),
      );

      state = AsyncValue.data(recommendation);
    } catch (error, stackTrace) {
      print('Error in getFoodRecommendation: $error');
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// Models
class FoodSpecs {
  final List<FoodSpec> specs;
  final String howRecommend;

  FoodSpecs({
    required this.specs,
    required this.howRecommend,
  });
}

class FoodSpec {
  final String name;
  final String value;
  final String unit;
  final String howHigh;

  FoodSpec({
    required this.name,
    required this.value,
    required this.unit,
    required this.howHigh,
  });
}

class FoodRecommendation {
  final String name;

  FoodRecommendation({
    required this.name,
  });
}
