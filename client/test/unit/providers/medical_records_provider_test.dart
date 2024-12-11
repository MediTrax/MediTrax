import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/medical_records_provider.dart';

import '../../helpers/test_helper.dart';

void main() {
  setUpAll(() async {
    await setupTests();
  });

  tearDownAll(() async {
    await tearDownTests();
  });
  group('Medical Records Provider Tests', () {
    // late ProviderContainer container;

    // setUp(() {
    //   container = ProviderContainer();
    // });

    // test('initial medical records should be empty', () async {
    //   final records = await container.read(medicalRecordsProvider.future);
    //   expect(records, isEmpty);
    // });

    // test('medical records should be filtered by type', () async {
    //   const recordType = 'prescription';

    //   final records = await container.read(
    //     medicalRecordsProvider.future,
    //   );

    //   final filteredRecords =
    //       records.where((record) => record.recordType == recordType);

    //   for (final record in filteredRecords) {
    //     expect(record.recordType, equals(recordType));
    //   }
    // });

    // test('medical records should be sorted by date', () async {
    //   final records = await container.read(medicalRecordsProvider.future);

    //   if (records.length > 1) {
    //     for (int i = 1; i < records.length; i++) {
    //       expect(
    //           records[i - 1].createdAt.isAfter(records[i].createdAt) ||
    //               records[i - 1]
    //                   .createdAt
    //                   .isAtSameMomentAs(records[i].createdAt),
    //           true);
    //     }
    //   }
    // });
  });
}
