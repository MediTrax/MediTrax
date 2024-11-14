// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questionnaire.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Question {
  @HiveField(0)
  String get question => throw _privateConstructorUsedError;
  @HiveField(1)
  String get answer => throw _privateConstructorUsedError;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call({@HiveField(0) String question, @HiveField(1) String answer});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
          _$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String question, @HiveField(1) String answer});
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
      _$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_$QuestionImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 12)
class _$QuestionImpl extends _Question {
  _$QuestionImpl(
      {@HiveField(0) required this.question,
      @HiveField(1) required this.answer})
      : super._();

  @override
  @HiveField(0)
  final String question;
  @override
  @HiveField(1)
  final String answer;

  @override
  String toString() {
    return 'Question(question: $question, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, question, answer);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);
}

abstract class _Question extends Question {
  factory _Question(
      {@HiveField(0) required final String question,
      @HiveField(1) required final String answer}) = _$QuestionImpl;
  _Question._() : super._();

  @override
  @HiveField(0)
  String get question;
  @override
  @HiveField(1)
  String get answer;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QuestionnaireObject {
  @HiveField(0)
  List<Question> get data => throw _privateConstructorUsedError;

  /// Create a copy of QuestionnaireObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionnaireObjectCopyWith<QuestionnaireObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionnaireObjectCopyWith<$Res> {
  factory $QuestionnaireObjectCopyWith(
          QuestionnaireObject value, $Res Function(QuestionnaireObject) then) =
      _$QuestionnaireObjectCopyWithImpl<$Res, QuestionnaireObject>;
  @useResult
  $Res call({@HiveField(0) List<Question> data});
}

/// @nodoc
class _$QuestionnaireObjectCopyWithImpl<$Res, $Val extends QuestionnaireObject>
    implements $QuestionnaireObjectCopyWith<$Res> {
  _$QuestionnaireObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionnaireObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionnaireObjectImplCopyWith<$Res>
    implements $QuestionnaireObjectCopyWith<$Res> {
  factory _$$QuestionnaireObjectImplCopyWith(_$QuestionnaireObjectImpl value,
          $Res Function(_$QuestionnaireObjectImpl) then) =
      __$$QuestionnaireObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) List<Question> data});
}

/// @nodoc
class __$$QuestionnaireObjectImplCopyWithImpl<$Res>
    extends _$QuestionnaireObjectCopyWithImpl<$Res, _$QuestionnaireObjectImpl>
    implements _$$QuestionnaireObjectImplCopyWith<$Res> {
  __$$QuestionnaireObjectImplCopyWithImpl(_$QuestionnaireObjectImpl _value,
      $Res Function(_$QuestionnaireObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionnaireObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$QuestionnaireObjectImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 13)
class _$QuestionnaireObjectImpl extends _QuestionnaireObject {
  _$QuestionnaireObjectImpl({@HiveField(0) required final List<Question> data})
      : _data = data,
        super._();

  final List<Question> _data;
  @override
  @HiveField(0)
  List<Question> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'QuestionnaireObject(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionnaireObjectImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of QuestionnaireObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionnaireObjectImplCopyWith<_$QuestionnaireObjectImpl> get copyWith =>
      __$$QuestionnaireObjectImplCopyWithImpl<_$QuestionnaireObjectImpl>(
          this, _$identity);
}

abstract class _QuestionnaireObject extends QuestionnaireObject {
  factory _QuestionnaireObject(
          {@HiveField(0) required final List<Question> data}) =
      _$QuestionnaireObjectImpl;
  _QuestionnaireObject._() : super._();

  @override
  @HiveField(0)
  List<Question> get data;

  /// Create a copy of QuestionnaireObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionnaireObjectImplCopyWith<_$QuestionnaireObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
