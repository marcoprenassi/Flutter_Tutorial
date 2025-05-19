
import 'package:flutter/material.dart';
import 'controller.dart';

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
  final TextEditingController _textEditingController = TextEditingController();
  final FhirController _controller = FhirController();

  String _observations = '';
  bool _isLoading = false;

  void _getObservations() async {
    final patientId = _textEditingController.text.trim();
    if (patientId.isEmpty) return;

    setState(() {
      _isLoading = true;
      _observations = '';
    });

    try {
      final result = await _controller.fetchObservations(patientId);
      setState(() {
        _observations = result.prettyPrinted;
      });
    } catch (e) {
      setState(() {
        _observations = 'Request failed: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
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
            controller: _textEditingController, // FALSE FRIEND (FOR THIS EXAMPLE!)
            decoration: InputDecoration(
              labelText: 'Enter Patient ID (e.g., example, f201)',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _isLoading ? null : _getObservations, // VIEW TO CONTROLLER SEND TO CONTROLLER
            child: Text('Fetch Observations'),
          ),
          SizedBox(height: 20),
          _isLoading
              ? CircularProgressIndicator()
              : Expanded(
            child: SingleChildScrollView(
              child: Text(
                _observations,  // MODEL TO VIEW OUTPUT
                style: TextStyle(fontFamily: 'monospace'),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}