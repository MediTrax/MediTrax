import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/app_state.dart';

class BottomNavBar extends ConsumerWidget {
  final int currentIndex;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.read(appStateProvider);
    return NavigationBar(
      selectedIndex: appState.navigatorIndex,
      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            ref.read(appStateProvider.notifier).changeNavigatorIndex(0);
            break;
          case 1:
            ref.read(appStateProvider.notifier).changeNavigatorIndex(1);
            break;
          case 2:
            ref.read(appStateProvider.notifier).changeNavigatorIndex(2);
            break;
          case 3:
            ref.read(appStateProvider.notifier).changeNavigatorIndex(3);
            break;
          case 4:
            ref.read(appStateProvider.notifier).changeNavigatorIndex(4);
            break;
        }
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.calendar_today),
          label: '治疗', // Changed from '预约' to match the new route purpose
        ),
        NavigationDestination(
          icon: Icon(Icons.medication),
          label: '药品',
        ),
        NavigationDestination(
          icon: Icon(Icons.home),
          label: '首页',
        ),
        NavigationDestination(
          icon: Icon(Icons.folder),
          label: '记录',
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          label: '我的',
        ),
      ],
    );
  }
}
