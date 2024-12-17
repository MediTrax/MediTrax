// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_badge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AchievementBadge {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  String get iconUrl => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of AchievementBadge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementBadgeCopyWith<AchievementBadge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementBadgeCopyWith<$Res> {
  factory $AchievementBadgeCopyWith(
          AchievementBadge value, $Res Function(AchievementBadge) then) =
      _$AchievementBadgeCopyWithImpl<$Res, AchievementBadge>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) String iconUrl,
      @HiveField(4) DateTime createdAt});
}

/// @nodoc
class _$AchievementBadgeCopyWithImpl<$Res, $Val extends AchievementBadge>
    implements $AchievementBadgeCopyWith<$Res> {
  _$AchievementBadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AchievementBadge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? iconUrl = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchievementBadgeImplCopyWith<$Res>
    implements $AchievementBadgeCopyWith<$Res> {
  factory _$$AchievementBadgeImplCopyWith(_$AchievementBadgeImpl value,
          $Res Function(_$AchievementBadgeImpl) then) =
      __$$AchievementBadgeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) String iconUrl,
      @HiveField(4) DateTime createdAt});
}

/// @nodoc
class __$$AchievementBadgeImplCopyWithImpl<$Res>
    extends _$AchievementBadgeCopyWithImpl<$Res, _$AchievementBadgeImpl>
    implements _$$AchievementBadgeImplCopyWith<$Res> {
  __$$AchievementBadgeImplCopyWithImpl(_$AchievementBadgeImpl _value,
      $Res Function(_$AchievementBadgeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AchievementBadge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? iconUrl = null,
    Object? createdAt = null,
  }) {
    return _then(_$AchievementBadgeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 11)
class _$AchievementBadgeImpl extends _AchievementBadge {
  _$AchievementBadgeImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.description,
      @HiveField(3) required this.iconUrl,
      @HiveField(4) required this.createdAt})
      : super._();

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String description;
  @override
  @HiveField(3)
  final String iconUrl;
  @override
  @HiveField(4)
  final DateTime createdAt;

  @override
  String toString() {
    return 'AchievementBadge(id: $id, name: $name, description: $description, iconUrl: $iconUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementBadgeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, iconUrl, createdAt);

  /// Create a copy of AchievementBadge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementBadgeImplCopyWith<_$AchievementBadgeImpl> get copyWith =>
      __$$AchievementBadgeImplCopyWithImpl<_$AchievementBadgeImpl>(
          this, _$identity);
}

abstract class _AchievementBadge extends AchievementBadge {
  factory _AchievementBadge(
          {@HiveField(0) required final String id,
          @HiveField(1) required final String name,
          @HiveField(2) required final String description,
          @HiveField(3) required final String iconUrl,
          @HiveField(4) required final DateTime createdAt}) =
      _$AchievementBadgeImpl;
  _AchievementBadge._() : super._();

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get description;
  @override
  @HiveField(3)
  String get iconUrl;
  @override
  @HiveField(4)
  DateTime get createdAt;

  /// Create a copy of AchievementBadge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementBadgeImplCopyWith<_$AchievementBadgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
