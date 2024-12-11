import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:meditrax/models/token.dart';

part "user_achievement.freezed.dart";
part "user_achievement.g.dart";

@freezed
class UserAchievement extends HiveObject with _$UserAchievement {
  UserAchievement._();

  @HiveType(typeId: 12)
  factory UserAchievement({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required String badgeId,
    @HiveField(3) required DateTime earnedAt,
    @HiveField(4) required DateTime createdAt,
  }) = _UserAchievement;

}