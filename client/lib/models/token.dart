import 'package:hive/hive.dart';

part "token.g.dart";

@HiveType(typeId: 1)
class Token {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String user;
  @HiveField(2)
  final String accessToken;
  @HiveField(3)
  final DateTime accessTokenExpiry;
  @HiveField(4)
  final DateTime refreshTokenExpiry;
  @HiveField(5)
  final String device;
  @HiveField(6)
  final DateTime createdAt;
  const Token({
    required this.id,
    required this.user,
    required this.accessToken,
    required this.accessTokenExpiry,
    required this.refreshTokenExpiry,
    required this.device,
    required this.createdAt,
  });

  Token.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        user = json["user"],
        accessToken = json["accessToken"],
        accessTokenExpiry = DateTime.parse(json["accessTokenExpiry"]),
        refreshTokenExpiry = DateTime.parse(json["refreshTokenExpiry"]),
        device = json["device"],
        createdAt = DateTime.parse(json["createdAt"]);
}
