// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_schedule.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TreatmentScheduleImplAdapter
    extends TypeAdapter<_$TreatmentScheduleImpl> {
  @override
  final int typeId = 6;

  @override
  _$TreatmentScheduleImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$TreatmentScheduleImpl(
      id: fields[0] as String,
      userId: fields[1] as String,
      treatmentType: fields[2] as String,
      scheduledTime: fields[3] as DateTime,
      location: fields[4] as String,
      notes: fields[5] as String,
      createdAt: fields[6] as DateTime,
      updatedAt: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$TreatmentScheduleImpl obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.treatmentType)
      ..writeByte(3)
      ..write(obj.scheduledTime)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.notes)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TreatmentScheduleImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
