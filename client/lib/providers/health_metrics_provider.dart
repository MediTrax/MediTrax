import 'package:meditrax/models/health_metric.dart';
import 'package:meditrax/models/treatment_schedule.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/health_metrics.graphql.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'health_metrics_provider.g.dart';

@riverpod
class HealthMetrics extends _$HealthMetrics {
  @override
  Future<List<HealthMetric>> build() async {
    return _fetchHealthMetrics();
  }

  Future<List<HealthMetric>> _fetchHealthMetrics({
    DateTime? startDate,
    DateTime? endDate,
    String? metricType,
  }) async {
    final patientId = ref.read(appStateProvider).selectedProfile;
    final user = ref.read(userDataProvider).valueOrNull;
    if (patientId == user?.id || patientId == null) {
      final result =
          await ref.read(graphQLServiceProvider).query$GetHealthMetrics(
                Options$Query$GetHealthMetrics(
                  variables: Variables$Query$GetHealthMetrics(
                    startDate: startDate,
                    endDate: endDate,
                    metricType: metricType,
                  ),
                ),
              );

      if (result.hasException) {
        throw result.exception!;
      }

      return (result.parsedData!.getHealthMetrics ?? [])
          .map((metric) => HealthMetric(
                id: metric!.metricId,
                metricType: metric.metricType,
                value: metric.value,
                unit: metric.unit,
                recordedAt: metric.recordedAt,
                createdAt: metric.recordedAt,
              ))
          .toList();
    } else {
      final result =
          await ref.read(graphQLServiceProvider).query$GetSharedHealthMetrics(
                Options$Query$GetSharedHealthMetrics(
                  variables: Variables$Query$GetSharedHealthMetrics(
                    patientId: patientId,
                    startDate: startDate,
                    endDate: endDate,
                    metricType: metricType,
                  ),
                ),
              );

      if (result.hasException) {
        throw result.exception!;
      }

      return (result.parsedData!.getSharedHealthMetrics ?? [])
          .map((metric) => HealthMetric(
                id: metric!.metricId,
                metricType: metric.metricType,
                value: metric.value,
                unit: metric.unit,
                recordedAt: metric.recordedAt,
                createdAt: metric.recordedAt,
              ))
          .toList();
    }
  }

  Future<void> addMetric({
    required String metricType,
    required double value,
    required String unit,
    required DateTime recordedAt,
  }) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$AddHealthMetric(
              Options$Mutation$AddHealthMetric(
                variables: Variables$Mutation$AddHealthMetric(
                  metricType: metricType,
                  value: value,
                  unit: unit,
                  recordedAt: recordedAt.toIso8601String(),
                ),
              ),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    ref.invalidateSelf();
  }

  Future<void> updateMetric({
    required String metricId,
    double? value,
    String? unit,
  }) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$UpdateHealthMetric(
              Options$Mutation$UpdateHealthMetric(
                variables: Variables$Mutation$UpdateHealthMetric(
                  metricId: metricId,
                  value: value,
                  unit: unit,
                ),
              ),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    ref.invalidateSelf();
  }

  Future<void> deleteMetric(String metricId) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$DeleteHealthMetric(
              Options$Mutation$DeleteHealthMetric(
                variables: Variables$Mutation$DeleteHealthMetric(
                  metricId: metricId,
                ),
              ),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    ref.invalidateSelf();
  }
}

@riverpod
class TreatmentSchedules extends _$TreatmentSchedules {
  @override
  Future<List<TreatmentSchedule>> build() async {
    return _fetchSchedules();
  }

  Future<List<TreatmentSchedule>> _fetchSchedules() async {
    final patientId = ref.read(appStateProvider).selectedProfile;
    final user = ref.read(userDataProvider).valueOrNull;
    if (patientId == user?.id || patientId == null) {
      final result =
          await ref.read(graphQLServiceProvider).query$GetTreatmentSchedules(
                Options$Query$GetTreatmentSchedules(),
              );

      if (result.hasException) {
        throw result.exception!;
      }

      return result.parsedData!.getTreatmentSchedules!
          .map((schedule) => TreatmentSchedule(
                id: schedule!.scheduleId,
                treatmentType: schedule.treatmentType,
                scheduledTime: schedule.scheduledTime,
                location: schedule.location,
                notes: schedule.notes,
              ))
          .toList();
    } else {
      final result = await ref
          .read(graphQLServiceProvider)
          .query$GetSharedTreatmentSchedule(
            Options$Query$GetSharedTreatmentSchedule(
              variables: Variables$Query$GetSharedTreatmentSchedule(
                patientId: patientId,
              ),
            ),
          );

      if (result.hasException) {
        throw result.exception!;
      }

      return (result.parsedData!.getSharedTreatmentSchedule ?? [])
          .map((schedule) => TreatmentSchedule(
                id: schedule!.scheduleId,
                treatmentType: schedule.treatmentType,
                scheduledTime: schedule.scheduledTime,
                location: schedule.location,
                notes: schedule.notes,
              ))
          .toList();
    }
  }

  Future<void> addSchedule({
    required String treatmentType,
    required DateTime scheduledTime,
    required String location,
    String? notes,
  }) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$CreateTreatmentSchedule(
              Options$Mutation$CreateTreatmentSchedule(
                variables: Variables$Mutation$CreateTreatmentSchedule(
                  treatmentType: treatmentType,
                  scheduledTime: scheduledTime,
                  location: location,
                  notes: notes,
                ),
              ),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    ref.invalidateSelf();
  }

  Future<void> updateSchedule({
    required String scheduleId,
    String? treatmentType,
    DateTime? scheduledTime,
    String? location,
    String? notes,
  }) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$UpdateTreatmentSchedule(
              Options$Mutation$UpdateTreatmentSchedule(
                variables: Variables$Mutation$UpdateTreatmentSchedule(
                  scheduleId: scheduleId,
                  treatmentType: treatmentType,
                  scheduledTime: scheduledTime,
                  location: location,
                  notes: notes,
                ),
              ),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    ref.invalidateSelf();
  }

  Future<void> deleteSchedule(String scheduleId) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$DeleteTreatmentSchedule(
              Options$Mutation$DeleteTreatmentSchedule(
                variables: Variables$Mutation$DeleteTreatmentSchedule(
                  scheduleId: scheduleId,
                ),
              ),
            );

    if (result.hasException) {
      throw result.exception!;
    }

    ref.invalidateSelf();
  }
}
