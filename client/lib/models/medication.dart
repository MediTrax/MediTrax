import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part "medication.freezed.dart";
part "medication.g.dart";

@freezed
class Medication extends HiveObject with _$Medication {
  Medication._();

  @HiveType(typeId: 4)
  factory Medication({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required double dosage,
    @HiveField(3) required String unit,
    @HiveField(4) required String frequency,
    @HiveField(5) required double inventory,
    @HiveField(6) required String userId,
    @HiveField(7) required DateTime createdAt,
    @HiveField(8) required DateTime updatedAt,
  }) = _Medication;

}