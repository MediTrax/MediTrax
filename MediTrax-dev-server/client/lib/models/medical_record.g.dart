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
      recordType: fields[1] as String,
      content: fields[2] as String,
      createdAt: fields[3] as DateTime,
      updatedAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$MedicalRecordImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.recordType)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
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
