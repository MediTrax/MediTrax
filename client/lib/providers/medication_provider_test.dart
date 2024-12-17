// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:meditrax/models/medication.dart';
// import 'package:meditrax/providers/medication_provider.dart';

// final _mockClient = GraphQLClient(
//   link: HttpLink(''),
//   cache: GraphQLCache(),
// );

// class MedicationNotifierTest extends MedicationNotifier {
//   MedicationNotifierTest() : super(_mockClient);

//   @override
//   Future<void> fetchMedications(String userId) async {
//     try {
//       state = const AsyncValue.loading();
      
//       if (userId.isEmpty) {
//         state = const AsyncValue.data([]);
//         return;
//       }

//       await Future.delayed(const Duration(milliseconds: 500));
      
//       final medications = [
//         Medication(
//           id: "test_med_1",
//           name: "Aspirin",
//           dosage: 500.0,
//           unit: "mg",
//           frequency: "Daily",
//           inventory: 30.0,
//           userId: userId,
//           createdAt: DateTime.now(),
//           updatedAt: DateTime.now(),
//         ),
//         Medication(
//           id: "test_med_2",
//           name: "Vitamin C",
//           dosage: 1000.0,
//           unit: "mg",
//           frequency: "Twice daily",
//           inventory: 60.0,
//           userId: userId,
//           createdAt: DateTime.now(),
//           updatedAt: DateTime.now(),
//         ),
//       ];

//       state = AsyncValue.data(medications);
//     } catch (e) {
//       state = const AsyncValue.data([]);
//     }
//   }

//   @override
//   Future<bool> addMedication({
//     required String name,
//     required double dosage,
//     required String unit,
//     required String frequency,
//     required double inventory,
//   }) async {
//     try {
//       // Add validation first
//       if (name.isEmpty || unit.isEmpty || frequency.isEmpty) {
//         print('Error: Required fields cannot be empty');
//         return false;
//       }
//       if (dosage <= 0) {
//         print('Error: Dosage must be greater than 0');
//         return false;
//       }
//       if (inventory < 0) {
//         print('Error: Inventory cannot be negative');
//         return false;
//       }

//       await Future.delayed(const Duration(milliseconds: 500));

//       final newMedication = Medication(
//         id: "new_test_med_${DateTime.now().millisecondsSinceEpoch}",
//         name: name,
//         dosage: dosage,
//         unit: unit,
//         frequency: frequency,
//         inventory: inventory,
//         userId: "test_user",
//         createdAt: DateTime.now(),
//         updatedAt: DateTime.now(),
//       );

//       state.whenData((medications) {
//         state = AsyncValue.data([...medications, newMedication]);
//       });

//       return true;
//     } catch (e) {
//       print('Error in addMedication: $e');
//       return false;
//     }
//   }

//   @override
//   Future<bool> updateMedication({
//     required String medicationId,
//     String? name,
//     double? dosage,
//     String? unit,
//     String? frequency,
//     double? inventory,
//   }) async {
//     try {
//       // Validate inputs
//       if (medicationId.isEmpty) {
//         print('Error: MedicationId cannot be empty');
//         return false;
//       }
//       if (inventory != null && inventory < 0) {
//         print('Error: Invalid inventory value');
//         return false;
//       }
//       if (dosage != null && dosage <= 0) {
//         print('Error: Invalid dosage value');
//         return false;
//       }

//       // Check if medication exists
//       bool exists = false;
//       state.whenData((medications) {
//         exists = medications.any((med) => med.id == medicationId);
//       });

//       if (!exists) {
//         print('Error: Medication not found');
//         return false;
//       }

//       await Future.delayed(const Duration(milliseconds: 500));

//       state.whenData((medications) {
//         final index = medications.indexWhere((med) => med.id == medicationId);
//         if (index != -1) {
//           final oldMed = medications[index];
//           final updatedMed = Medication(
//             id: oldMed.id,
//             name: name ?? oldMed.name,
//             dosage: dosage ?? oldMed.dosage,
//             unit: unit ?? oldMed.unit,
//             frequency: frequency ?? oldMed.frequency,
//             inventory: inventory ?? oldMed.inventory,
//             userId: oldMed.userId,
//             createdAt: oldMed.createdAt,
//             updatedAt: DateTime.now(),
//           );
          
//           final updatedList = [...medications];
//           updatedList[index] = updatedMed;
//           state = AsyncValue.data(updatedList);
//         }
//       });

//       return true;
//     } catch (e) {
//       print('Error in updateMedication: $e');
//       return false;
//     }
//   }

//   @override
//   Future<bool> deleteMedication(String medicationId) async {
//     try {
//       if (medicationId.isEmpty) {
//         print('Error: MedicationId cannot be empty');
//         return false;
//       }

//       // Check if medication exists
//       bool exists = false;
//       state.whenData((medications) {
//         exists = medications.any((med) => med.id == medicationId);
//       });

//       if (!exists) {
//         print('Error: Medication not found');
//         return false;
//       }

//       await Future.delayed(const Duration(milliseconds: 500));

//       state.whenData((medications) {
//         final updatedList = medications.where((med) => med.id != medicationId).toList();
//         state = AsyncValue.data(updatedList);
//       });

//       return true;
//     } catch (e) {
//       print('Error in deleteMedication: $e');
//       return false;
//     }
//   }
// }

// // Test provider
// final medicationTestProvider = StateNotifierProvider<MedicationNotifierTest, AsyncValue<List<Medication>>>((ref) {
//   return MedicationNotifierTest();
// });
