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

  test('should fetch mock medications', () async {
    final medications = await container.read(medicationTestProvider.future);
    
    expect(medications.length, 2);
    expect(medications[0].name, 'Medication 1');
    expect(medications[0].dosage, 1);
    expect(medications[0].unit, 'pcs');
    expect(medications[0].frequency, '1/1');
    expect(medications[0].inventory, 100);
  });

  test('should validate medication data structure', () async {
    final medications = await container.read(medicationTestProvider.future);
    final firstMed = medications.first;
    
    expect(firstMed.id, isNotNull);
    expect(firstMed.userId, '1');
    expect(firstMed.createdAt, isNotNull);
    expect(firstMed.updatedAt, isNotNull);
  });

  test('should have correct medication properties', () async {
    final medications = await container.read(medicationTestProvider.future);
    final secondMed = medications[1];
    
    expect(secondMed.name, 'Medication 2');
    expect(secondMed.dosage, 2);
    expect(secondMed.unit, 'pcs');
    expect(secondMed.frequency, '1/1');
    expect(secondMed.inventory, 100);
  });

  test('should have unique medication IDs', () async {
    final medications = await container.read(medicationTestProvider.future);
    final medicationIds = medications.map((m) => m.id).toSet();
    
    expect(medicationIds.length, medications.length);
  });
}
