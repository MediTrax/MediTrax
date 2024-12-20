import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meditrax/models/medication.dart';

final _mockClient = GraphQLClient(
  link: HttpLink(''),
  cache: GraphQLCache(),
);

class MedicationNotifierTest extends StateNotifier<AsyncValue<List<Medication>>> {
  MedicationNotifierTest() : super(const AsyncValue.loading());

  Future<void> fetchMedications() async {
    state = const AsyncValue.loading();
    
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Return test medications
    final medications = [
      Medication(
        id: "med1",
        name: "Test Medication 1",
        dosage: 100.0,
        unit: "mg",
        frequency: "daily",
        inventory: 30.0,
        userId: "user1",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Medication(
        id: "med2",
        name: "Test Medication 2",
        dosage: 250.0,
        unit: "ml",
        frequency: "twice daily",
        inventory: 15.0,
        userId: "user1",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];

    state = AsyncValue.data(medications);
  }

  Future<bool> addMedication({
    required String name,
    required double dosage,
    required String unit,
    required String frequency,
    required double inventory,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    try {
      state.whenData((medications) {
        final newMedication = Medication(
          id: "med${medications.length + 1}",
          name: name,
          dosage: dosage,
          unit: unit,
          frequency: frequency,
          inventory: inventory,
          userId: "user1",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        
        state = AsyncValue.data([...medications, newMedication]);
      });
      
      return true;
    } catch (e) {
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
    await Future.delayed(const Duration(milliseconds: 500));
    
    try {
      state.whenData((medications) {
        final updatedMedications = medications.map((med) {
          if (med.id == medicationId) {
            return Medication(
              id: med.id,
              name: name ?? med.name,
              dosage: dosage ?? med.dosage,
              unit: unit ?? med.unit,
              frequency: frequency ?? med.frequency,
              inventory: inventory ?? med.inventory,
              userId: med.userId,
              createdAt: med.createdAt,
              updatedAt: DateTime.now(),
            );
          }
          return med;
        }).toList();
        
        state = AsyncValue.data(updatedMedications);
      });
      
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteMedication(String medicationId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    try {
      state.whenData((medications) {
        final updatedMedications = medications.where((med) => med.id != medicationId).toList();
        state = AsyncValue.data(updatedMedications);
      });
      
      return true;
    } catch (e) {
      return false;
    }
  }
}

// Test provider that uses the test notifier
final medicationTestProvider = StateNotifierProvider<MedicationNotifierTest, AsyncValue<List<Medication>>>((ref) {
  return MedicationNotifierTest();
});
