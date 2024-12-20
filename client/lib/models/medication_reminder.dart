import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part "medication_reminder.freezed.dart";
part "medication_reminder.g.dart";

@freezed
class MedicationReminder extends HiveObject with _$MedicationReminder {
  MedicationReminder._();

  @HiveType(typeId: 5)
  factory MedicationReminder({
    @HiveField(0) required String id,
    @HiveField(1) required String medicationId,
    @HiveField(3) required DateTime reminderTime,
    @HiveField(4) required bool isTaken,
  }) = _MedicationReminder;

  factory MedicationReminder.fromJson(Map<String, dynamic> json) {
    return MedicationReminder(
      id: json['reminderId'] as String,
      medicationId: json['medicationId'] as String,
      reminderTime: DateTime.parse(json['reminderTime']),
      isTaken: json['isTaken'] as bool,
    );
  }
}
