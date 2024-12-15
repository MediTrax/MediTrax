import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part "treatment_schedule.freezed.dart";
part "treatment_schedule.g.dart";

@freezed
class TreatmentSchedule extends HiveObject with _$TreatmentSchedule {
  TreatmentSchedule._();

  @HiveType(typeId: 6)
  factory TreatmentSchedule({
    @HiveField(0) required String id,
    @HiveField(1) required String treatmentType,
    @HiveField(2) required DateTime scheduledTime,
    @HiveField(3) required String location,
    @HiveField(4) String? notes,
  }) = _TreatmentSchedule;
}
