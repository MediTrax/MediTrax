// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_badge.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AchievementBadgeImplAdapter extends TypeAdapter<_$AchievementBadgeImpl> {
  @override
  final int typeId = 11;

  @override
  _$AchievementBadgeImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$AchievementBadgeImpl(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      iconUrl: fields[3] as String,
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$AchievementBadgeImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.iconUrl)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AchievementBadgeImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
