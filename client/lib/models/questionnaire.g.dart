// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaire.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionImplAdapter extends TypeAdapter<_$QuestionImpl> {
  @override
  final int typeId = 12;

  @override
  _$QuestionImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$QuestionImpl(
      question: fields[0] as String,
      answer: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$QuestionImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.question)
      ..writeByte(1)
      ..write(obj.answer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuestionnaireObjectImplAdapter
    extends TypeAdapter<_$QuestionnaireObjectImpl> {
  @override
  final int typeId = 13;

  @override
  _$QuestionnaireObjectImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$QuestionnaireObjectImpl(
      data: (fields[0] as List).cast<Question>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$QuestionnaireObjectImpl obj) {
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
      other is QuestionnaireObjectImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
