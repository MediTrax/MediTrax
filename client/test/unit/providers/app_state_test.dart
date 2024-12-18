import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/app_state.dart';

import '../../helpers/test_helper.dart';

void main() {
  tearDownAll(() async {
    await tearDownTests();
  });

  group('AppState Tests', () {
    late ProviderContainer container;

    setUp(() async {
      await setupTests();
      container = ProviderContainer();
    });

    test('initial state should be correct', () {
      final appState = container.read(appStateProvider);
      expect(appState.navigatorIndex, 0);
      expect(appState.theme, 'system');
      expect(appState.token, null);
      expect(appState.autoLoginResult, null);
    });

    test('changeNavigatorIndex should update state', () {
      final notifier = container.read(appStateProvider.notifier);
      notifier.changeNavigatorIndex(2);

      final state = container.read(appStateProvider);
      expect(state.navigatorIndex, 2);
    });

    test('changeTheme should update theme', () {
      final notifier = container.read(appStateProvider.notifier);
      notifier.changeTheme('dark');

      final state = container.read(appStateProvider);
      expect(state.theme, 'dark');
    });

    test('isAuth should be false when token is null', () {
      final state = container.read(appStateProvider);
      expect(state.isAuth, false);
    });

    test('bearerToken should be empty when token is null', () {
      final state = container.read(appStateProvider);
      expect(state.bearerToken, '');
    });
  });
}
