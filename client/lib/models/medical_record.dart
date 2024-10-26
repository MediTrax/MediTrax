import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:meditrax/models/token.dart';

part "medical_record.freezed.dart";
part "medical_record.g.dart";

@freezed
class MedicalRecord extends HiveObject with _$MedicalRecord {
  MedicalRecord._();

  @HiveType(typeId: 9)
  factory MedicalRecord({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required String recordType,
    @HiveField(3) required Object content,
    @HiveField(4) required DateTime createdAt,
    @HiveField(5) required DateTime updatedAt,
  }) = _MedicalRecord;

}