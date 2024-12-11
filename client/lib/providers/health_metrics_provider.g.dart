// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_metrics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$healthMetricsHash() => r'c58a2ee4702fedc824fef62ef0abef0d0242fd6a';

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
    r'64ff13daa72755185a7e58222f6c0d019ac17e16';

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