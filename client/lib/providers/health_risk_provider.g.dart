// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_risk_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$healthRiskHash() => r'3da13c7ddc5aaae50e6e4921aced7f5454a50a54';

/// See also [HealthRisk].
@ProviderFor(HealthRisk)
final healthRiskProvider =
    AsyncNotifierProvider<HealthRisk, List<HealthRiskAssessment>>.internal(
  HealthRisk.new,
  name: r'healthRiskProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$healthRiskHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HealthRisk = AsyncNotifier<List<HealthRiskAssessment>>;
String _$questionnaireHash() => r'713e4791b6618b7bcf1ef0cdbf4bb97feddb12aa';

/// See also [Questionnaire].
@ProviderFor(Questionnaire)
final questionnaireProvider = AutoDisposeAsyncNotifierProvider<Questionnaire,
    QuestionnaireObject?>.internal(
  Questionnaire.new,
  name: r'questionnaireProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$questionnaireHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Questionnaire = AutoDisposeAsyncNotifier<QuestionnaireObject?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
