// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppStateData {
  @HiveField(0)
  int get navigatorIndex => throw _privateConstructorUsedError;
  @HiveField(1)
  Token? get token => throw _privateConstructorUsedError;
  @HiveField(2)
  String get theme => throw _privateConstructorUsedError;
  @HiveField(3)
  bool? get autoLoginResult => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get selectedProfile => throw _privateConstructorUsedError;

  /// Create a copy of AppStateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateDataCopyWith<AppStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateDataCopyWith<$Res> {
  factory $AppStateDataCopyWith(
          AppStateData value, $Res Function(AppStateData) then) =
      _$AppStateDataCopyWithImpl<$Res, AppStateData>;
  @useResult
  $Res call(
      {@HiveField(0) int navigatorIndex,
      @HiveField(1) Token? token,
      @HiveField(2) String theme,
      @HiveField(3) bool? autoLoginResult,
      @HiveField(4) String? selectedProfile});
}

/// @nodoc
class _$AppStateDataCopyWithImpl<$Res, $Val extends AppStateData>
    implements $AppStateDataCopyWith<$Res> {
  _$AppStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppStateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navigatorIndex = null,
    Object? token = freezed,
    Object? theme = null,
    Object? autoLoginResult = freezed,
    Object? selectedProfile = freezed,
  }) {
    return _then(_value.copyWith(
      navigatorIndex: null == navigatorIndex
          ? _value.navigatorIndex
          : navigatorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token?,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      autoLoginResult: freezed == autoLoginResult
          ? _value.autoLoginResult
          : autoLoginResult // ignore: cast_nullable_to_non_nullable
              as bool?,
      selectedProfile: freezed == selectedProfile
          ? _value.selectedProfile
          : selectedProfile // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppStateDataImplCopyWith<$Res>
    implements $AppStateDataCopyWith<$Res> {
  factory _$$AppStateDataImplCopyWith(
          _$AppStateDataImpl value, $Res Function(_$AppStateDataImpl) then) =
      __$$AppStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int navigatorIndex,
      @HiveField(1) Token? token,
      @HiveField(2) String theme,
      @HiveField(3) bool? autoLoginResult,
      @HiveField(4) String? selectedProfile});
}

/// @nodoc
class __$$AppStateDataImplCopyWithImpl<$Res>
    extends _$AppStateDataCopyWithImpl<$Res, _$AppStateDataImpl>
    implements _$$AppStateDataImplCopyWith<$Res> {
  __$$AppStateDataImplCopyWithImpl(
      _$AppStateDataImpl _value, $Res Function(_$AppStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppStateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navigatorIndex = null,
    Object? token = freezed,
    Object? theme = null,
    Object? autoLoginResult = freezed,
    Object? selectedProfile = freezed,
  }) {
    return _then(_$AppStateDataImpl(
      navigatorIndex: null == navigatorIndex
          ? _value.navigatorIndex
          : navigatorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token?,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      autoLoginResult: freezed == autoLoginResult
          ? _value.autoLoginResult
          : autoLoginResult // ignore: cast_nullable_to_non_nullable
              as bool?,
      selectedProfile: freezed == selectedProfile
          ? _value.selectedProfile
          : selectedProfile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0)
class _$AppStateDataImpl extends _AppStateData {
  _$AppStateDataImpl(
      {@HiveField(0) this.navigatorIndex = 0,
      @HiveField(1) this.token,
      @HiveField(2) this.theme = "system",
      @HiveField(3) this.autoLoginResult,
      @HiveField(4) this.selectedProfile})
      : super._();

  @override
  @JsonKey()
  @HiveField(0)
  final int navigatorIndex;
  @override
  @HiveField(1)
  final Token? token;
  @override
  @JsonKey()
  @HiveField(2)
  final String theme;
  @override
  @HiveField(3)
  final bool? autoLoginResult;
  @override
  @HiveField(4)
  final String? selectedProfile;

  @override
  String toString() {
    return 'AppStateData(navigatorIndex: $navigatorIndex, token: $token, theme: $theme, autoLoginResult: $autoLoginResult, selectedProfile: $selectedProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateDataImpl &&
            (identical(other.navigatorIndex, navigatorIndex) ||
                other.navigatorIndex == navigatorIndex) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.autoLoginResult, autoLoginResult) ||
                other.autoLoginResult == autoLoginResult) &&
            (identical(other.selectedProfile, selectedProfile) ||
                other.selectedProfile == selectedProfile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, navigatorIndex, token, theme,
      autoLoginResult, selectedProfile);

  /// Create a copy of AppStateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateDataImplCopyWith<_$AppStateDataImpl> get copyWith =>
      __$$AppStateDataImplCopyWithImpl<_$AppStateDataImpl>(this, _$identity);
}

abstract class _AppStateData extends AppStateData {
  factory _AppStateData(
      {@HiveField(0) final int navigatorIndex,
      @HiveField(1) final Token? token,
      @HiveField(2) final String theme,
      @HiveField(3) final bool? autoLoginResult,
      @HiveField(4) final String? selectedProfile}) = _$AppStateDataImpl;
  _AppStateData._() : super._();

  @override
  @HiveField(0)
  int get navigatorIndex;
  @override
  @HiveField(1)
  Token? get token;
  @override
  @HiveField(2)
  String get theme;
  @override
  @HiveField(3)
  bool? get autoLoginResult;
  @override
  @HiveField(4)
  String? get selectedProfile;

  /// Create a copy of AppStateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateDataImplCopyWith<_$AppStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
