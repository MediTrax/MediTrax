// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication_reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MedicationReminder {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get medicationId => throw _privateConstructorUsedError;
  @HiveField(2)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime get reminderTime => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get isTaken => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of MedicationReminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicationReminderCopyWith<MedicationReminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationReminderCopyWith<$Res> {
  factory $MedicationReminderCopyWith(
          MedicationReminder value, $Res Function(MedicationReminder) then) =
      _$MedicationReminderCopyWithImpl<$Res, MedicationReminder>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String medicationId,
      @HiveField(2) String userId,
      @HiveField(3) DateTime reminderTime,
      @HiveField(4) bool isTaken,
      @HiveField(5) DateTime createdAt});
}

/// @nodoc
class _$MedicationReminderCopyWithImpl<$Res, $Val extends MedicationReminder>
    implements $MedicationReminderCopyWith<$Res> {
  _$MedicationReminderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicationReminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? medicationId = null,
    Object? userId = null,
    Object? reminderTime = null,
    Object? isTaken = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      medicationId: null == medicationId
          ? _value.medicationId
          : medicationId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      reminderTime: null == reminderTime
          ? _value.reminderTime
          : reminderTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isTaken: null == isTaken
          ? _value.isTaken
          : isTaken // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MedicationReminderImplCopyWith<$Res>
    implements $MedicationReminderCopyWith<$Res> {
  factory _$$MedicationReminderImplCopyWith(_$MedicationReminderImpl value,
          $Res Function(_$MedicationReminderImpl) then) =
      __$$MedicationReminderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String medicationId,
      @HiveField(2) String userId,
      @HiveField(3) DateTime reminderTime,
      @HiveField(4) bool isTaken,
      @HiveField(5) DateTime createdAt});
}

/// @nodoc
class __$$MedicationReminderImplCopyWithImpl<$Res>
    extends _$MedicationReminderCopyWithImpl<$Res, _$MedicationReminderImpl>
    implements _$$MedicationReminderImplCopyWith<$Res> {
  __$$MedicationReminderImplCopyWithImpl(_$MedicationReminderImpl _value,
      $Res Function(_$MedicationReminderImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicationReminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? medicationId = null,
    Object? userId = null,
    Object? reminderTime = null,
    Object? isTaken = null,
    Object? createdAt = null,
  }) {
    return _then(_$MedicationReminderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      medicationId: null == medicationId
          ? _value.medicationId
          : medicationId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      reminderTime: null == reminderTime
          ? _value.reminderTime
          : reminderTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isTaken: null == isTaken
          ? _value.isTaken
          : isTaken // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 5)
class _$MedicationReminderImpl extends _MedicationReminder {
  _$MedicationReminderImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.medicationId,
      @HiveField(2) required this.userId,
      @HiveField(3) required this.reminderTime,
      @HiveField(4) required this.isTaken,
      @HiveField(5) required this.createdAt})
      : super._();

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String medicationId;
  @override
  @HiveField(2)
  final String userId;
  @override
  @HiveField(3)
  final DateTime reminderTime;
  @override
  @HiveField(4)
  final bool isTaken;
  @override
  @HiveField(5)
  final DateTime createdAt;

  @override
  String toString() {
    return 'MedicationReminder(id: $id, medicationId: $medicationId, userId: $userId, reminderTime: $reminderTime, isTaken: $isTaken, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicationReminderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.medicationId, medicationId) ||
                other.medicationId == medicationId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.reminderTime, reminderTime) ||
                other.reminderTime == reminderTime) &&
            (identical(other.isTaken, isTaken) || other.isTaken == isTaken) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, medicationId, userId, reminderTime, isTaken, createdAt);

  /// Create a copy of MedicationReminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicationReminderImplCopyWith<_$MedicationReminderImpl> get copyWith =>
      __$$MedicationReminderImplCopyWithImpl<_$MedicationReminderImpl>(
          this, _$identity);
}

abstract class _MedicationReminder extends MedicationReminder {
  factory _MedicationReminder(
          {@HiveField(0) required final String id,
          @HiveField(1) required final String medicationId,
          @HiveField(2) required final String userId,
          @HiveField(3) required final DateTime reminderTime,
          @HiveField(4) required final bool isTaken,
          @HiveField(5) required final DateTime createdAt}) =
      _$MedicationReminderImpl;
  _MedicationReminder._() : super._();

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get medicationId;
  @override
  @HiveField(2)
  String get userId;
  @override
  @HiveField(3)
  DateTime get reminderTime;
  @override
  @HiveField(4)
  bool get isTaken;
  @override
  @HiveField(5)
  DateTime get createdAt;

  /// Create a copy of MedicationReminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicationReminderImplCopyWith<_$MedicationReminderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
