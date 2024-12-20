import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/models/medication.dart';
import 'package:meditrax/providers/medication_provider.dart';

final medicationTestProvider = FutureProvider<List<Medication>>((ref) async {
  return MedicationTest().build();
});

class MedicationTest extends MedicationProvider {
  @override
  Future<List<Medication>> build() async {
    return [
      Medication(
        id: '1',
        name: 'Medication 1',
        dosage: 1,
        unit: 'pcs',
        frequency: "1/1",
        inventory: 100,
        userId: '1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Medication(
        id: '2',
        name: 'Medication 2',
        dosage: 2,
        unit: 'pcs',
        frequency: "1/1",
        inventory: 100,
        userId: '1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];
  }
}
