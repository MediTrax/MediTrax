// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_reminder.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicationReminderImplAdapter
    extends TypeAdapter<_$MedicationReminderImpl> {
  @override
  final int typeId = 5;

  @override
  _$MedicationReminderImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MedicationReminderImpl(
      id: fields[0] as String,
      medicationId: fields[1] as String,
      reminderTime: fields[3] as DateTime,
      isTaken: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$MedicationReminderImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.medicationId)
      ..writeByte(3)
      ..write(obj.reminderTime)
      ..writeByte(4)
      ..write(obj.isTaken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicationReminderImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
