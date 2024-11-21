import 'package:meditrax/models/achievement_badge.dart';
import 'package:meditrax/models/family_member.dart';
import 'package:meditrax/models/user.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/user.graphql.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
class UserData extends _$UserData {
  @override
  FutureOr<User?> build() async {
    // Return null if not authenticated
    if (!ref.read(appStateProvider).isAuth) {
      return null;
    }
    return _fetchCurrentUser();
  }

  Future<User?> _fetchCurrentUser() async {
    final result = await ref.read(graphQLServiceProvider).query$GetUser(
          Options$Query$GetUser(),
        );

    if (result.hasException) {
      throw result.exception!;
    }

    if (result.data == null) {
      return null;
    }

    final userData = result.parsedData!.getUser!;

    return User(
      id: userData.userId,
      phoneNumber: userData.phoneNumber,
      name: userData.name,
      password: '', // We don't store password in state
      role: userData.role,
      status: 1,
      created_at: userData.createdAt,
      updated_at: DateTime.now(),
      last_login: userData.lastLogin ?? DateTime.now(),
    );
  }

  Future<void> updateUser({
    String? name,
    String? phoneNumber,
    String? password,
  }) async {
    final result = await ref.read(graphQLServiceProvider).mutate$UpdateUser(
          Options$Mutation$UpdateUser(
            variables: Variables$Mutation$UpdateUser(
              name: name,
              phoneNumber: phoneNumber,
              password: password,
            ),
          ),
        );

    if (result.hasException) {
      throw result.exception!;
    }

    // Refresh the user data
    ref.invalidateSelf();
  }

  Future<void> deleteUser() async {
    final result = await ref.read(graphQLServiceProvider).mutate$DeleteUser(
          Options$Mutation$DeleteUser(),
        );

    if (result.hasException) {
      throw result.exception!;
    }

    // Logout after successful deletion
    await ref.read(appStateProvider.notifier).logout();
  }

  Future<void> requestPasswordReset(String phoneNumber) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$RequestPasswordReset(
              Options$Mutation$RequestPasswordReset(
                variables: Variables$Mutation$RequestPasswordReset(
                  phoneNumber: phoneNumber,
                ),
              ),
            );

    if (result.hasException) {
      throw result.exception!;
    }
  }

  Future<void> resetPassword(String token, String newPassword) async {
    final result = await ref.read(graphQLServiceProvider).mutate$ResetPassword(
          Options$Mutation$ResetPassword(
            variables: Variables$Mutation$ResetPassword(
              token: token,
              newPassword: newPassword,
            ),
          ),
        );

    if (result.hasException) {
      throw result.exception!;
    }
  }
}

@riverpod
class FamilyMembers extends _$FamilyMembers {
  @override
  Future<List<FamilyMember>> build() async {
    final result =
        await ref.read(graphQLServiceProvider).query$GetFamilyMembers(
              Options$Query$GetFamilyMembers(),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    return result.parsedData!.getFamilyMembers!
        .map((member) => FamilyMember(
              id: member!.memberId,
              userId: ref.read(appStateProvider).token!.user,
              relatedUserId: member.relatedUserId,
              relationship: member.relationship,
              accessLevel: (member.accessLevel),
              createdAt: DateTime.now(),
            ))
        .toList();
  }

  Future<void> addMember({
    required String relatedUserId,
    required String relationship,
    required String accessLevel,
  }) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$AddFamilyMember(
              Options$Mutation$AddFamilyMember(
                variables: Variables$Mutation$AddFamilyMember(
                  relatedUserId: relatedUserId,
                  relationship: relationship,
                  accessLevel: accessLevel,
                ),
              ),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    ref.invalidateSelf();
  }

  Future<void> updateMember({
    required String memberId,
    String? relationship,
    String? accessLevel,
  }) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$UpdateFamilyMember(
              Options$Mutation$UpdateFamilyMember(
                variables: Variables$Mutation$UpdateFamilyMember(
                  memberId: memberId,
                  relationship: relationship,
                  accessLevel: accessLevel,
                ),
              ),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    ref.invalidateSelf();
  }

  Future<void> deleteMember(String memberId) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$DeleteFamilyMember(
              Options$Mutation$DeleteFamilyMember(
                variables: Variables$Mutation$DeleteFamilyMember(
                  memberId: memberId,
                ),
              ),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    ref.invalidateSelf();
  }
}

@riverpod
class Achievements extends _$Achievements {
  @override
  Future<List<AchievementBadge>> build() async {
    final result =
        await ref.read(graphQLServiceProvider).query$GetUserAchievements(
              Options$Query$GetUserAchievements(),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    return result.parsedData!.getUserAchievements!
        .map((achievement) => AchievementBadge(
              id: achievement!.badgeId,
              name: 'TODO', // These fields need to be added to the schema
              description: '',
              iconUrl: '',
              createdAt: achievement.earnedAt,
            ))
        .toList();
  }
}

@riverpod
class UserPoints extends _$UserPoints {
  @override
  Future<Map<String, dynamic>> build() async {
    // TODO: Add GraphQL query for points data
    // For now returning mock data
    return {
      'currentPoints': 750,
      'nextLevelPoints': 1000,
      'currentLevel': 3,
      'nextLevel': 4,
      'dailyTasks': [
        {
          'task': '按时服用早间药物~',
          'points': 10,
          'completed': false,
        },
        {
          'task': '记录今日血压~',
          'points': 15,
          'completed': false,
        },
        {
          'task': '完成15分钟步行~',
          'points': 20,
          'completed': false,
        },
      ],
    };
  }
}
