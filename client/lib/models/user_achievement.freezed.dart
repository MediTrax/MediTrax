// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_achievement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserAchievement {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  String get badgeId => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime get earnedAt => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of UserAchievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAchievementCopyWith<UserAchievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAchievementCopyWith<$Res> {
  factory $UserAchievementCopyWith(
          UserAchievement value, $Res Function(UserAchievement) then) =
      _$UserAchievementCopyWithImpl<$Res, UserAchievement>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) String badgeId,
      @HiveField(3) DateTime earnedAt,
      @HiveField(4) DateTime createdAt});
}

/// @nodoc
class _$UserAchievementCopyWithImpl<$Res, $Val extends UserAchievement>
    implements $UserAchievementCopyWith<$Res> {
  _$UserAchievementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAchievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? badgeId = null,
    Object? earnedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      badgeId: null == badgeId
          ? _value.badgeId
          : badgeId // ignore: cast_nullable_to_non_nullable
              as String,
      earnedAt: null == earnedAt
          ? _value.earnedAt
          : earnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAchievementImplCopyWith<$Res>
    implements $UserAchievementCopyWith<$Res> {
  factory _$$UserAchievementImplCopyWith(_$UserAchievementImpl value,
          $Res Function(_$UserAchievementImpl) then) =
      __$$UserAchievementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) String badgeId,
      @HiveField(3) DateTime earnedAt,
      @HiveField(4) DateTime createdAt});
}

/// @nodoc
class __$$UserAchievementImplCopyWithImpl<$Res>
    extends _$UserAchievementCopyWithImpl<$Res, _$UserAchievementImpl>
    implements _$$UserAchievementImplCopyWith<$Res> {
  __$$UserAchievementImplCopyWithImpl(
      _$UserAchievementImpl _value, $Res Function(_$UserAchievementImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAchievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? badgeId = null,
    Object? earnedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_$UserAchievementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      badgeId: null == badgeId
          ? _value.badgeId
          : badgeId // ignore: cast_nullable_to_non_nullable
              as String,
      earnedAt: null == earnedAt
          ? _value.earnedAt
          : earnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 12)
class _$UserAchievementImpl extends _UserAchievement {
  _$UserAchievementImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.userId,
      @HiveField(2) required this.badgeId,
      @HiveField(3) required this.earnedAt,
      @HiveField(4) required this.createdAt})
      : super._();

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String userId;
  @override
  @HiveField(2)
  final String badgeId;
  @override
  @HiveField(3)
  final DateTime earnedAt;
  @override
  @HiveField(4)
  final DateTime createdAt;

  @override
  String toString() {
    return 'UserAchievement(id: $id, userId: $userId, badgeId: $badgeId, earnedAt: $earnedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAchievementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.badgeId, badgeId) || other.badgeId == badgeId) &&
            (identical(other.earnedAt, earnedAt) ||
                other.earnedAt == earnedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, badgeId, earnedAt, createdAt);

  /// Create a copy of UserAchievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAchievementImplCopyWith<_$UserAchievementImpl> get copyWith =>
      __$$UserAchievementImplCopyWithImpl<_$UserAchievementImpl>(
          this, _$identity);
}

abstract class _UserAchievement extends UserAchievement {
  factory _UserAchievement(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String userId,
      @HiveField(2) required final String badgeId,
      @HiveField(3) required final DateTime earnedAt,
      @HiveField(4) required final DateTime createdAt}) = _$UserAchievementImpl;
  _UserAchievement._() : super._();

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get userId;
  @override
  @HiveField(2)
  String get badgeId;
  @override
  @HiveField(3)
  DateTime get earnedAt;
  @override
  @HiveField(4)
  DateTime get createdAt;

  /// Create a copy of UserAchievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAchievementImplCopyWith<_$UserAchievementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
