// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserImplAdapter extends TypeAdapter<_$UserImpl> {
  @override
  final int typeId = 15;

  @override
  _$UserImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserImpl(
      id: fields[0] as String,
      phoneNumber: fields[1] as String,
      password: fields[2] as String,
      name: fields[3] as String,
      role: fields[4] as String,
      status: fields[5] as int,
<<<<<<< HEAD
      created_at: fields[6] as DateTime,
      updated_at: fields[7] as DateTime,
      last_login: fields[8] as DateTime,
=======
      createdAt: fields[6] as DateTime,
      updatedAt: fields[7] as DateTime,
      lastLogin: fields[8] as DateTime,
>>>>>>> 8d154f5fa93bd51fe88e75cc84b96ee2ef3edb9e
    );
  }

  @override
  void write(BinaryWriter writer, _$UserImpl obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.role)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
<<<<<<< HEAD
      ..write(obj.created_at)
      ..writeByte(7)
      ..write(obj.updated_at)
      ..writeByte(8)
      ..write(obj.last_login);
=======
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt)
      ..writeByte(8)
      ..write(obj.lastLogin);
>>>>>>> 8d154f5fa93bd51fe88e75cc84b96ee2ef3edb9e
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
