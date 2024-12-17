import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part "diet_plan.freezed.dart";
part "diet_plan.g.dart";

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

class FoodSpecs {
  final List<FoodSpec> specs;
  final String howRecommend;

  FoodSpecs({
    required this.specs,
    required this.howRecommend,
  });
}

class FoodRecommendation {
  final String name;

  FoodRecommendation({
    required this.name,
  });
}

@freezed
class DietPlan extends HiveObject with _$DietPlan {
  DietPlan._();

  @HiveType(typeId: 8)
  factory DietPlan({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required String mealType,
    @HiveField(3) required List<String> foodItems,
    @HiveField(4) required int calories,
    @HiveField(5) required DateTime createdAt,
    @HiveField(6) required DateTime updatedAt,
  }) = _DietPlan;

  factory DietPlan.fromJson(Map<String, dynamic> json) {
    return DietPlan(
      id: json['id'] ?? '', 
      userId: json['userId'] ?? '',
      mealType: json['mealType'] ?? '', 
      foodItems: (json['foodItems'] as List<dynamic>? ?? [])
          .map((item) => item.toString()) 
          .toList(),
      calories: (json['calories'] as num?)?.toInt() ?? 0, 
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt']) 
          : DateTime.now(), 
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt']) 
          : DateTime.now(), 
    );
  }
}
