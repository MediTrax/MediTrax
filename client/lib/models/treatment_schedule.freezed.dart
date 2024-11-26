// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'treatment_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TreatmentSchedule {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get treatmentType => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get scheduledTime => throw _privateConstructorUsedError;
  @HiveField(3)
  String get location => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of TreatmentSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreatmentScheduleCopyWith<TreatmentSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreatmentScheduleCopyWith<$Res> {
  factory $TreatmentScheduleCopyWith(
          TreatmentSchedule value, $Res Function(TreatmentSchedule) then) =
      _$TreatmentScheduleCopyWithImpl<$Res, TreatmentSchedule>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String treatmentType,
      @HiveField(2) DateTime scheduledTime,
      @HiveField(3) String location,
      @HiveField(4) String? notes});
}

/// @nodoc
class _$TreatmentScheduleCopyWithImpl<$Res, $Val extends TreatmentSchedule>
    implements $TreatmentScheduleCopyWith<$Res> {
  _$TreatmentScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreatmentSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? treatmentType = null,
    Object? scheduledTime = null,
    Object? location = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      treatmentType: null == treatmentType
          ? _value.treatmentType
          : treatmentType // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreatmentScheduleImplCopyWith<$Res>
    implements $TreatmentScheduleCopyWith<$Res> {
  factory _$$TreatmentScheduleImplCopyWith(_$TreatmentScheduleImpl value,
          $Res Function(_$TreatmentScheduleImpl) then) =
      __$$TreatmentScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String treatmentType,
      @HiveField(2) DateTime scheduledTime,
      @HiveField(3) String location,
      @HiveField(4) String? notes});
}

/// @nodoc
class __$$TreatmentScheduleImplCopyWithImpl<$Res>
    extends _$TreatmentScheduleCopyWithImpl<$Res, _$TreatmentScheduleImpl>
    implements _$$TreatmentScheduleImplCopyWith<$Res> {
  __$$TreatmentScheduleImplCopyWithImpl(_$TreatmentScheduleImpl _value,
      $Res Function(_$TreatmentScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreatmentSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? treatmentType = null,
    Object? scheduledTime = null,
    Object? location = null,
    Object? notes = freezed,
  }) {
    return _then(_$TreatmentScheduleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      treatmentType: null == treatmentType
          ? _value.treatmentType
          : treatmentType // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 6)
class _$TreatmentScheduleImpl extends _TreatmentSchedule {
  _$TreatmentScheduleImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.treatmentType,
      @HiveField(2) required this.scheduledTime,
      @HiveField(3) required this.location,
      @HiveField(4) this.notes})
      : super._();

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String treatmentType;
  @override
  @HiveField(2)
  final DateTime scheduledTime;
  @override
  @HiveField(3)
  final String location;
  @override
  @HiveField(4)
  final String? notes;

  @override
  String toString() {
    return 'TreatmentSchedule(id: $id, treatmentType: $treatmentType, scheduledTime: $scheduledTime, location: $location, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreatmentScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.treatmentType, treatmentType) ||
                other.treatmentType == treatmentType) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, treatmentType, scheduledTime, location, notes);

  /// Create a copy of TreatmentSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreatmentScheduleImplCopyWith<_$TreatmentScheduleImpl> get copyWith =>
      __$$TreatmentScheduleImplCopyWithImpl<_$TreatmentScheduleImpl>(
          this, _$identity);
}

abstract class _TreatmentSchedule extends TreatmentSchedule {
  factory _TreatmentSchedule(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String treatmentType,
      @HiveField(2) required final DateTime scheduledTime,
      @HiveField(3) required final String location,
      @HiveField(4) final String? notes}) = _$TreatmentScheduleImpl;
  _TreatmentSchedule._() : super._();

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get treatmentType;
  @override
  @HiveField(2)
  DateTime get scheduledTime;
  @override
  @HiveField(3)
  String get location;
  @override
  @HiveField(4)
  String? get notes;

  /// Create a copy of TreatmentSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreatmentScheduleImplCopyWith<_$TreatmentScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
