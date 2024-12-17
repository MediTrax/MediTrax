import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meditrax/models/achievement_badge.dart';
import 'package:meditrax/models/app_state.dart';
import 'package:meditrax/models/diet_plan.dart';
import 'package:meditrax/models/family_member.dart';
import 'package:meditrax/models/health_metric.dart';
import 'package:meditrax/models/health_risk_assessment.dart';
import 'package:meditrax/models/medical_record.dart';
import 'package:meditrax/models/medication.dart';
import 'package:meditrax/models/medication_reminder.dart';
import 'package:meditrax/models/token.dart';
import 'package:meditrax/models/treatment_schedule.dart';
import 'package:meditrax/models/user.dart';
import 'package:meditrax/models/user_achievement.dart';
import 'package:meditrax/screens/profile.dart';
import 'package:meditrax/screens/profile_sharing_screen.dart';
import 'package:meditrax/screens/splash_screen.dart';

// Import all screens
import 'screens/home_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/ai_helper_screen.dart';
import 'screens/diet_management_screen.dart';
import 'screens/health_risk_entry_screen.dart';
import 'screens/health_risk_report_screen.dart';
import 'screens/medical_records_screen.dart';
import 'screens/medicine_inventory_screen.dart';
import 'screens/prescription_management_screen.dart';
import 'screens/rewards_screen.dart';
import 'screens/treatment_monitoring_screen.dart';
import 'screens/profile_sharing_screen.dart';
import 'providers/app_state.dart';
import 'widgets/bottom_nav_bar.dart';
import 'services/notification_service.dart';

// Add this provider at the top level
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize notifications through the provider
    final notificationService = NotificationService();
    if (notificationService.isSupported) {
      await notificationService.initialize();
    }

    await Hive.initFlutter();
    Hive.registerAdapter(AppStateDataImplAdapter());
    Hive.registerAdapter(TokenAdapter());
    Hive.registerAdapter(UserImplAdapter());
    Hive.registerAdapter(HealthRiskAssessmentImplAdapter());
    Hive.registerAdapter(MedicationImplAdapter());
    Hive.registerAdapter(MedicationReminderImplAdapter());
    Hive.registerAdapter(TreatmentScheduleImplAdapter());
    Hive.registerAdapter(HealthMetricImplAdapter());
    Hive.registerAdapter(DietPlanImplAdapter());
    Hive.registerAdapter(MedicalRecordImplAdapter());
    Hive.registerAdapter(FamilyMemberImplAdapter());
    Hive.registerAdapter(AchievementBadgeImplAdapter());
    Hive.registerAdapter(UserAchievementImplAdapter());
    await Hive.openBox<AppStateData>('appState');

    runApp(
      ProviderScope(
        overrides: [
          // Provide the initialized notification service
          notificationServiceProvider.overrideWithValue(notificationService),
        ],
        child: const MyApp(),
      ),
    );
  } catch (e) {
    debugPrint('Initialization error: $e');
    runApp(const ProviderScope(child: MyApp()));
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    refreshListenable: router,
    redirect: router.redirect,
    routes: router.routes,
    debugLogDiagnostics: true,
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  late AppStateData _appState;

  RouterNotifier(this._ref) {
    _appState = _ref.read(appStateProvider);
    _ref.listen(appStateProvider, (_, next) {
      _appState = next;
      print("appState changed");
      print(_appState.autoLoginResult);
      notifyListeners();
    });
  }

  String? redirect(BuildContext context, GoRouterState state) {
    final isAuth = _appState.token != null;

    if (!isAuth) {
      return '/auth';
    }

    if (_appState.autoLoginResult == null) {
      print("autoLoginResult is null");
      return '/splash';
    } else if (state.matchedLocation == '/splash') {
      return '/';
    }

    if (isAuth && state.matchedLocation == '/auth') {
      return '/';
    }

    return null;
  }

  // Helper method to determine current index based on path
  int _getCurrentIndex(String location) {
    // Use startsWith to handle sub-routes
    if (location.startsWith('/treatment')) {
      return 0;
    } else if (location.startsWith('/medicine-inventory')) {
      return 1;
    } else if (location == '/') {
      return 2;
    } else if (location.startsWith('/medical-records')) {
      return 3;
    } else if (location.startsWith('/profile') ||
        location.startsWith('/profile-sharing')) {
      return 4;
    }
    // Check if the route is a sub-route of any main routes
    else if (location.startsWith('/ai-helper') ||
        location.startsWith('/diet-management') ||
        location.startsWith('/family-collaboration') ||
        location.startsWith('/health-risk-assessment') ||
        location.startsWith('/health-risk-report') ||
        location.startsWith('/prescription-management') ||
        location.startsWith('/rewards')) {
      return 2; // These are accessed from home, so keep home selected
    }
    return 2; // Default to home
  }

  List<RouteBase> get routes => [
        GoRoute(
          path: '/auth',
          builder: (context, state) => const AuthScreen(),
        ),
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) {
            final currentIndex = _getCurrentIndex(state.matchedLocation);

            return Scaffold(
              body: child,
              bottomNavigationBar: BottomNavBar(
                currentIndex: currentIndex,
              ),
            );
          },
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
            ),
            GoRoute(
              path: '/treatment',
              builder: (context, state) => const TreatmentMonitoringScreen(),
            ),
            GoRoute(
              path: '/medicine-inventory',
              builder: (context, state) => const MedicineInventoryScreen(),
            ),
            GoRoute(
              path: '/medical-records',
              builder: (context, state) => const MedicalRecordsScreen(),
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
            // Feature routes
            GoRoute(
              path: '/ai-helper',
              builder: (context, state) => const AiHelperScreen(),
            ),
            GoRoute(
              path: '/diet-management',
              builder: (context, state) => const DietManagementScreen(),
            ),
            GoRoute(
              path: '/profile-sharing',
              builder: (context, state) => const ProfileSharingScreen(),
            ),
            GoRoute(
              path: '/health-risk-assessment',
              builder: (context, state) => const HealthRiskEntryScreen(),
            ),
            GoRoute(
              path: '/health-risk-report',
              builder: (context, state) => const HealthRiskReportScreen(),
            ),
            GoRoute(
              path: '/prescription-management',
              builder: (context, state) => const PrescriptionManagementScreen(),
            ),
            GoRoute(
              path: '/rewards',
              builder: (context, state) => const RewardsScreen(),
            ),
          ],
        ),
      ];
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Health Care App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
