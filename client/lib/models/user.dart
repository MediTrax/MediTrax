import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User extends HiveObject with _$User {
  User._();

  @HiveType(typeId: 15)
  factory User({
    @HiveField(0) required String id,
    @HiveField(1) required String phoneNumber,
    @HiveField(2) required String password,
    @HiveField(3) required String name,
    @HiveField(4) required String role,
    @HiveField(5) required int status,
    @HiveField(6) required DateTime created_at,
    @HiveField(7) required DateTime updated_at,
    @HiveField(8) required DateTime last_login,
  }) = _User;
}