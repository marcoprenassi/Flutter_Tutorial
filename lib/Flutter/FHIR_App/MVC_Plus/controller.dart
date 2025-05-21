import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

class FhirController {
  Future<List<FhirObservation>> fetchObservations(String patientId) async {
    final url = 'https://hapi.fhir.org/baseR4/Observation?subject=Patient/$patientId';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final entries = decoded['entry'] as List<dynamic>? ?? [];
      return entries.map((e) => FhirObservation.fromEntry(e)).toList();
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}