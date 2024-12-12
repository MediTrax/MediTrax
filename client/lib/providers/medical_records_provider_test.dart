import 'package:meditrax/models/medical_record.dart';
import 'package:meditrax/providers/medical_records_provider.dart';

class MedicalRecordsTest extends MedicalRecords {
  @override
  Future<List<MedicalRecord>> build() async {
    return [
      MedicalRecord(
        id: '1',
        recordType: 'Blood Pressure',
        content: '72 mmHg',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];
  }
}
