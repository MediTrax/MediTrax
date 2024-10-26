import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:meditrax/models/token.dart';

part "user.freezed.dart";
part "user.g.dart";

@freezed
class User extends HiveObject with _$User {
  User._();

  @HiveType(typeId: 2)
  factory User({
    @HiveField(0) required String id,
    @HiveField(1) required String email,
    @HiveField(2) required String name,
    @HiveField(3) required DateTime createdAt,
    @HiveField(4) required DateTime updatedAt,
    @HiveField(5) required DateTime lastLogin,
    @HiveField(6) required  int status ,
    @HiveField(7) required String role,

  }) = _User;

}