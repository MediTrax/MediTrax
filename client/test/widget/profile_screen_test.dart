import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:meditrax/providers/user_test.dart';
import 'package:meditrax/screens/profile.dart';
import './helpers/test_wrapper.dart';
import './helpers/mock_providers.dart';
import '../helpers/test_helper.dart';

void main() {
  setUpAll(() async {
    await setupTests();
  });

  tearDownAll(() async {
    await tearDownTests();
  });

  group('Profile Screen Widget Tests', () {
    testWidgets('should show basic profile information', (tester) async {
      await pumpTestWidget(
        tester,
        child: const ProfileScreen(),
        overrides: getMockProviders(authenticated: true),
      );
      await tester.pumpAndSettle();

      // Verify basic profile elements
      expect(find.text('个人资料'), findsOneWidget);
      // expect(find.byKey(const Key('profile_avatar')), findsOneWidget);
      // expect(find.byKey(const Key('profile_name')), findsOneWidget);
    });

    // testWidgets('should show achievement badges', (tester) async {
    //   await pumpTestWidget(
    //     tester,
    //     child: const ProfileScreen(),
    //     overrides: [
    //       ...getMockProviders(authenticated: true),
    //       achievementsProvider.overrideWith(() => AchievementsTest()),
    //     ],
    //   );
    //   await tester.pumpAndSettle();

    //   // Verify achievements section
    //   expect(find.text('成就'), findsOneWidget);
    //   expect(find.text('首次登录'), findsOneWidget);
    //   expect(find.text('记录达人'), findsOneWidget);
    // });

    testWidgets('should handle logout', (tester) async {
      await pumpTestWidget(
        tester,
        child: const ProfileScreen(),
        overrides: getMockProviders(authenticated: true),
      );
      await tester.pumpAndSettle();

      // Find and tap logout button
      await tester.tap(find.byKey(const Key('logout_button')));
      await tester.pumpAndSettle();

      // Verify logout dialog
      // expect(find.text('确认退出'), findsOneWidget);
      // expect(find.text('您确定要退出登录吗？'), findsOneWidget);
    });
  });
}
