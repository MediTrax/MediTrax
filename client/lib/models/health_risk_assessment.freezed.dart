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
  String get assessmentId => throw _privateConstructorUsedError;
  @HiveField(1)
  List<HealthResponse> get questionnaireData =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  String get riskLevel => throw _privateConstructorUsedError;
  @HiveField(3)
  String get recommendations => throw _privateConstructorUsedError;
  @HiveField(4)
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
      {@HiveField(0) String assessmentId,
      @HiveField(1) List<HealthResponse> questionnaireData,
      @HiveField(2) String riskLevel,
      @HiveField(3) String recommendations,
      @HiveField(4) DateTime createdAt});
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
    Object? assessmentId = null,
    Object? questionnaireData = null,
    Object? riskLevel = null,
    Object? recommendations = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      assessmentId: null == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as String,
      questionnaireData: null == questionnaireData
          ? _value.questionnaireData
          : questionnaireData // ignore: cast_nullable_to_non_nullable
              as List<HealthResponse>,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as String,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@HiveField(0) String assessmentId,
      @HiveField(1) List<HealthResponse> questionnaireData,
      @HiveField(2) String riskLevel,
      @HiveField(3) String recommendations,
      @HiveField(4) DateTime createdAt});
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
    Object? assessmentId = null,
    Object? questionnaireData = null,
    Object? riskLevel = null,
    Object? recommendations = null,
    Object? createdAt = null,
  }) {
    return _then(_$HealthRiskAssessmentImpl(
      assessmentId: null == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as String,
      questionnaireData: null == questionnaireData
          ? _value._questionnaireData
          : questionnaireData // ignore: cast_nullable_to_non_nullable
              as List<HealthResponse>,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as String,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@HiveField(0) required this.assessmentId,
      @HiveField(1) required final List<HealthResponse> questionnaireData,
      @HiveField(2) required this.riskLevel,
      @HiveField(3) required this.recommendations,
      @HiveField(4) required this.createdAt})
      : _questionnaireData = questionnaireData,
        super._();

  @override
  @HiveField(0)
  final String assessmentId;
  final List<HealthResponse> _questionnaireData;
  @override
  @HiveField(1)
  List<HealthResponse> get questionnaireData {
    if (_questionnaireData is EqualUnmodifiableListView)
      return _questionnaireData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionnaireData);
  }

  @override
  @HiveField(2)
  final String riskLevel;
  @override
  @HiveField(3)
  final String recommendations;
  @override
  @HiveField(4)
  final DateTime createdAt;

  @override
  String toString() {
    return 'HealthRiskAssessment(assessmentId: $assessmentId, questionnaireData: $questionnaireData, riskLevel: $riskLevel, recommendations: $recommendations, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthRiskAssessmentImpl &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            const DeepCollectionEquality()
                .equals(other._questionnaireData, _questionnaireData) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            (identical(other.recommendations, recommendations) ||
                other.recommendations == recommendations) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      assessmentId,
      const DeepCollectionEquality().hash(_questionnaireData),
      riskLevel,
      recommendations,
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
          {@HiveField(0) required final String assessmentId,
          @HiveField(1) required final List<HealthResponse> questionnaireData,
          @HiveField(2) required final String riskLevel,
          @HiveField(3) required final String recommendations,
          @HiveField(4) required final DateTime createdAt}) =
      _$HealthRiskAssessmentImpl;
  _HealthRiskAssessment._() : super._();

  @override
  @HiveField(0)
  String get assessmentId;
  @override
  @HiveField(1)
  List<HealthResponse> get questionnaireData;
  @override
  @HiveField(2)
  String get riskLevel;
  @override
  @HiveField(3)
  String get recommendations;
  @override
  @HiveField(4)
  DateTime get createdAt;

  /// Create a copy of HealthRiskAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthRiskAssessmentImplCopyWith<_$HealthRiskAssessmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
