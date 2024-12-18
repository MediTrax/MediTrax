import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditrax/screens/medicine_inventory_screen.dart';
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

  group('MedicineInventoryScreen Tests', () {
    testWidgets('should display initial tabs correctly', (tester) async {
      await pumpTestWidget(
        tester,
        child: const MedicineInventoryScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Verify initial tabs
      expect(find.text('药品库存'), findsOneWidget);
      expect(find.text('添加药品'), findsOneWidget);
      expect(find.text('服药提醒'), findsOneWidget);
    });

    testWidgets('should show inventory tab content', (tester) async {
      await pumpTestWidget(
        tester,
        child: const MedicineInventoryScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Verify inventory tab content
      expect(find.text('药品管理'), findsOneWidget);
      expect(find.widgetWithIcon(FilledButton, Icons.add), findsOneWidget);
    });

    testWidgets('should show add medicine tab content', (tester) async {
      await pumpTestWidget(
        tester,
        child: const MedicineInventoryScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Navigate to add medicine tab
      await tester.tap(find.text('添加药品'));
      await tester.pumpAndSettle();

      // Verify add medicine form fields
      expect(find.widgetWithText(TextFormField, '输入药品名称'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, '输入剂量数值'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, '输入库存数量'), findsOneWidget);
    });

    testWidgets('should show reminder tab content', (tester) async {
      await pumpTestWidget(
        tester,
        child: const MedicineInventoryScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Navigate to reminder tab
      await tester.tap(find.text('服药提醒'));
      await tester.pumpAndSettle();

      // Verify reminder tab content
      expect(find.text('服药提醒'), findsOneWidget);
      expect(find.widgetWithText(FilledButton, '添加提醒'), findsOneWidget);
    });

    testWidgets('should handle empty inventory state', (tester) async {
      await pumpTestWidget(
        tester,
        child: const MedicineInventoryScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Verify empty state message
      expect(find.text('暂无药品，请添加'), findsOneWidget);
    });

    testWidgets('should handle empty reminder state', (tester) async {
      await pumpTestWidget(
        tester,
        child: const MedicineInventoryScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Navigate to reminder tab
      await tester.tap(find.text('服药提醒'));
      await tester.pumpAndSettle();

      // Verify empty state message
      expect(find.text('暂无提醒'), findsOneWidget);
    });

    testWidgets('should validate add medicine form', (tester) async {
      await pumpTestWidget(
        tester,
        child: const MedicineInventoryScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Navigate to add medicine tab
      await tester.tap(find.text('添加药品'));
      await tester.pumpAndSettle();

      // Try to submit empty form
      await tester.tap(find.widgetWithText(FilledButton, '保存'));
      await tester.pumpAndSettle();

      // Verify validation messages
      expect(find.text('请输入药品名称'), findsOneWidget);
      expect(find.text('请输入剂量'), findsOneWidget);
      expect(find.text('请输入单位'), findsOneWidget);
      expect(find.text('请输入库存数量'), findsOneWidget);
    });

    testWidgets('should handle refresh action', (tester) async {
      await pumpTestWidget(
        tester,
        child: const MedicineInventoryScreen(),
        overrides: getMockProviders(),
      );
      await tester.pumpAndSettle();

      // Pull to refresh
      await tester.drag(find.byType(RefreshIndicator), const Offset(0, 300));
      await tester.pumpAndSettle();

      expect(find.byType(RefreshIndicator), findsOneWidget);
    });
  });
}
