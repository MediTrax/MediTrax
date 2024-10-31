import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part "health_risk_assessment.freezed.dart";
part "health_risk_assessment.g.dart";

@freezed
class HealthRiskAssessment extends HiveObject with _$HealthRiskAssessment {
  HealthRiskAssessment._();

  @HiveType(typeId: 3)
  factory HealthRiskAssessment({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required Object questionnaireData,
    @HiveField(3) required int riskLevel,
    @HiveField(4) required List<String> recommendations,
    @HiveField(5) required DateTime createdAt,
  }) = _HealthRiskAssessment;
}
