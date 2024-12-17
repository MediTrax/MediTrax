import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditrax/screens/auth_screen.dart';
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

  group('AuthScreen Widget Tests', () {
    testWidgets('should display login form by default', (tester) async {
      await pumpTestWidget(
        tester,
        child: const AuthScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Verify initial state shows login form
      expect(find.widgetWithText(ElevatedButton, '登录'), findsOneWidget);
      expect(find.byKey(const Key('phone_field')), findsOneWidget);
      expect(find.byKey(const Key('otp_field')), findsOneWidget);
      expect(find.byKey(const Key('login_button')), findsOneWidget);
    });

    testWidgets('should switch to signup form', (tester) async {
      await pumpTestWidget(
        tester,
        child: const AuthScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Find and tap the signup switch button
      await tester.tap(find.byKey(const Key('switch_to_signup')));
      await tester.pumpAndSettle();

      // Verify signup form is shown
      expect(find.widgetWithText(ElevatedButton, '注册'), findsOneWidget);
      expect(find.byKey(const Key('phone_field')), findsOneWidget);
      expect(find.byKey(const Key('password_field')), findsOneWidget);
      expect(find.byKey(const Key('confirm_password_field')), findsOneWidget);
    });

    // testWidgets('should validate phone number', (tester) async {
    //   await pumpTestWidget(
    //     tester,
    //     child: const AuthScreen(),
    //     overrides: getMockProviders(),
    //   );
    //   await tester.pumpAndSettle();

    //   // Try to submit with empty fields
    //   await tester.tap(find.byKey(const Key('login_button')));
    //   await tester.pumpAndSettle();

    //   // Verify validation message
    //   expect(find.text('请输入有效的手机号码'), findsOneWidget);
    // });
  });
}
