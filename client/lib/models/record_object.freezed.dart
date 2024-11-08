// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecordObject {
  @HiveField(0)
  String get data => throw _privateConstructorUsedError;

  /// Create a copy of RecordObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordObjectCopyWith<RecordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordObjectCopyWith<$Res> {
  factory $RecordObjectCopyWith(
          RecordObject value, $Res Function(RecordObject) then) =
      _$RecordObjectCopyWithImpl<$Res, RecordObject>;
  @useResult
  $Res call({@HiveField(0) String data});
}

/// @nodoc
class _$RecordObjectCopyWithImpl<$Res, $Val extends RecordObject>
    implements $RecordObjectCopyWith<$Res> {
  _$RecordObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordObject
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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordObjectImplCopyWith<$Res>
    implements $RecordObjectCopyWith<$Res> {
  factory _$$RecordObjectImplCopyWith(
          _$RecordObjectImpl value, $Res Function(_$RecordObjectImpl) then) =
      __$$RecordObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String data});
}

/// @nodoc
class __$$RecordObjectImplCopyWithImpl<$Res>
    extends _$RecordObjectCopyWithImpl<$Res, _$RecordObjectImpl>
    implements _$$RecordObjectImplCopyWith<$Res> {
  __$$RecordObjectImplCopyWithImpl(
      _$RecordObjectImpl _value, $Res Function(_$RecordObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$RecordObjectImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 14)
class _$RecordObjectImpl extends _RecordObject {
  _$RecordObjectImpl({@HiveField(0) required this.data}) : super._();

  @override
  @HiveField(0)
  final String data;

  @override
  String toString() {
    return 'RecordObject(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordObjectImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of RecordObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordObjectImplCopyWith<_$RecordObjectImpl> get copyWith =>
      __$$RecordObjectImplCopyWithImpl<_$RecordObjectImpl>(this, _$identity);
}

abstract class _RecordObject extends RecordObject {
  factory _RecordObject({@HiveField(0) required final String data}) =
      _$RecordObjectImpl;
  _RecordObject._() : super._();

  @override
  @HiveField(0)
  String get data;

  /// Create a copy of RecordObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordObjectImplCopyWith<_$RecordObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
