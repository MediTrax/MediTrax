import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/diet_plan_provider.graphql.dart';
import 'package:meditrax/models/diet_plan.dart';

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
      state = const AsyncValue.loading();
      
      final result = await _client.query$GetMockFoodSpecs(
        Options$Query$GetMockFoodSpecs(
          variables: Variables$Query$GetMockFoodSpecs(
            food: food,
          ),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );
      
      if (result.hasException) {
        throw result.exception!;
      }

      if (result.data?['getMockFoodSpecs'] == null) {
        state = const AsyncValue.data(null);
        return;
      }

      final specs = (result.data!['getMockFoodSpecs']['specs'] as List)
          .map((spec) {
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

      state = AsyncValue.data(foodSpecs);
    } catch (error, stackTrace) {
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
        state = AsyncValue.data(FoodSpecs(
          specs: [],
          howRecommend: '0',
        ));
        return;
      }

      if (result.data?['getFoodSpecs'] == null) {
        print('No food specs data returned for: $food');
        state = AsyncValue.data(FoodSpecs(
          specs: [],
          howRecommend: '0',
        ));
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
      state = AsyncValue.data(FoodSpecs(
        specs: [],
        howRecommend: '0',
      ));
    }
  }

  void clearFoodSpecs() {
    state = const AsyncValue.data(null);
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
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void clearRecommendation() {
    state = const AsyncValue.data(null);
  }
}
