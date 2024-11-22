import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Medication {
  final String medicationId;
  final String name;
  final double dosage;
  final String unit;
  final String frequency;
  final double inventory;

  Medication({
    required this.medicationId,
    required this.name,
    required this.dosage,
    required this.unit,
    required this.frequency,
    required this.inventory,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      medicationId: json['medicationId'],
      name: json['name'],
      dosage: json['dosage'].toDouble(),
      unit: json['unit'],
      frequency: json['frequency'],
      inventory: json['inventory'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'medicationId': medicationId,
      'name': name,
      'dosage': dosage,
      'unit': unit,
      'frequency': frequency,
      'inventory': inventory,
    };
  }
}

class MedicationProvider extends ChangeNotifier {
  final GraphQLClient client;
  List<Medication> _medications = [];
  bool _loading = false;
  String? _error;

  MedicationProvider({required this.client});

  List<Medication> get medications => _medications;
  bool get loading => _loading;
  String? get error => _error;


  static const String getMedicationsQuery = '''
    query GetMedications(\$userId: String!) {
      getMedications(userId: \$userId) {
        medicationId
        name
        dosage
        unit
        frequency
        inventory
      }
    }
  ''';

  static const String addMedicationMutation = '''
    mutation AddMedication(
      \$userId: String!
      \$name: String!
      \$dosage: Float!
      \$unit: String!
      \$frequency: String!
      \$inventory: Float!
    ) {
      addMedication(
        userId: \$userId
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
  ''';

  static const String updateMedicationMutation = '''
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
  ''';

  static const String deleteMedicationMutation = '''
    mutation DeleteMedication(\$medicationId: String!) {
      deleteMedication(medicationId: \$medicationId) {
        message
      }
    }
  ''';

  Future<void> fetchMedications(String userId) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await client.query(
        QueryOptions(
          document: gql(getMedicationsQuery),
          variables: {'userId': userId},
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      _medications = (result.data!['getMedications'] as List)
          .map((json) => Medication.fromJson(json))
          .toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<String?> addMedication({
    required String userId,
    required String name,
    required double dosage,
    required String unit,
    required String frequency,
    required double inventory,
  }) async {
    try {
      final result = await client.mutate(
        MutationOptions(
          document: gql(addMedicationMutation),
          variables: {
            'userId': userId,
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

      await fetchMedications(userId);
      return result.data!['addMedication']['message'];
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return null;
    }
  }

  Future<String?> updateMedication({
    required String medicationId,
    String? name,
    double? dosage,
    String? unit,
    String? frequency,
    double? inventory,
  }) async {
    try {
      final result = await client.mutate(
        MutationOptions(
          document: gql(updateMedicationMutation),
          variables: {
            'medicationId': medicationId,
            if (name != null) 'name': name,
            if (dosage != null) 'dosage': dosage,
            if (unit != null) 'unit': unit,
            if (frequency != null) 'frequency': frequency,
            if (inventory != null) 'inventory': inventory,
          },
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      final index = _medications.indexWhere((m) => m.medicationId == medicationId);
      if (index != -1) {
        final updatedMedication = Medication(
          medicationId: medicationId,
          name: name ?? _medications[index].name,
          dosage: dosage ?? _medications[index].dosage,
          unit: unit ?? _medications[index].unit,
          frequency: frequency ?? _medications[index].frequency,
          inventory: inventory ?? _medications[index].inventory,
        );
        _medications[index] = updatedMedication;
        notifyListeners();
      }

      return result.data!['updateMedication']['message'];
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return null;
    }
  }

  Future<String?> deleteMedication(String medicationId) async {
    try {
      final result = await client.mutate(
        MutationOptions(
          document: gql(deleteMedicationMutation),
          variables: {'medicationId': medicationId},
        ),
      );

      if (result.hasException) {
        throw result.exception!;
      }

      _medications.removeWhere((m) => m.medicationId == medicationId);
      notifyListeners();

      return result.data!['deleteMedication']['message'];
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return null;
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}