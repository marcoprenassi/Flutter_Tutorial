class FhirObservation {
  final String id;
  final String code;
  final String value;
  final String unit;

  FhirObservation({
    required this.id,
    required this.code,
    required this.value,
    required this.unit,
  });

  factory FhirObservation.fromEntry(Map<String, dynamic> entry) {
    final resource = entry['resource'] ?? {};
    // FIXME: Resolve this error
    final code = resource['code']?['text'] ?? 'Unknown';
    // TODO: Check this solutions, let's learn how to use the debugger
    //final code = resource['code']['coding'][0] ? ['code'] ?? 'Unknown'; // FAST BUT TOO STRICT
    //final code = resource['code'].toString(); // FAST BUT TOO GENERAL
    /* JUST RIGHT ... FOR TWO LIMITED CASES
    final code;
    var debug = resource['code'].containsKey('coding');

    if(resource['code'].containsKey('coding')) {
      code = resource['code']['coding'][0] ? ['code'] ?? 'Unknown';
    }
    else if(resource['code'].containsKey('text')) {
      code = resource['code'] ? ['text'] ?? 'Unknown';
    } else
      code = 'Unknown';
     */



    final valueQuantity = resource['valueQuantity'] ?? {};
    return FhirObservation(
      id: resource['id'] ?? 'No ID',
      code: code,
      value: valueQuantity['value']?.toString() ?? 'N/A',
      unit: valueQuantity['unit'] ?? '',
    );
  }
}