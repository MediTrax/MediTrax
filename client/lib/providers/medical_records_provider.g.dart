// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$medicalRecordsHash() => r'48bf3a27193495f5038c9450f4af46bb2cf42de3';

/// See also [MedicalRecords].
@ProviderFor(MedicalRecords)
final medicalRecordsProvider = AutoDisposeAsyncNotifierProvider<MedicalRecords,
    List<MedicalRecord>>.internal(
  MedicalRecords.new,
  name: r'medicalRecordsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$medicalRecordsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MedicalRecords = AutoDisposeAsyncNotifier<List<MedicalRecord>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package