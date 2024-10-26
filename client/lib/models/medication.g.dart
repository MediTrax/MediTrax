// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicationImplAdapter extends TypeAdapter<_$MedicationImpl> {
  @override
  final int typeId = 4;

  @override
  _$MedicationImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MedicationImpl(
      id: fields[0] as String,
      name: fields[1] as String,
      dosage: fields[2] as double,
      unit: fields[3] as String,
      frequency: fields[4] as String,
      inventory: fields[5] as int,
      userId: fields[6] as String,
      createdAt: fields[7] as DateTime,
      updatedAt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$MedicationImpl obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.dosage)
      ..writeByte(3)
      ..write(obj.unit)
      ..writeByte(4)
      ..write(obj.frequency)
      ..writeByte(5)
      ..write(obj.inventory)
      ..writeByte(6)
      ..write(obj.userId)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicationImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
