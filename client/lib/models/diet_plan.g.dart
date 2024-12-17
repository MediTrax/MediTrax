// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_plan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DietPlanImplAdapter extends TypeAdapter<_$DietPlanImpl> {
  @override
  final int typeId = 8;

  @override
  _$DietPlanImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$DietPlanImpl(
      id: fields[0] as String,
      userId: fields[1] as String,
      mealType: fields[2] as String,
      foodItems: (fields[3] as List).cast<String>(),
      calories: fields[4] as int,
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$DietPlanImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.mealType)
      ..writeByte(4)
      ..write(obj.calories)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.foodItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DietPlanImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
