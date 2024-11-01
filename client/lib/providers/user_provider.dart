import 'package:meditrax/models/achievement_badge.dart';
import 'package:meditrax/models/family_member.dart';
import 'package:meditrax/models/user.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/user.graphql.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
class UserProvider extends _$UserProvider {
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
          Options$Query$GetUser(
            variables: Variables$Query$GetUser(
              userId: ref.read(appStateProvider).token!.user,
            ),
          ),
        );

    if (result.hasException) {
      throw result.exception!;
    }

    if (result.data == null || result.data!.user == null) {
      return null;
    }

    final userData = result.data!.user;

    return User(
      id: userData.userId,
      email: userData.email,
      name: userData.name,
      password: '', // We don't store password in state
      role: userData.role,
      status: 1, // You might want to add status to your GraphQL schema
      createdAt: userData.createdAt,
      updatedAt:
          DateTime.now(), // You might want to add updatedAt to your schema
      lastLogin: userData.lastLogin ?? DateTime.now(),
    );
  }

  Future<void> updateUser({
    String? name,
    String? email,
    String? password,
  }) async {
    final result = await ref.read(graphQLServiceProvider).mutate$UpdateUser(
          Options$Mutation$UpdateUser(
            variables: Variables$Mutation$UpdateUser(
              userId: ref.read(appStateProvider).token!.user,
              name: name,
              email: email,
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
          Options$Mutation$DeleteUser(
            variables: Variables$Mutation$DeleteUser(
              userId: ref.read(appStateProvider).token!.user,
            ),
          ),
        );

    if (result.hasException) {
      throw result.exception!;
    }

    // Logout after successful deletion
    await ref.read(appStateProvider.notifier).logout();
  }

  Future<void> requestPasswordReset(String email) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$RequestPasswordReset(
              Options$Mutation$RequestPasswordReset(
                variables: Variables$Mutation$RequestPasswordReset(
                  email: email,
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

  // Family Member Methods
  Future<List<FamilyMember>> getFamilyMembers() async {
    final result = await ref.read(graphQLServiceProvider).query$GetFamilyMembers(
          Options$Query$GetFamilyMembers(
            variables: Variables$Query$GetFamilyMembers(
              userId: ref.read(appStateProvider).token!.user,
            ),
          ),
        );

    if (result.hasException) {
      throw result.exception!;
    }

    return result.parsedData!.familyMembers.map((member) => FamilyMember(
          id: member.memberId,
          userId: ref.read(appStateProvider).token!.user,
          relatedUserId: member.relatedUserId,
          relationship: member.relationship,
          accessLevel: int.parse(member.accessLevel),
          createdAt: DateTime.now(), // Add to schema if needed
        )).toList();
  }

  Future<void> addFamilyMember({
    required String relatedUserId,
    required String relationship,
    required String accessLevel,
  }) async {
    final result = await ref.read(graphQLServiceProvider).mutate$AddFamilyMember(
          Options$Mutation$AddFamilyMember(
            variables: Variables$Mutation$AddFamilyMember(
              userId: ref.read(appStateProvider).token!.user,
              relatedUserId: relatedUserId,
              relationship: relationship,
              accessLevel: accessLevel,
            ),
          ),
        );

    if (result.hasException) {
      throw result.exception!;
    }
  }

  Future<void> updateFamilyMember({
    required String memberId,
    String? relationship,
    String? accessLevel,
  }) async {
    final result = await ref.read(graphQLServiceProvider).mutate$UpdateFamilyMember(
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
  }

  Future<void> deleteFamilyMember(String memberId) async {
    final result = await ref.read(graphQLServiceProvider).mutate$DeleteFamilyMember(
          Options$Mutation$DeleteFamilyMember(
            variables: Variables$Mutation$DeleteFamilyMember(
              memberId: memberId,
            ),
          ),
        );

    if (result.hasException) {
      throw result.exception!;
    }
  }

  // Achievement Methods
  Future<List<AchievementBadge>> getUserAchievements() async {
    final result = await ref.read(graphQLServiceProvider).query$GetUserAchievements(
          Options$Query$GetUserAchievements(
            variables: Variables$Query$GetUserAchievements(
              userId: ref.read(appStateProvider).token!.user,
            ),
          ),
        );

    if (result.hasException) {
      throw result.exception!;
    }

    return result.parsedData!.userAchievements.map((achievement) => AchievementBadge(
          id: achievement.badgeId,
          name: '', // These fields need to be added to the schema
          description: '',
          iconUrl: '',
          createdAt: achievement.earnedAt,
        )).toList();
  }
}
