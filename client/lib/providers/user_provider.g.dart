// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDataHash() => r'5665d7ca142facad2638e1f5ce41cf92e2402373';

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
String _$userPointsHash() => r'b020ec0d85f6549b2e2e4c2ee699afdde3e28809';

/// See also [UserPoints].
@ProviderFor(UserPoints)
final userPointsProvider = AutoDisposeAsyncNotifierProvider<UserPoints,
    List<Query$GetUserPointRecords$getUserPointRecords?>>.internal(
  UserPoints.new,
  name: r'userPointsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserPoints = AutoDisposeAsyncNotifier<
    List<Query$GetUserPointRecords$getUserPointRecords?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
