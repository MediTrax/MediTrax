import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:meditrax/models/token.dart';

part "treatment_schedule.freezed.dart";
part "treatment_schedule.g.dart";

@freezed
class TreatmentSchedule extends HiveObject with _$TreatmentSchedule {
  TreatmentSchedule._();

  @HiveType(typeId: 6)
  factory TreatmentSchedule({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required String treatmentType,
    @HiveField(3) required DateTime scheduledTime,
    @HiveField(4) required String location,
    @HiveField(5) required String notes,
    @HiveField(6) required DateTime createdAt,
    @HiveField(7) required DateTime updatedAt,
  }) = _TreatmentSchedule;

}