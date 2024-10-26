// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_risk_assessment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HealthRiskAssessment {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  Object get questionnaireData => throw _privateConstructorUsedError;
  @HiveField(3)
  int get riskLevel => throw _privateConstructorUsedError;
  @HiveField(4)
  List<String> get recommendations => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of HealthRiskAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthRiskAssessmentCopyWith<HealthRiskAssessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthRiskAssessmentCopyWith<$Res> {
  factory $HealthRiskAssessmentCopyWith(HealthRiskAssessment value,
          $Res Function(HealthRiskAssessment) then) =
      _$HealthRiskAssessmentCopyWithImpl<$Res, HealthRiskAssessment>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) Object questionnaireData,
      @HiveField(3) int riskLevel,
      @HiveField(4) List<String> recommendations,
      @HiveField(5) DateTime createdAt});
}

/// @nodoc
class _$HealthRiskAssessmentCopyWithImpl<$Res,
        $Val extends HealthRiskAssessment>
    implements $HealthRiskAssessmentCopyWith<$Res> {
  _$HealthRiskAssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthRiskAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? questionnaireData = null,
    Object? riskLevel = null,
    Object? recommendations = null,
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
      questionnaireData: null == questionnaireData
          ? _value.questionnaireData
          : questionnaireData,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as int,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthRiskAssessmentImplCopyWith<$Res>
    implements $HealthRiskAssessmentCopyWith<$Res> {
  factory _$$HealthRiskAssessmentImplCopyWith(_$HealthRiskAssessmentImpl value,
          $Res Function(_$HealthRiskAssessmentImpl) then) =
      __$$HealthRiskAssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) Object questionnaireData,
      @HiveField(3) int riskLevel,
      @HiveField(4) List<String> recommendations,
      @HiveField(5) DateTime createdAt});
}

/// @nodoc
class __$$HealthRiskAssessmentImplCopyWithImpl<$Res>
    extends _$HealthRiskAssessmentCopyWithImpl<$Res, _$HealthRiskAssessmentImpl>
    implements _$$HealthRiskAssessmentImplCopyWith<$Res> {
  __$$HealthRiskAssessmentImplCopyWithImpl(_$HealthRiskAssessmentImpl _value,
      $Res Function(_$HealthRiskAssessmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of HealthRiskAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? questionnaireData = null,
    Object? riskLevel = null,
    Object? recommendations = null,
    Object? createdAt = null,
  }) {
    return _then(_$HealthRiskAssessmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      questionnaireData: null == questionnaireData
          ? _value.questionnaireData
          : questionnaireData,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as int,
      recommendations: null == recommendations
          ? _value._recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 3)
class _$HealthRiskAssessmentImpl extends _HealthRiskAssessment {
  _$HealthRiskAssessmentImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.userId,
      @HiveField(2) required this.questionnaireData,
      @HiveField(3) required this.riskLevel,
      @HiveField(4) required final List<String> recommendations,
      @HiveField(5) required this.createdAt})
      : _recommendations = recommendations,
        super._();

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String userId;
  @override
  @HiveField(2)
  final Object questionnaireData;
  @override
  @HiveField(3)
  final int riskLevel;
  final List<String> _recommendations;
  @override
  @HiveField(4)
  List<String> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  @HiveField(5)
  final DateTime createdAt;

  @override
  String toString() {
    return 'HealthRiskAssessment(id: $id, userId: $userId, questionnaireData: $questionnaireData, riskLevel: $riskLevel, recommendations: $recommendations, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthRiskAssessmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other.questionnaireData, questionnaireData) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            const DeepCollectionEquality()
                .equals(other._recommendations, _recommendations) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      const DeepCollectionEquality().hash(questionnaireData),
      riskLevel,
      const DeepCollectionEquality().hash(_recommendations),
      createdAt);

  /// Create a copy of HealthRiskAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthRiskAssessmentImplCopyWith<_$HealthRiskAssessmentImpl>
      get copyWith =>
          __$$HealthRiskAssessmentImplCopyWithImpl<_$HealthRiskAssessmentImpl>(
              this, _$identity);
}

abstract class _HealthRiskAssessment extends HealthRiskAssessment {
  factory _HealthRiskAssessment(
          {@HiveField(0) required final String id,
          @HiveField(1) required final String userId,
          @HiveField(2) required final Object questionnaireData,
          @HiveField(3) required final int riskLevel,
          @HiveField(4) required final List<String> recommendations,
          @HiveField(5) required final DateTime createdAt}) =
      _$HealthRiskAssessmentImpl;
  _HealthRiskAssessment._() : super._();

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get userId;
  @override
  @HiveField(2)
  Object get questionnaireData;
  @override
  @HiveField(3)
  int get riskLevel;
  @override
  @HiveField(4)
  List<String> get recommendations;
  @override
  @HiveField(5)
  DateTime get createdAt;

  /// Create a copy of HealthRiskAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthRiskAssessmentImplCopyWith<_$HealthRiskAssessmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
