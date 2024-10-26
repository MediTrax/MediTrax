import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:meditrax/models/token.dart';

part "medication_reminder.freezed.dart";
part "medication_reminder.g.dart";

@freezed
class MedicationReminder extends HiveObject with _$MedicationReminder {
  MedicationReminder._();

  @HiveType(typeId: 5)
  factory MedicationReminder({
    @HiveField(0) required String id,
    @HiveField(1) required String medicationId,
    @HiveField(2) required String userId,
    @HiveField(3) required DateTime reminderTime,
    @HiveField(4) required bool isTaken,
    @HiveField(5) required DateTime createdAt,
  }) = _MedicationReminder;

}