import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/models/medication.dart';
import 'package:meditrax/providers/medication_provider_test.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('should load initial medications', () async {
    final notifier = container.read(medicationTestProvider.notifier);
    await notifier.fetchMedications();
    
    final medications = container.read(medicationTestProvider);
    expect(medications.value?.length, 2);
  });

  test('should add new medication', () async {
    final notifier = container.read(medicationTestProvider.notifier);
    await notifier.fetchMedications();
    
    final success = await notifier.addMedication(
      name: 'New Med',
      dosage: 50.0,
      unit: 'mg',
      frequency: 'daily',
      inventory: 20.0,
    );
    
    expect(success, true);
    final medications = container.read(medicationTestProvider);
    expect(medications.value?.length, 3);
  });

  test('should update medication', () async {
    final notifier = container.read(medicationTestProvider.notifier);
    await notifier.fetchMedications();
    
    final success = await notifier.updateMedication(
      medicationId: 'med1',
      name: 'Updated Med',
      dosage: 75.0,
    );
    
    expect(success, true);
    final medications = container.read(medicationTestProvider);
    final updatedMed = medications.value?.firstWhere((med) => med.id == 'med1');
    expect(updatedMed?.name, 'Updated Med');
    expect(updatedMed?.dosage, 75.0);
  });

  test('should delete medication', () async {
    final notifier = container.read(medicationTestProvider.notifier);
    await notifier.fetchMedications();
    
    final success = await notifier.deleteMedication('med1');
    
    expect(success, true);
    final medications = container.read(medicationTestProvider);
    expect(medications.value?.length, 1);
    expect(medications.value?.any((med) => med.id == 'med1'), false);
  });
}