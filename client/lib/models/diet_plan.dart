import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:meditrax/models/token.dart';

part "diet_plan.freezed.dart";
part "diet_plan.g.dart";

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

}