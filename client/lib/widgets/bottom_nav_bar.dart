import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            context.go('/treatment');  // Changed from '/appointments'
            break;
          case 1:
            context.go('/medicine-inventory');
            break;
          case 2:
            context.go('/');  // Changed from '/home'
            break;
          case 3:
            context.go('/medical-records');
            break;
          case 4:
            context.go('/profile');
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
