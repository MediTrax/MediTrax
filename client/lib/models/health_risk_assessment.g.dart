// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_risk_assessment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HealthRiskAssessmentImplAdapter
    extends TypeAdapter<_$HealthRiskAssessmentImpl> {
  @override
  final int typeId = 3;

  @override
  _$HealthRiskAssessmentImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$HealthRiskAssessmentImpl(
      assessmentId: fields[0] as String,
      questionnaireData: (fields[1] as List).cast<HealthResponse>(),
      riskLevel: fields[2] as String,
      recommendations: fields[3] as String,
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$HealthRiskAssessmentImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.assessmentId)
      ..writeByte(2)
      ..write(obj.riskLevel)
      ..writeByte(3)
      ..write(obj.recommendations)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(1)
      ..write(obj.questionnaireData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HealthRiskAssessmentImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
