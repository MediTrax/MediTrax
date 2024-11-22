import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part "medical_record.freezed.dart";
part "medical_record.g.dart";

@freezed
class MedicalRecord extends HiveObject with _$MedicalRecord {
  MedicalRecord._();

  @HiveType(typeId: 9)
  factory MedicalRecord({
    @HiveField(0) required String id,
    @HiveField(1) required String recordType,
    @HiveField(2) required String content,
    @HiveField(3) required DateTime createdAt,
    @HiveField(4) required DateTime updatedAt,
  }) = _MedicalRecord;
}
