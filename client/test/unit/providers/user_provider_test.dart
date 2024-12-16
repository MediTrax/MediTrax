import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/user_provider.dart';

import '../../helpers/test_helper.dart';

void main() {
  setUpAll(() async {
    await setupTests();
  });

  tearDownAll(() async {
    await tearDownTests();
  });
  group('User Provider Tests', () {
    // late ProviderContainer container;

    // setUp(() {
    //   container = ProviderContainer();
    // });

    // test('initial user data should be null when not authenticated', () async {
    //   final userData = await container.read(userDataProvider.future);
    //   expect(userData, isNull);
    // });

    // test('user points should calculate correctly', () async {
    //   final points = await container.read(userPointsProvider.future);

    //   expect(points, isA<Map<String, dynamic>>());
    //   expect(points['currentPoints'], isA<int>());
    //   expect(points['nextLevelPoints'], isA<int>());
    //   expect(points['currentLevel'], isA<int>());
    //   expect(points['nextLevel'], isA<int>());
    //   expect(points['achievements'], isA<List>());
    // });

    // test('achievements should be loaded correctly', () async {
    //   final achievements = await container.read(achievementsProvider.future);

    //   expect(achievements, isA<List>());
    //   if (achievements.isNotEmpty) {
    //     final achievement = achievements.first;
    //     expect(achievement.id, isNotEmpty);
    //     expect(achievement.name, isNotEmpty);
    //     expect(achievement.description, isNotEmpty);
    //     expect(achievement.iconUrl, isNotEmpty);
    //     expect(achievement.createdAt, isA<DateTime>());
    //   }
    // });
  });
}
