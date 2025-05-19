import 'dart:convert';

class FhirObservation {
  final Map<String, dynamic> rawData;

  FhirObservation(this.rawData);

  String get prettyPrinted => JsonEncoder.withIndent('  ').convert(rawData);

  factory FhirObservation.fromJson(Map<String, dynamic> json) {
    return FhirObservation(json);
  }
}