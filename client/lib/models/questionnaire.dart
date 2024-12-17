import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'questionnaire.freezed.dart';
part 'questionnaire.g.dart';

@freezed
class Question extends HiveObject with _$Question {
  Question._();

  @HiveType(typeId: 12)
  factory Question({
    @HiveField(0) required String question,
    @HiveField(1) required String answer,
  }) = _Question;
}

@freezed
class QuestionnaireObject extends HiveObject with _$QuestionnaireObject {
  QuestionnaireObject._();

  @HiveType(typeId: 13)
  factory QuestionnaireObject({
    @HiveField(0) required List<Question> data,
  }) = _QuestionnaireObject;
}
