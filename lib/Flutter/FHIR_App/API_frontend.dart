
import 'package:flutter/material.dart';
import 'API_backend.dart';

void main() => runApp(FhirObservationApp());

class FhirObservationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FHIR Observation Viewer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ObservationHomePage(),
    );
  }
}

class ObservationHomePage extends StatefulWidget {
  @override
  _ObservationHomePageState createState() => _ObservationHomePageState();
}

class _ObservationHomePageState extends State<ObservationHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _observations = '';

  void _getObservations() async {
    final patientId = _controller.text.trim();
    if (patientId.isNotEmpty) {
      final result = await FhirService.fetchObservations(patientId);
      setState(() {
        _observations = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FHIR Observations')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter Patient ID (e.g., example, f201)',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _getObservations,
            child: Text('Fetch Observations'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                _observations,
                style: TextStyle(fontFamily: 'monospace'),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}