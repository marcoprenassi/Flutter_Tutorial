import 'package:flutter/material.dart';
import 'controller.dart';
import 'model.dart';

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
  final _controller = FhirController();
  final _textEditingController = TextEditingController();

  List<FhirObservation> _observations = [];
  bool _loading = false;

  void _getObservations() async {
    final patientId = _textEditingController.text.trim();
    if (patientId.isEmpty) return;

    setState(() {
      _loading = true;
      _observations = [];
    });

    try {
      final results = await _controller.fetchObservations(patientId);
      setState(() {
        _observations = results;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed: $e')));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FHIR Observation Viewer")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Enter Patient ID',
                suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: _getObservations),
              ),
            ),
            SizedBox(height: 20),
            _loading
                ? CircularProgressIndicator()
                : Expanded(
              child: ListView.builder(
                itemCount: _observations.length,
                itemBuilder: (context, index) {
                  final obs = _observations[index];
                  return ListTile(
                    title: Text(obs.code),
                    subtitle: Text('${obs.value} ${obs.unit}'),
                    onTap: () => Navigator.push( // THIS IS THE KEY TO PUSH TO ANOTHER PAGE
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => ObservationDetailPage(observation: obs),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0); // From right to left
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          return SlideTransition(position: animation.drive(tween), child: child);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ObservationDetailPage extends StatelessWidget {
  final FhirObservation observation;

  ObservationDetailPage({required this.observation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Observation Details')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${observation.id}', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Code: ${observation.code}'),
            Text('Value: ${observation.value} ${observation.unit}'),
          ],
        ),
      ),
    );
  }
}