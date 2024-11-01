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
    @HiveField(1) required String email,
    @HiveField(2) required String password,
    @HiveField(3) required String name,
    @HiveField(4) required DateTime createdAt,
    @HiveField(5) required DateTime updatedAt,
    @HiveField(6) required DateTime lastLogin,
    @HiveField(7) required int status,
    @HiveField(8) required String role,
  }) = _User;
}
