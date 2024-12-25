import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/models/achievement_badge.dart';
import 'package:meditrax/models/user.dart';
import 'package:meditrax/providers/user.graphql.dart';
import 'package:meditrax/providers/user_provider.dart';

class UserTest extends UserData {
  @override
  FutureOr<User?> build() {
    return User(
      id: "test_id",
      name: "test_name",
      phoneNumber: "1234567890",
      password: "",
      role: "USER",
      status: 1,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lastLogin: DateTime.now(),
    );
  }

  @override
  Future<void> updateUser({
    String? name,
    String? phoneNumber,
    String? password,
  }) async {
    // Simulate successful update
    state = AsyncData(User(
      id: "test_id",
      name: name ?? state.value!.name,
      phoneNumber: phoneNumber ?? state.value!.phoneNumber,
      password: password ?? state.value!.password,
      role: state.value!.role,
      status: state.value!.status,
      createdAt: state.value!.createdAt,
      updatedAt: DateTime.now(),
      lastLogin: state.value!.lastLogin,
    ));
  }

  @override
  Future<void> deleteUser() async {
    // Simulate successful deletion
    state = const AsyncData(null);
  }

  @override
  Future<void> requestPasswordReset(String phoneNumber) async {
    // Simulate successful password reset request
    return;
  }

  @override
  Future<void> resetPassword(String token, String newPassword) async {
    // Simulate successful password reset
    return;
  }
}

class AchievementsTest extends Achievements {
  @override
  Future<List<AchievementBadge>> build() async {
    return [
      AchievementBadge(
        id: '1',
        name: '首次登录',
        description: '首次成功登录系统',
        iconUrl: 'https://example.com/achievement1.png',
        createdAt: DateTime.now(),
      ),
    ];
  }
}

class UserPointsTest extends UserPoints {
  @override
  Future<List<Query$GetUserPointRecords$getUserPointRecords?>> build() async {
    return [
      Query$GetUserPointRecords$getUserPointRecords(
        recordId: '1',
        pointsEarned: 100,
        reason: 'user activity',
        earnedAt: DateTime.now(),
      ),
    ];
  }
}
