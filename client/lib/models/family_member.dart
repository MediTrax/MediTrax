import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:meditrax/models/token.dart';

part "family_member.freezed.dart";
part "family_member.g.dart";

@freezed
class FamilyMember extends HiveObject with _$FamilyMember {
  FamilyMember._();

  @HiveType(typeId: 10)
  factory FamilyMember({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required String relatedUserId,
    @HiveField(3) required String relationship,
    @HiveField(4) required int accessLevel,
    @HiveField(5) required DateTime createdAt,
  }) = _FamilyMember;

}