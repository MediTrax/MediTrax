import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part "achievement_badge.freezed.dart";
part "achievement_badge.g.dart";

@freezed
class AchievementBadge extends HiveObject with _$AchievementBadge {
  AchievementBadge._();

  @HiveType(typeId: 11)
  factory AchievementBadge({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String description,
    @HiveField(3) required String iconUrl,
    @HiveField(4) required DateTime createdAt,
  }) = _AchievementBadge;
}
