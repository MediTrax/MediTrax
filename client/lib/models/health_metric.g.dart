// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_metric.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HealthMetricImplAdapter extends TypeAdapter<_$HealthMetricImpl> {
  @override
  final int typeId = 7;

  @override
  _$HealthMetricImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$HealthMetricImpl(
      id: fields[0] as String,
      userId: fields[1] as String,
      metricType: fields[2] as String,
      value: fields[3] as double,
      unit: fields[4] as String,
      recordedAt: fields[5] as DateTime,
      createdAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$HealthMetricImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.metricType)
      ..writeByte(3)
      ..write(obj.value)
      ..writeByte(4)
      ..write(obj.unit)
      ..writeByte(5)
      ..write(obj.recordedAt)
      ..writeByte(6)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HealthMetricImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
