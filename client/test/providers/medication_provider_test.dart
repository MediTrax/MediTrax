// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meditrax/models/medication.dart';
// import 'package:meditrax/providers/medication_provider_test.dart';

// void main() {
//   group('Medication Provider Tests', () {
//     late ProviderContainer container;

//     setUp(() {
//       container = ProviderContainer();
//     });

//     test('MedicationNotifierTest returns correct test data', () async {
//       final notifier = container.read(medicationTestProvider.notifier);
      
//       // Test initial state
//       expect(container.read(medicationTestProvider).value, isEmpty);
      
//       // Test loading state
//       notifier.fetchMedications("test_user");
//       expect(container.read(medicationTestProvider).isLoading, true);
      
//       // Test data state
//       await Future.delayed(const Duration(milliseconds: 600));
//       final state = container.read(medicationTestProvider);
      
//       expect(state.hasValue, true);
//       expect(state.value?.length, 2);
      
//       // Test first medication
//       expect(state.value?[0].id, "test_med_1");
//       expect(state.value?[0].name, "Aspirin");
//       expect(state.value?[0].dosage, 500.0);
//       expect(state.value?[0].unit, "mg");
//       expect(state.value?[0].frequency, "Daily");
//       expect(state.value?[0].inventory, 30.0);
      
//       // Test second medication
//       expect(state.value?[1].id, "test_med_2");
//       expect(state.value?[1].name, "Vitamin C");
//       expect(state.value?[1].dosage, 1000.0);
//       expect(state.value?[1].frequency, "Twice daily");
//       expect(state.value?[1].inventory, 60.0);
//     });

//     test('addMedication adds new medication correctly', () async {
//       final notifier = container.read(medicationTestProvider.notifier);
      
//       final result = await notifier.addMedication(
//         name: "Ibuprofen",
//         dosage: 400.0,
//         unit: "mg",
//         frequency: "As needed",
//         inventory: 20.0,
//       );
      
//       expect(result, true);
      
//       final state = container.read(medicationTestProvider);
//       expect(state.value?.length, 1);
      
//       final newMed = state.value?.first;
//       expect(newMed?.name, "Ibuprofen");
//       expect(newMed?.dosage, 400.0);
//       expect(newMed?.unit, "mg");
//       expect(newMed?.frequency, "As needed");
//       expect(newMed?.inventory, 20.0);
//     });

//     test('updateMedication updates existing medication', () async {
//       final notifier = container.read(medicationTestProvider.notifier);
      
//       await notifier.fetchMedications("test_user");
//       await Future.delayed(const Duration(milliseconds: 600));
      
//       final result = await notifier.updateMedication(
//         medicationId: "test_med_1",
//         inventory: 25.0,
//         frequency: "Twice daily",
//       );
      
//       expect(result, true);
      
//       final state = container.read(medicationTestProvider);
//       final updatedMed = state.value?.firstWhere((med) => med.id == "test_med_1");
      
//       expect(updatedMed?.inventory, 25.0);
//       expect(updatedMed?.frequency, "Twice daily");
//       // Original values should remain unchanged
//       expect(updatedMed?.name, "Aspirin");
//       expect(updatedMed?.dosage, 500.0);
//       expect(updatedMed?.unit, "mg");
//     });

//     test('deleteMedication removes medication correctly', () async {
//       final notifier = container.read(medicationTestProvider.notifier);
      
//       await notifier.fetchMedications("test_user");
//       await Future.delayed(const Duration(milliseconds: 600));
      
//       expect(container.read(medicationTestProvider).value?.length, 2);
      
//       final result = await notifier.deleteMedication("test_med_1");
//       expect(result, true);
      
//       final state = container.read(medicationTestProvider);
//       expect(state.value?.length, 1);
//       expect(state.value?.any((med) => med.id == "test_med_1"), false);
//       expect(state.value?.first.id, "test_med_2");
//     });

//     group('Error Handling Tests', () {
//       test('fetchMedications handles empty userId gracefully', () async {
//         final notifier = container.read(medicationTestProvider.notifier);
        
//         await notifier.fetchMedications("");
//         final state = container.read(medicationTestProvider);
        
//         expect(state.hasValue, true);
//         expect(state.value, isEmpty);
//       });

//       test('addMedication handles invalid dosage values', () async {
//         final notifier = container.read(medicationTestProvider.notifier);
        
//         // Test negative dosage
//         final resultNegative = await notifier.addMedication(
//           name: "Test Med",
//           dosage: -100.0,
//           unit: "mg",
//           frequency: "Daily",
//           inventory: 10.0,
//         );
//         expect(resultNegative, false);
        
//         // Test zero dosage
//         final resultZero = await notifier.addMedication(
//           name: "Test Med",
//           dosage: 0.0,
//           unit: "mg",
//           frequency: "Daily",
//           inventory: 10.0,
//         );
//         expect(resultZero, false);
//       });

//       test('addMedication handles empty required fields', () async {
//         final notifier = container.read(medicationTestProvider.notifier);
        
//         final result = await notifier.addMedication(
//           name: "",
//           dosage: 100.0,
//           unit: "",
//           frequency: "",
//           inventory: 10.0,
//         );
        
//         expect(result, false);
//         final state = container.read(medicationTestProvider);
//         expect(state.value, isEmpty);
//       });

//       test('updateMedication handles non-existent medicationId', () async {
//         final notifier = container.read(medicationTestProvider.notifier);
        
//         final result = await notifier.updateMedication(
//           medicationId: "non_existent_id",
//           inventory: 25.0,
//         );
        
//         expect(result, false);
//       });

//       test('updateMedication handles invalid inventory values', () async {
//         final notifier = container.read(medicationTestProvider.notifier);
        
//         await notifier.fetchMedications("test_user");
//         await Future.delayed(const Duration(milliseconds: 600));
        
//         final result = await notifier.updateMedication(
//           medicationId: "test_med_1",
//           inventory: -10.0,
//         );
//         expect(result, false);
        
//         final state = container.read(medicationTestProvider);
//         final med = state.value?.firstWhere((m) => m.id == "test_med_1");
//         expect(med?.inventory, 30.0); // Should remain unchanged
//       });

//       test('deleteMedication handles non-existent medicationId', () async {
//         final notifier = container.read(medicationTestProvider.notifier);
        
//         final result = await notifier.deleteMedication("non_existent_id");
//         expect(result, false);
//       });
//     });
//   });
// }
