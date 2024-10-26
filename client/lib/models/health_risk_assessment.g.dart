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
      id: fields[0] as String,
      userId: fields[1] as String,
      questionnaireData: fields[2] as Object,
      riskLevel: fields[3] as int,
      recommendations: (fields[4] as List).cast<String>(),
      createdAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$HealthRiskAssessmentImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.questionnaireData)
      ..writeByte(3)
      ..write(obj.riskLevel)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.recommendations);
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
