// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDataHash() => r'4674a34cb5edacf8d5651edb0e92276a4e6a028c';

/// See also [UserData].
@ProviderFor(UserData)
final userDataProvider =
    AutoDisposeAsyncNotifierProvider<UserData, User?>.internal(
  UserData.new,
  name: r'userDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserData = AutoDisposeAsyncNotifier<User?>;
String _$familyMembersHash() => r'fa1a7f84b0adf457adf33700e9816932b92d42b5';

/// See also [FamilyMembers].
@ProviderFor(FamilyMembers)
final familyMembersProvider = AutoDisposeAsyncNotifierProvider<FamilyMembers,
    List<FamilyMember>>.internal(
  FamilyMembers.new,
  name: r'familyMembersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$familyMembersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FamilyMembers = AutoDisposeAsyncNotifier<List<FamilyMember>>;
String _$achievementsHash() => r'28a1b2da6c0bfe8dad03657ad52192526b5aa686';

/// See also [Achievements].
@ProviderFor(Achievements)
final achievementsProvider = AutoDisposeAsyncNotifierProvider<Achievements,
    List<AchievementBadge>>.internal(
  Achievements.new,
  name: r'achievementsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$achievementsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Achievements = AutoDisposeAsyncNotifier<List<AchievementBadge>>;
String _$userPointsHash() => r'8e318e03cf541fd8aa5bef661cb5fc899f2c5d6e';

/// See also [UserPoints].
@ProviderFor(UserPoints)
final userPointsProvider =
    AutoDisposeAsyncNotifierProvider<UserPoints, Map<String, dynamic>>.internal(
  UserPoints.new,
  name: r'userPointsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserPoints = AutoDisposeAsyncNotifier<Map<String, dynamic>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
