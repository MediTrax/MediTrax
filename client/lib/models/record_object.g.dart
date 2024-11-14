// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecordObjectImplAdapter extends TypeAdapter<_$RecordObjectImpl> {
  @override
  final int typeId = 14;

  @override
  _$RecordObjectImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$RecordObjectImpl(
      data: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$RecordObjectImpl obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordObjectImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
