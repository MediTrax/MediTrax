// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicalRecordImplAdapter extends TypeAdapter<_$MedicalRecordImpl> {
  @override
  final int typeId = 9;

  @override
  _$MedicalRecordImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MedicalRecordImpl(
      id: fields[0] as String,
      userId: fields[1] as String,
      recordType: fields[2] as String,
      content: fields[3] as Object,
      createdAt: fields[4] as DateTime,
      updatedAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$MedicalRecordImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.recordType)
      ..writeByte(3)
      ..write(obj.content)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicalRecordImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
