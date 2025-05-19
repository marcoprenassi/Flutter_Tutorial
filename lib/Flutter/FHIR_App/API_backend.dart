
import 'package:http/http.dart' as http;
import 'dart:convert';

class FhirService {
  static Future<String> fetchObservations(String patientId) async {
    final url = 'https://hapi.fhir.org/baseR4/Observation?subject=Patient/$patientId';
    // I am exploiting a PARAMETER to search the patient's observations

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        return JsonEncoder.withIndent('  ').convert(decoded);
      } else {
        return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      return 'Request failed: $e';
    }
  }
}