// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppStateDataImplAdapter extends TypeAdapter<_$AppStateDataImpl> {
  @override
  final int typeId = 0;

  @override
  _$AppStateDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$AppStateDataImpl(
      navigatorIndex: fields[0] as int,
      token: fields[1] as Token?,
      theme: fields[2] as String,
      autoLoginResult: fields[3] as bool?,
      selectedProfile: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$AppStateDataImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.navigatorIndex)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.theme)
      ..writeByte(3)
      ..write(obj.autoLoginResult)
      ..writeByte(4)
      ..write(obj.selectedProfile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppStateDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
