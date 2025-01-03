// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$User {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(2)
  String get password => throw _privateConstructorUsedError;
  @HiveField(3)
  String get name => throw _privateConstructorUsedError;
  @HiveField(4)
  String get role => throw _privateConstructorUsedError;
  @HiveField(5)
  int get status => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime get lastLogin => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String phoneNumber,
      @HiveField(2) String password,
      @HiveField(3) String name,
      @HiveField(4) String role,
      @HiveField(5) int status,
      @HiveField(6) DateTime createdAt,
      @HiveField(7) DateTime updatedAt,
      @HiveField(8) DateTime lastLogin});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = null,
    Object? password = null,
    Object? name = null,
    Object? role = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? lastLogin = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastLogin: null == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String phoneNumber,
      @HiveField(2) String password,
      @HiveField(3) String name,
      @HiveField(4) String role,
      @HiveField(5) int status,
      @HiveField(6) DateTime createdAt,
      @HiveField(7) DateTime updatedAt,
      @HiveField(8) DateTime lastLogin});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = null,
    Object? password = null,
    Object? name = null,
    Object? role = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? lastLogin = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastLogin: null == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 15)
class _$UserImpl extends _User {
  _$UserImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.phoneNumber,
      @HiveField(2) required this.password,
      @HiveField(3) required this.name,
      @HiveField(4) required this.role,
      @HiveField(5) required this.status,
      @HiveField(6) required this.createdAt,
      @HiveField(7) required this.updatedAt,
      @HiveField(8) required this.lastLogin})
      : super._();

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String phoneNumber;
  @override
  @HiveField(2)
  final String password;
  @override
  @HiveField(3)
  final String name;
  @override
  @HiveField(4)
  final String role;
  @override
  @HiveField(5)
  final int status;
  @override
  @HiveField(6)
  final DateTime createdAt;
  @override
  @HiveField(7)
  final DateTime updatedAt;
  @override
  @HiveField(8)
  final DateTime lastLogin;

  @override
  String toString() {
    return 'User(id: $id, phoneNumber: $phoneNumber, password: $password, name: $name, role: $role, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, lastLogin: $lastLogin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, phoneNumber, password, name,
      role, status, createdAt, updatedAt, lastLogin);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);
}

abstract class _User extends User {
  factory _User(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String phoneNumber,
      @HiveField(2) required final String password,
      @HiveField(3) required final String name,
      @HiveField(4) required final String role,
      @HiveField(5) required final int status,
      @HiveField(6) required final DateTime createdAt,
      @HiveField(7) required final DateTime updatedAt,
      @HiveField(8) required final DateTime lastLogin}) = _$UserImpl;
  _User._() : super._();

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get phoneNumber;
  @override
  @HiveField(2)
  String get password;
  @override
  @HiveField(3)
  String get name;
  @override
  @HiveField(4)
  String get role;
  @override
  @HiveField(5)
  int get status;
  @override
  @HiveField(6)
  DateTime get createdAt;
  @override
  @HiveField(7)
  DateTime get updatedAt;
  @override
  @HiveField(8)
  DateTime get lastLogin;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
