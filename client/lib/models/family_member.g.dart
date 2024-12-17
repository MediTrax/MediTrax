// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_member.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FamilyMemberImplAdapter extends TypeAdapter<_$FamilyMemberImpl> {
  @override
  final int typeId = 10;

  @override
  _$FamilyMemberImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$FamilyMemberImpl(
      id: fields[0] as String,
      userId: fields[1] as String,
      relatedUserId: fields[2] as String,
      relationship: fields[3] as String,
      accessLevel: fields[4] as int,
      createdAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$FamilyMemberImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.relatedUserId)
      ..writeByte(3)
      ..write(obj.relationship)
      ..writeByte(4)
      ..write(obj.accessLevel)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FamilyMemberImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
