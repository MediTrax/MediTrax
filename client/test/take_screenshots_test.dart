import 'dart:io';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:meditrax/main.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/app_state_test.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/graphql_test.dart';
import 'package:meditrax/providers/health_metrics_provider.dart';
import 'package:meditrax/providers/health_metrics_provider_test.dart';
import 'package:meditrax/providers/medical_records_provider.dart';
import 'package:meditrax/providers/medical_records_test.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:meditrax/providers/user_test.dart';

final testDevices = [
  const Device(
    name: "Screen_Android",
    size: Size(369, 656),
    textScale: 1,
    devicePixelRatio: 1,
  ),
  const Device(
    name: "Screen_AndroidTablet7Inch",
    size: Size(603, 1072),
    textScale: 1,
    devicePixelRatio: 1,
  ),
  const Device(
    name: "Screen_AndroidTablet10Inch",
    size: Size(1080, 1920),
    textScale: 1,
    devicePixelRatio: 1,
  ),
  const Device(
    name: "Screen_IpadPro13Inch",
    size: Size(2064 / 2, 2752 / 2),
    textScale: 2,
    devicePixelRatio: 2,
  ),
  const Device(
    name: "Screen_Iphone6Inch9",
    size: Size(1320 / 2, 2868 / 2),
    textScale: 2,
    devicePixelRatio: 2,
  ),
];

void main() async {
  group('take-screenshots', () {
    testGoldens('Take Screenshots Light', (tester) async {
      final AppState appState = AppStateTest();
      final widget = ProviderScope(
        overrides: [
          appStateProvider.overrideWith(() => appState),
          graphQLServiceProvider.overrideWith(() => GraphQLTest()),
          healthMetricsProvider.overrideWith(() => HealthMetricsTest()),
          medicalRecordsProvider.overrideWith(() => MedicalRecordsTest()),
          userDataProvider.overrideWith(() => UserTest()),
        ],
        child: const MyApp(),
      );
      await tester.pumpWidgetBuilder(widget);
      appState.changeTheme("light");
      await multiScreenGolden(
        tester,
        "Login_Light",
        customPump: (WidgetTester tester) async {
          await tester.pump(const Duration(seconds: 1));
        },
        devices: testDevices,
      );
      await appState.loginWithPhoneNumberPassword(
          "1234567890", "password", "token");
      await multiScreenGolden(
        tester,
        "Home_Light",
        customPump: (WidgetTester tester) async {
          await tester.pump(const Duration(seconds: 1));
        },
        devices: testDevices,
      );
      appState.changeNavigatorIndex(0);
      await multiScreenGolden(
        tester,
        "TreatmentMonitoring_Light",
        customPump: (WidgetTester tester) async {
          await tester.pump(const Duration(seconds: 1));
        },
        devices: testDevices,
      );
      appState.changeNavigatorIndex(1);
      await multiScreenGolden(
        tester,
        "Medication_Light",
        customPump: (WidgetTester tester) async {
          await tester.pump(const Duration(seconds: 1));
        },
        devices: testDevices,
      );
      appState.changeNavigatorIndex(3);
      await multiScreenGolden(
        tester,
        "MedicalRecords_Light",
        customPump: (WidgetTester tester) async {
          await tester.pump(const Duration(seconds: 1));
        },
        devices: testDevices,
      );
      appState.changeNavigatorIndex(4);
      await multiScreenGolden(
        tester,
        "Profile_Light",
        customPump: (WidgetTester tester) async {
          await tester.pump(const Duration(seconds: 1));
        },
        devices: testDevices,
      );
      // await renameImages();
    });
  });
  // await renameImages(true);
  // await renameImages();
}

final screenNames = ["Home", "Utilities", "StressFree", "Feeds", "Account"];

Future<void> renameImages([bool useDark = false]) async {
  int count = 0;
  for (final screenName in screenNames) {
    final phoneScreenFile = File(
        "test/goldens/${screenName}_${useDark ? 'Dark' : 'Light'}.Screen_Android.png");
    String newPath =
        "android/fastlane/metadata/android/en-GB/images/phoneScreenshots/${count + 1}_en-GB.png";
    await phoneScreenFile.copy(newPath);

    final sevenInchScreenFile = File(
        "test/goldens/${screenName}_${useDark ? 'Dark' : 'Light'}.Screen_AndroidTablet7Inch.png");
    newPath =
        "android/fastlane/metadata/android/en-GB/images/sevenInchScreenshots/${count + 1}_en-GB.png";
    await sevenInchScreenFile.copy(newPath);

    final tenInchScreenFile = File(
        "test/goldens/${screenName}_${useDark ? 'Dark' : 'Light'}.Screen_AndroidTablet10Inch.png");
    newPath =
        "android/fastlane/metadata/android/en-GB/images/tenInchScreenshots/${count + 1}_en-GB.png";
    await tenInchScreenFile.copy(newPath);

    final iphone67ScreenFile = File(
        "test/goldens/${screenName}_${useDark ? 'Dark' : 'Light'}.Screen_Iphone6Inch7.png");
    newPath =
        "ios/fastlane/screenshots/en-US/${count}_APP_IPHONE_67_$count.png";
    await iphone67ScreenFile.copy(newPath);

    final iphone55ScreenFile = File(
        "test/goldens/${screenName}_${useDark ? 'Dark' : 'Light'}.Screen_Iphone5Inch5.png");
    newPath =
        "ios/fastlane/screenshots/en-US/${count}_APP_IPHONE_55_$count.png";
    await iphone55ScreenFile.copy(newPath);

    final ipadpro6genScreenFile = File(
        "test/goldens/${screenName}_${useDark ? 'Dark' : 'Light'}.Screen_IpadPro6thGen.png");
    newPath =
        "ios/fastlane/screenshots/en-US/${count}_APP_IPAD_PRO_129_$count.png";
    await ipadpro6genScreenFile.copy(newPath);

    final ipadpro2genScreenFile = File(
        "test/goldens/${screenName}_${useDark ? 'Dark' : 'Light'}.Screen_IpadPro2ndGen.png");
    newPath =
        "ios/fastlane/screenshots/en-US/${count}_APP_IPAD_PRO_3GEN_129_$count.png";
    await ipadpro2genScreenFile.copy(newPath);
    count++;
  }
}
