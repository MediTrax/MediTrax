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
  
  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json['id'] ?? '', 
      name: json['name'] ?? 'Unnamed',  
      dosage: (json['dosage'] ?? 0.0).toDouble(),  
      unit: json['unit'] ?? 'Unknown',  
      frequency: json['frequency'] ?? 'Unknown', 
      inventory: (json['inventory'] ?? 0.0).toDouble(),  
      userId: json['userId'] ?? '',  
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),  
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : DateTime.now(),  
    );
  }

  factory Medication.fromGraphQL(Map<String, dynamic> json) {
    return Medication(
      id: json['medicationId'] ?? '',
      name: json['name'] ?? '',
      dosage: (json['dosage'] as num?)?.toDouble() ?? 0.0,
      unit: json['unit'] ?? '',
      frequency: json['frequency'] ?? '',
      inventory: (json['inventory'] as num?)?.toDouble() ?? 0.0,
      userId: json['userId'] ?? '',
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt']) 
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null 
          ? DateTime.parse(json['updatedAt']) 
          : DateTime.now(),
    );
  }
}
