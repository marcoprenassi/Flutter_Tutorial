import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API LIST VIEW Tutorial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const FlutterAPIListViewTutorialPage(
          title: 'Flutter API LIST VIEW Tutorial'),
    );
  }
}

class FlutterAPIListViewTutorialPage extends StatefulWidget {
  const FlutterAPIListViewTutorialPage({super.key, required this.title});

  final String title;

  @override
  State<FlutterAPIListViewTutorialPage> createState() =>
      _FlutterAPIListViewTutorialPageState();
}

class _FlutterAPIListViewTutorialPageState
    extends State<FlutterAPIListViewTutorialPage> {
  late Future<String> _responseStr;
  final String API_Auth_Token =
      "4-4a053d0cbc40c4933f4e35bcb690f1fb78019bbef4579baacb1e322530ad79d246dd6d1aa4bbfb47ca314";

  Future<List<Map<int, String>>> fetchExperiments() async {
    print("get!");
    final response = await http.get(
        Uri.parse(
            "https://prp-electronic-lab.areasciencepark.it/api/v2/experiments"),
        headers: {"Authorization": API_Auth_Token});
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      List experimentsList = json.decode(response.body);
      experimentsList.forEach(
          (element) => print("${element['id']} : ${element['title']}"));
      return List<Map<int, String>>.from(experimentsList.map((element) =>
          <int, String>{element['id']: element['title']} as Map<int, String>));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to find experiments');
    }
  }

  late Future<List<Map<int, String>>> futureExperiments;

  @override
  void initState() {
    super.initState();
    futureExperiments = fetchExperiments();
  }

  void _showExperiment(String title) {
    print("Click: $title");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FutureBuilder<List<Map<int, String>>>(
            future: futureExperiments,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                    child: SizedBox(
                        width: 200,
                        height: 500,
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                child: Text('${snapshot.data![index].keys}'),
                                onTap: () => _showExperiment(
                                    snapshot.data![index].values.first),
                              );
                            })));
              }
            }),
      ),
    );
  }
}
