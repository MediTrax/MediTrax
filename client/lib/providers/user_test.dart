import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/models/user.dart';
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
      created_at: DateTime.now(),
      updated_at: DateTime.now(),
      last_login: DateTime.now(),
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
      created_at: state.value!.created_at,
      updated_at: DateTime.now(),
      last_login: state.value!.last_login,
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
