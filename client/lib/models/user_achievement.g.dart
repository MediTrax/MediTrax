// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_achievement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAchievementImplAdapter extends TypeAdapter<_$UserAchievementImpl> {
  @override
  final int typeId = 12;

  @override
  _$UserAchievementImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserAchievementImpl(
      id: fields[0] as String,
      userId: fields[1] as String,
      badgeId: fields[2] as String,
      earnedAt: fields[3] as DateTime,
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$UserAchievementImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.badgeId)
      ..writeByte(3)
      ..write(obj.earnedAt)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAchievementImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
