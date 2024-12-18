import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/app_state_test.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/graphql_test.dart';
import 'package:meditrax/providers/health_metrics_provider.dart';
import 'package:meditrax/providers/health_metrics_provider_test.dart';
import 'package:meditrax/providers/medical_records_provider.dart';
import 'package:meditrax/providers/medical_records_provider_test.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:meditrax/providers/user_test.dart';

List<Override> getMockProviders({bool authenticated = false}) {
  return [
    appStateProvider.overrideWith(() => AppStateTest()),
    graphQLServiceProvider.overrideWith(() => GraphQLTest()),
    healthMetricsProvider.overrideWith(() => HealthMetricsTest()),
    medicalRecordsProvider.overrideWith(() => MedicalRecordsTest()),
    userDataProvider.overrideWith(() => UserTest()),
  ];
}
