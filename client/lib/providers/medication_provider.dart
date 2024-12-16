import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/medication.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/medication_provider.graphql.dart';

part 'medication_provider.g.dart';

@riverpod
class MedicationProvider extends _$MedicationProvider {
  @override
  Future<List<Medication>> build() {
    return fetchMedications();
  }

  Future<List<Medication>> fetchMedications() async {
    final patientId = ref.read(appStateProvider).selectedProfile;
    final user = ref.read(userDataProvider).valueOrNull;
    if (patientId == user?.id || patientId == null) {
      final result =
          await ref.read(graphQLServiceProvider).query$GetMedications(
                Options$Query$GetMedications(
                  fetchPolicy: FetchPolicy.networkOnly,
                ),
              );

      if (result.hasException) {
        throw result.exception!;
      }

      final medications = (result.parsedData!.getMedications ?? [])
          .map((item) => Medication(
                id: item!.medicationId,
                name: item.name,
                dosage: item.dosage,
                unit: item.unit,
                frequency: item.frequency,
                inventory: item.inventory,
                userId: user?.id ?? '',
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ))
          .toList();

      return medications;
    } else {
      final result =
          await ref.read(graphQLServiceProvider).query$GetSharedMedications(
                Options$Query$GetSharedMedications(
                  variables: Variables$Query$GetSharedMedications(
                    patientId: patientId,
                  ),
                ),
              );

      if (result.hasException) {
        throw result.exception!;
      }
      final medications = (result.parsedData!.getSharedMedications ?? [])
          .map((item) => Medication(
                id: item!.medicationId,
                name: item.name,
                dosage: item.dosage,
                unit: item.unit,
                frequency: item.frequency,
                inventory: item.inventory,
                userId: user?.id ?? '',
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ))
          .toList();

      return medications;
    }
  }

  Future<bool> addMedication({
    required String name,
    required double dosage,
    required String unit,
    required String frequency,
    required double inventory,
  }) async {
    try {
      // print("Adding medication with data:");
      // print("Name: $name");
      // print("Dosage: $dosage");
      // print("Unit: $unit");
      // print("Frequency: $frequency");
      // print("Inventory: $inventory");

      // Perform the mutation request
      final result = await ref
          .read(graphQLServiceProvider)
          .mutate$AddMedication(Options$Mutation$AddMedication(
              variables: Variables$Mutation$AddMedication(
                  name: name,
                  dosage: dosage,
                  unit: unit,
                  frequency: frequency,
                  inventory: inventory)));

      print("GraphQL exception: ${result.exception}");

      if (result.hasException) {
        throw result.exception!;
      }

      // Update the state with the new medication
      final newMedication = Medication(
        id: result.data!['addMedication']['medicationId'] ?? '',
        name: result.data!['addMedication']['name'] ?? '',
        dosage: (result.data!['addMedication']['dosage'] as num?)?.toDouble() ??
            0.0,
        unit: result.data!['addMedication']['unit'] ?? '',
        frequency: result.data!['addMedication']['frequency'] ?? '',
        inventory:
            (result.data!['addMedication']['inventory'] as num?)?.toDouble() ??
                0.0,
        userId: '',
        createdAt: DateTime.parse(result.data!['addMedication']['createdAt'] ??
            DateTime.now().toIso8601String()),
        updatedAt: DateTime.parse(result.data!['addMedication']['updatedAt'] ??
            DateTime.now().toIso8601String()),
      );

      state.whenData((medications) {
        state = AsyncValue.data([...medications, newMedication]);
      });

      return true;
    } catch (e, stack) {
      return false;
    }
  }

  Future<bool> updateMedication({
    required String medicationId,
    String? name,
    double? dosage,
    String? unit,
    String? frequency,
    double? inventory,
  }) async {
    try {
      print("Attempting to update medication with the following parameters:");
      print("ID: $medicationId");

      final result = await ref
          .read(graphQLServiceProvider)
          .mutate$UpdateMedication(Options$Mutation$UpdateMedication(
              variables: Variables$Mutation$UpdateMedication(
            medicationId: medicationId,
            name: name,
            dosage: dosage,
            unit: unit,
            frequency: frequency,
            inventory: inventory,
          )));

      print("GraphQL result: ${result.data}");
      print("GraphQL exception: ${result.exception}");

      if (result.hasException) {
        throw result.exception!;
      }

      // Update the state with the updated medication
      state.whenData((medications) {
        final originalMedication =
            medications.firstWhere((med) => med.id == medicationId);
        final updatedMedication = Medication(
            id: medicationId,
            name: name ?? originalMedication.name,
            dosage: dosage ?? originalMedication.dosage,
            unit: unit ?? originalMedication.unit,
            frequency: frequency ?? originalMedication.frequency,
            inventory: inventory ?? originalMedication.inventory,
            userId: '',
            createdAt: originalMedication.createdAt,
            updatedAt: DateTime.now());
        final updatedList = medications
            .map((med) => med.id == medicationId ? updatedMedication : med)
            .toList();
        state = AsyncValue.data(updatedList);
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteMedication(String medicationId) async {
    try {
      print('Starting deletion of medication with ID: $medicationId');

      final result = await ref
          .read(graphQLServiceProvider)
          .mutate$DeleteMedication(Options$Mutation$DeleteMedication(
              variables: Variables$Mutation$DeleteMedication(
                  medicationId: medicationId)));

      print('Mutation result: ${result.data}');

      if (result.hasException) {
        print('Error executing mutation: ${result.exception.toString()}');
        throw result.exception!;
      }

      // Update the state by removing the deleted medication
      state.whenData((medications) {
        final updatedList =
            medications.where((med) => med.id != medicationId).toList();
        state = AsyncValue.data(updatedList);
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
