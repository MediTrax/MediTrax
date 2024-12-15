// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DietPlan {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  String get mealType => throw _privateConstructorUsedError;
  @HiveField(3)
  List<String> get foodItems => throw _privateConstructorUsedError;
  @HiveField(4)
  int get calories => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of DietPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DietPlanCopyWith<DietPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DietPlanCopyWith<$Res> {
  factory $DietPlanCopyWith(DietPlan value, $Res Function(DietPlan) then) =
      _$DietPlanCopyWithImpl<$Res, DietPlan>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) String mealType,
      @HiveField(3) List<String> foodItems,
      @HiveField(4) int calories,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) DateTime updatedAt});
}

/// @nodoc
class _$DietPlanCopyWithImpl<$Res, $Val extends DietPlan>
    implements $DietPlanCopyWith<$Res> {
  _$DietPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DietPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? mealType = null,
    Object? foodItems = null,
    Object? calories = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String,
      foodItems: null == foodItems
          ? _value.foodItems
          : foodItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DietPlanImplCopyWith<$Res>
    implements $DietPlanCopyWith<$Res> {
  factory _$$DietPlanImplCopyWith(
          _$DietPlanImpl value, $Res Function(_$DietPlanImpl) then) =
      __$$DietPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) String mealType,
      @HiveField(3) List<String> foodItems,
      @HiveField(4) int calories,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) DateTime updatedAt});
}

/// @nodoc
class __$$DietPlanImplCopyWithImpl<$Res>
    extends _$DietPlanCopyWithImpl<$Res, _$DietPlanImpl>
    implements _$$DietPlanImplCopyWith<$Res> {
  __$$DietPlanImplCopyWithImpl(
      _$DietPlanImpl _value, $Res Function(_$DietPlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? mealType = null,
    Object? foodItems = null,
    Object? calories = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DietPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String,
      foodItems: null == foodItems
          ? _value._foodItems
          : foodItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 8)
class _$DietPlanImpl extends _DietPlan {
  _$DietPlanImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.userId,
      @HiveField(2) required this.mealType,
      @HiveField(3) required final List<String> foodItems,
      @HiveField(4) required this.calories,
      @HiveField(5) required this.createdAt,
      @HiveField(6) required this.updatedAt})
      : _foodItems = foodItems,
        super._();

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String userId;
  @override
  @HiveField(2)
  final String mealType;
  final List<String> _foodItems;
  @override
  @HiveField(3)
  List<String> get foodItems {
    if (_foodItems is EqualUnmodifiableListView) return _foodItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodItems);
  }

  @override
  @HiveField(4)
  final int calories;
  @override
  @HiveField(5)
  final DateTime createdAt;
  @override
  @HiveField(6)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DietPlan(id: $id, userId: $userId, mealType: $mealType, foodItems: $foodItems, calories: $calories, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DietPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType) &&
            const DeepCollectionEquality()
                .equals(other._foodItems, _foodItems) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      mealType,
      const DeepCollectionEquality().hash(_foodItems),
      calories,
      createdAt,
      updatedAt);

  /// Create a copy of DietPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DietPlanImplCopyWith<_$DietPlanImpl> get copyWith =>
      __$$DietPlanImplCopyWithImpl<_$DietPlanImpl>(this, _$identity);
}

abstract class _DietPlan extends DietPlan {
  factory _DietPlan(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String userId,
      @HiveField(2) required final String mealType,
      @HiveField(3) required final List<String> foodItems,
      @HiveField(4) required final int calories,
      @HiveField(5) required final DateTime createdAt,
      @HiveField(6) required final DateTime updatedAt}) = _$DietPlanImpl;
  _DietPlan._() : super._();

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get userId;
  @override
  @HiveField(2)
  String get mealType;
  @override
  @HiveField(3)
  List<String> get foodItems;
  @override
  @HiveField(4)
  int get calories;
  @override
  @HiveField(5)
  DateTime get createdAt;
  @override
  @HiveField(6)
  DateTime get updatedAt;

  /// Create a copy of DietPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DietPlanImplCopyWith<_$DietPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
