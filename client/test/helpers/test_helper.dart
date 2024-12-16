import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
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

/// Setup function to be called in setUpAll for all test files
Future<void> setupTests() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  // Mock path_provider
  const channel = MethodChannel('plugins.flutter.io/path_provider');
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
    if (methodCall.method == 'getTemporaryDirectory') {
      final directory = Directory.systemTemp.createTempSync();
      return directory.path;
    }
    return null;
  });

  // Initialize Hive with temp directory
  final tempDir = Directory.systemTemp.createTempSync();
  Hive.init(tempDir.path);
  if (!Hive.isAdapterRegistered(AppStateDataImplAdapter().typeId)) {
    Hive.registerAdapter(AppStateDataImplAdapter());
  }
  if (!Hive.isAdapterRegistered(TokenAdapter().typeId)) {
    Hive.registerAdapter(TokenAdapter());
  }
  if (!Hive.isAdapterRegistered(UserImplAdapter().typeId)) {
    Hive.registerAdapter(UserImplAdapter());
  }
  if (!Hive.isAdapterRegistered(HealthRiskAssessmentImplAdapter().typeId)) {
    Hive.registerAdapter(HealthRiskAssessmentImplAdapter());
  }
  if (!Hive.isAdapterRegistered(MedicationImplAdapter().typeId)) {
    Hive.registerAdapter(MedicationImplAdapter());
  }
  if (!Hive.isAdapterRegistered(MedicationReminderImplAdapter().typeId)) {
    Hive.registerAdapter(MedicationReminderImplAdapter());
  }
  if (!Hive.isAdapterRegistered(TreatmentScheduleImplAdapter().typeId)) {
    Hive.registerAdapter(TreatmentScheduleImplAdapter());
  }
  if (!Hive.isAdapterRegistered(HealthMetricImplAdapter().typeId)) {
    Hive.registerAdapter(HealthMetricImplAdapter());
  }
  if (!Hive.isAdapterRegistered(DietPlanImplAdapter().typeId)) {
    Hive.registerAdapter(DietPlanImplAdapter());
  }
  if (!Hive.isAdapterRegistered(MedicalRecordImplAdapter().typeId)) {
    Hive.registerAdapter(MedicalRecordImplAdapter());
  }
  if (!Hive.isAdapterRegistered(FamilyMemberImplAdapter().typeId)) {
    Hive.registerAdapter(FamilyMemberImplAdapter());
  }
  if (!Hive.isAdapterRegistered(AchievementBadgeImplAdapter().typeId)) {
    Hive.registerAdapter(AchievementBadgeImplAdapter());
  }
  await Hive.openBox<AppStateData>('appState');
}

/// Shared tearDown function for cleaning up after tests
Future<void> tearDownTests() async {
  await Hive.deleteFromDisk();
}
