import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part "health_risk_assessment.freezed.dart";
part "health_risk_assessment.g.dart";

class Question {
  final int questionId;
  final String question;
  final int questionType;
  final List<String>? choices;

  Question({
    required this.questionId,
    required this.question,
    required this.questionType,
    this.choices,
  });
}

class QuestionnaireObject {
  final int questionnaireId;
  final List<Question> data;

  QuestionnaireObject({
    required this.questionnaireId,
    required this.data,
  });
}

class HealthResponse {
  final int questionId;
  final String choice;
  final String? answer;

  HealthResponse({
    required this.questionId,
    required this.choice,
    this.answer,
  });
}

@freezed
class HealthRiskAssessment extends HiveObject with _$HealthRiskAssessment {
  HealthRiskAssessment._();

  @HiveType(typeId: 3)
  factory HealthRiskAssessment({
    @HiveField(0) required String assessmentId,
    @HiveField(1) required List<HealthResponse> questionnaireData,
    @HiveField(2) required String riskLevel,
    @HiveField(3) required String recommendations,
    @HiveField(4) required DateTime createdAt,
  }) = _HealthRiskAssessment;
}

