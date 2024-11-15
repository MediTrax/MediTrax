import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/medication.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:meditrax/providers/medication_provider.graphql.dart';

final medicationProvider = StateNotifierProvider<MedicationNotifier, AsyncValue<List<Medication>>>((ref) {
  final client = ref.watch(graphQLServiceProvider);
  return MedicationNotifier(client);
});

class MedicationNotifier extends StateNotifier<AsyncValue<List<Medication>>> {
  final GraphQLClient _client;

  MedicationNotifier(this._client) : super(const AsyncValue.data([]));

  Future<void> fetchMedications(String userId) async {
    try {
      // print("Fetching medications for user: $userId");
      state = const AsyncValue.loading();
      
    final result = await _client.query(
      QueryOptions(
        document: gql('''
          query GetMedications {
            getMedications {
              medicationId
              name
              dosage
              unit
              frequency
              inventory
            }
          }
        '''), 
        fetchPolicy: FetchPolicy.networkOnly, 
      ),
    );

      if (result.hasException) {
        throw result.exception!;
      }

      final medications = (result.data?['getMedications'] as List? ?? [])
          .map((item) => Medication(
                id: item['medicationId'] ?? '',  // Use medicationId instead of id
                name: item['name'] ?? '',
                dosage: (item['dosage'] as num?)?.toDouble() ?? 0.0,
                unit: item['unit'] ?? '',
                frequency: item['frequency'] ?? '',
                inventory: (item['inventory'] as num?)?.toDouble() ?? 0.0,
                userId: item['userId'] ?? userId,  // Use provided userId as fallback
                createdAt: item['createdAt'] != null 
                    ? DateTime.parse(item['createdAt']) 
                    : DateTime.now(),
                updatedAt: item['updatedAt'] != null 
                    ? DateTime.parse(item['updatedAt']) 
                    : DateTime.now(),
              ))
          .toList();

      // print("Parsed medications: ${medications.length}");
      state = AsyncValue.data(medications);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
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
      final result = await _client.mutate(
        MutationOptions(
          document: gql('''
            mutation AddMedication(
              \$name: String!
              \$dosage: Float!
              \$unit: String!
              \$frequency: String!
              \$inventory: Float!
            ) {
              addMedication(
                name: \$name
                dosage: \$dosage
                unit: \$unit
                frequency: \$frequency
                inventory: \$inventory
              ) {
                medicationId 
                message       
              }
            }
          '''),
          variables: {
            'name': name,
            'dosage': dosage,
            'unit': unit,
            'frequency': frequency,
            'inventory': inventory,
          },
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }


      // Update the state with the new medication
      final newMedication = Medication(
        id: result.data!['addMedication']['medicationId'] ?? '',
        name: result.data!['addMedication']['name'] ?? '',
        dosage: (result.data!['addMedication']['dosage'] as num?)?.toDouble() ?? 0.0,
        unit: result.data!['addMedication']['unit'] ?? '',
        frequency: result.data!['addMedication']['frequency'] ?? '',
        inventory: (result.data!['addMedication']['inventory'] as num?)?.toDouble() ?? 0.0,
        userId: result.data!['addMedication']['userId'] ?? '',
        createdAt: DateTime.parse(result.data!['addMedication']['createdAt'] ?? DateTime.now().toIso8601String()),
        updatedAt: DateTime.parse(result.data!['addMedication']['updatedAt'] ?? DateTime.now().toIso8601String()),
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
    required String id,
    String? name,
    double? dosage,
    String? unit,
    String? frequency,
    double? inventory,
  }) async {
    try {
      print("Attempting to update medication with the following parameters:");
      print("ID: $id");

      final result = await _client.mutate(
        MutationOptions(
          document: gql('''
            mutation UpdateMedication(
              \$medicationId: String!
              \$name: String
              \$dosage: Float
              \$unit: String
              \$frequency: String
              \$inventory: Float
            ) {
              updateMedication(
                medicationId: \$medicationId 
                name: \$name
                dosage: \$dosage
                unit: \$unit
                frequency: \$frequency
                inventory: \$inventory
              ) {
                medicationId
                message
              }
            }
          '''),
          variables: {
            'medicationId': id,
            if (name != null) 'name': name,
            if (dosage != null) 'dosage': dosage,
            if (unit != null) 'unit': unit,
            if (frequency != null) 'frequency': frequency,
            if (inventory != null) 'inventory': inventory,
          },
        ),
      );

    print("GraphQL result: ${result.data}");
    print("GraphQL exception: ${result.exception}");

      if (result.hasException) {
        throw result.exception!;
      }

      // Update the state with the updated medication
      state.whenData((medications) {
        final updatedMedication = Medication.fromJson(result.data!['updateMedication']);
        final updatedList = medications.map((med) => 
          med.id == id ? updatedMedication : med
        ).toList();
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

      final result = await _client.mutate(
        MutationOptions(
          document: gql('''
            mutation DeleteMedication(\$medicationId: String!) {
              deleteMedication(medicationId: \$medicationId) {
                message
              }
            }
          '''),
          variables: {
            'medicationId': medicationId,
          },
        ),
      );
      print('Mutation result: ${result.data}');

      if (result.hasException) {
        print('Error executing mutation: ${result.exception.toString()}');
        throw result.exception!;
      }

      // Update the state by removing the deleted medication
      state.whenData((medications) {
        final updatedList = medications.where((med) => med.id != medicationId).toList();
        state = AsyncValue.data(updatedList);
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}