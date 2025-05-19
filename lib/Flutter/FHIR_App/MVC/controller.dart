import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

class FhirController {
  Future<FhirObservation> fetchObservations(String patientId) async {
    final url = 'https://hapi.fhir.org/baseR4/Observation?subject=Patient/$patientId';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      return FhirObservation.fromJson(decoded);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}