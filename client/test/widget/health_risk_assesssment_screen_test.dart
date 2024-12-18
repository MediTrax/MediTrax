import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditrax/screens/health_risk_entry_screen.dart';
import 'package:meditrax/screens/health_risk_report_screen.dart';
import 'package:meditrax/screens/health_risk_history_screen.dart';
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

  group('HealthRiskEntryScreen Tests', () {
    testWidgets('should display initial screen elements', (tester) async {
      await pumpTestWidget(
        tester,
        child: const HealthRiskEntryScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Verify initial screen content
      expect(find.text('健康评估'), findsOneWidget);
      expect(find.text('定期进行健康评估，及时了解您的健康状况'), findsOneWidget);
      expect(find.text('开始新的评估'), findsOneWidget);
      expect(find.text('查看历史评估'), findsOneWidget);
    });

    testWidgets('should navigate to assessment screen', (tester) async {
      await pumpTestWidget(
        tester,
        child: const HealthRiskEntryScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('开始新的评估'));
      await tester.pumpAndSettle();

      expect(find.byType(HealthRiskEntryScreen), findsNothing);
    });

    testWidgets('should navigate to history screen', (tester) async {
      await pumpTestWidget(
        tester,
        child: const HealthRiskEntryScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('查看历史评估'));
      await tester.pumpAndSettle();

      expect(find.byType(HealthRiskHistoryScreen), findsOneWidget);
    });
  });

  group('HealthRiskReportScreen Tests', () {
    testWidgets('should display loading state', (tester) async {
      await pumpTestWidget(
        tester,
        child: const HealthRiskReportScreen(),
        overrides: getMockProviders(),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  group('HealthRiskHistoryScreen Tests', () {
    testWidgets('should display loading state initially', (tester) async {
      await pumpTestWidget(
        tester,
        child: const HealthRiskHistoryScreen(),
        overrides: getMockProviders(),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should handle refresh action', (tester) async {
      await pumpTestWidget(
        tester,
        child: const HealthRiskHistoryScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      await tester.drag(find.byType(RefreshIndicator), const Offset(0, 300));
      await tester.pumpAndSettle();

      expect(find.byType(RefreshIndicator), findsOneWidget);
    });
  });
}
