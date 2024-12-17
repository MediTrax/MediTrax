// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_metric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HealthMetric {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get metricType => throw _privateConstructorUsedError;
  @HiveField(2)
  double get value => throw _privateConstructorUsedError;
  @HiveField(3)
  String get unit => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get recordedAt => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of HealthMetric
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthMetricCopyWith<HealthMetric> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthMetricCopyWith<$Res> {
  factory $HealthMetricCopyWith(
          HealthMetric value, $Res Function(HealthMetric) then) =
      _$HealthMetricCopyWithImpl<$Res, HealthMetric>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String metricType,
      @HiveField(2) double value,
      @HiveField(3) String unit,
      @HiveField(4) DateTime recordedAt,
      @HiveField(5) DateTime createdAt});
}

/// @nodoc
class _$HealthMetricCopyWithImpl<$Res, $Val extends HealthMetric>
    implements $HealthMetricCopyWith<$Res> {
  _$HealthMetricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthMetric
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? metricType = null,
    Object? value = null,
    Object? unit = null,
    Object? recordedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      metricType: null == metricType
          ? _value.metricType
          : metricType // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthMetricImplCopyWith<$Res>
    implements $HealthMetricCopyWith<$Res> {
  factory _$$HealthMetricImplCopyWith(
          _$HealthMetricImpl value, $Res Function(_$HealthMetricImpl) then) =
      __$$HealthMetricImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String metricType,
      @HiveField(2) double value,
      @HiveField(3) String unit,
      @HiveField(4) DateTime recordedAt,
      @HiveField(5) DateTime createdAt});
}

/// @nodoc
class __$$HealthMetricImplCopyWithImpl<$Res>
    extends _$HealthMetricCopyWithImpl<$Res, _$HealthMetricImpl>
    implements _$$HealthMetricImplCopyWith<$Res> {
  __$$HealthMetricImplCopyWithImpl(
      _$HealthMetricImpl _value, $Res Function(_$HealthMetricImpl) _then)
      : super(_value, _then);

  /// Create a copy of HealthMetric
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? metricType = null,
    Object? value = null,
    Object? unit = null,
    Object? recordedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_$HealthMetricImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      metricType: null == metricType
          ? _value.metricType
          : metricType // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 7)
class _$HealthMetricImpl extends _HealthMetric {
  _$HealthMetricImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.metricType,
      @HiveField(2) required this.value,
      @HiveField(3) required this.unit,
      @HiveField(4) required this.recordedAt,
      @HiveField(5) required this.createdAt})
      : super._();

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String metricType;
  @override
  @HiveField(2)
  final double value;
  @override
  @HiveField(3)
  final String unit;
  @override
  @HiveField(4)
  final DateTime recordedAt;
  @override
  @HiveField(5)
  final DateTime createdAt;

  @override
  String toString() {
    return 'HealthMetric(id: $id, metricType: $metricType, value: $value, unit: $unit, recordedAt: $recordedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthMetricImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.metricType, metricType) ||
                other.metricType == metricType) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, metricType, value, unit, recordedAt, createdAt);

  /// Create a copy of HealthMetric
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthMetricImplCopyWith<_$HealthMetricImpl> get copyWith =>
      __$$HealthMetricImplCopyWithImpl<_$HealthMetricImpl>(this, _$identity);
}

abstract class _HealthMetric extends HealthMetric {
  factory _HealthMetric(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String metricType,
      @HiveField(2) required final double value,
      @HiveField(3) required final String unit,
      @HiveField(4) required final DateTime recordedAt,
      @HiveField(5) required final DateTime createdAt}) = _$HealthMetricImpl;
  _HealthMetric._() : super._();

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get metricType;
  @override
  @HiveField(2)
  double get value;
  @override
  @HiveField(3)
  String get unit;
  @override
  @HiveField(4)
  DateTime get recordedAt;
  @override
  @HiveField(5)
  DateTime get createdAt;

  /// Create a copy of HealthMetric
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthMetricImplCopyWith<_$HealthMetricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
