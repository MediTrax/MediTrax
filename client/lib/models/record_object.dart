import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'record_object.freezed.dart';
part 'record_object.g.dart';

@freezed
class RecordObject extends HiveObject with _$RecordObject {
  RecordObject._();

  @HiveType(typeId: 14)
  factory RecordObject({
    @HiveField(0) required String data,
  }) = _RecordObject;
}
