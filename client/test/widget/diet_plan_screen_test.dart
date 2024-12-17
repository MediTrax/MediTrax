import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditrax/screens/diet_management_screen.dart';
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

  group('DietManagementScreen Widget Tests', () {
    testWidgets('should display initial tabs correctly', (tester) async {
      await pumpTestWidget(
        tester,
        child: const DietManagementScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Verify initial state shows both tabs
      expect(find.text('膳食推荐'), findsOneWidget);
      expect(find.text('食品安全查询'), findsOneWidget);
    });

    testWidgets('should show recommendation button in first tab', (tester) async {
      await pumpTestWidget(
        tester,
        child: const DietManagementScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Verify recommendation tab content
      expect(find.text('个性化膳食推荐'), findsOneWidget);
      expect(find.text('根据您的健康状况定制的膳食计划'), findsOneWidget);
      expect(find.widgetWithText(FilledButton, '推荐膳食'), findsOneWidget);
    });

    testWidgets('should show search field in second tab', (tester) async {
      await pumpTestWidget(
        tester,
        child: const DietManagementScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Tap on the second tab
      await tester.tap(find.text('食品安全查询'));
      await tester.pumpAndSettle();

      // Verify search tab content
      expect(find.text('食品安全查询'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.widgetWithText(FilledButton, '查询'), findsOneWidget);
    });

    testWidgets('should handle food search', (tester) async {
      await pumpTestWidget(
        tester,
        child: const DietManagementScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Navigate to search tab
      await tester.tap(find.text('食品安全查询'));
      await tester.pumpAndSettle();

      // Enter search text
      await tester.enterText(find.byType(TextField), '苹果');
      await tester.pumpAndSettle();

      // Tap search button
      await tester.tap(find.widgetWithText(FilledButton, '查询'));
      await tester.pumpAndSettle();

      // Verify search is initiated
      expect(find.text('苹果'), findsOneWidget);
    });

    testWidgets('should handle empty search input', (tester) async {
      await pumpTestWidget(
        tester,
        child: const DietManagementScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Navigate to search tab
      await tester.tap(find.text('食品安全查询'));
      await tester.pumpAndSettle();

      // Tap search button without entering text
      await tester.tap(find.widgetWithText(FilledButton, '查询'));
      await tester.pumpAndSettle();

      // Verify empty state message
      expect(find.text('请输入食品名称进行查询'), findsOneWidget);
    });

    testWidgets('should generate food recommendation', (tester) async {
      await pumpTestWidget(
        tester,
        child: const DietManagementScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Find and tap the recommendation button
      await tester.tap(find.widgetWithText(FilledButton, '推荐膳食'));
      await tester.pumpAndSettle();

      // Verify loading state
      expect(find.text('正在生成推荐...'), findsOneWidget);
      
      // Wait for recommendation to load
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify recommendation is shown
      expect(find.text('今日推荐'), findsOneWidget);
    });
  });
}
