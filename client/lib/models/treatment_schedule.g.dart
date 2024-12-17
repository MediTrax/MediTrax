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
      treatmentType: fields[1] as String,
      scheduledTime: fields[2] as DateTime,
      location: fields[3] as String,
      notes: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$TreatmentScheduleImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.treatmentType)
      ..writeByte(2)
      ..write(obj.scheduledTime)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.notes);
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
