// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_metrics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$healthMetricsHash() => r'4b36855cac5c706e175688a8519c221fe2795dc5';

/// See also [HealthMetrics].
@ProviderFor(HealthMetrics)
final healthMetricsProvider = AutoDisposeAsyncNotifierProvider<HealthMetrics,
    List<HealthMetric>>.internal(
  HealthMetrics.new,
  name: r'healthMetricsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$healthMetricsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HealthMetrics = AutoDisposeAsyncNotifier<List<HealthMetric>>;
String _$treatmentSchedulesHash() =>
    r'89ad4e95a67f56e1f5cc1c7e25ddaa2dd459e7ee';

/// See also [TreatmentSchedules].
@ProviderFor(TreatmentSchedules)
final treatmentSchedulesProvider = AutoDisposeAsyncNotifierProvider<
    TreatmentSchedules, List<TreatmentSchedule>>.internal(
  TreatmentSchedules.new,
  name: r'treatmentSchedulesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$treatmentSchedulesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TreatmentSchedules
    = AutoDisposeAsyncNotifier<List<TreatmentSchedule>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package