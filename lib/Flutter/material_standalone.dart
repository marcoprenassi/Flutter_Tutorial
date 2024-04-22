import 'package:flutter/material.dart';

void main() {
  runApp(const ElabFTWAppRead());
}

class ElabFTWAppRead extends StatelessWidget {
  const ElabFTWAppRead({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: MainPage(title: 'elabFTW API Read Main Page'),
    );
  }
}

class ElabMainAppBar extends StatelessWidget {
  const ElabMainAppBar({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFF0BBD9D),
        width: 360,
        height: 54,
        padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        child: Row(textDirection: TextDirection.ltr, children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                textDirection: TextDirection.ltr,
                color: Colors.white,
                Icons.more_horiz,
              ),
            ),
          ),
        ]));
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return ElabAppMainScaffold();
  }
}

class ElabAppMainScaffold extends StatelessWidget {
  const ElabAppMainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Column(
        children: [
          ElabMainAppBar(
            title: "Test",
          ),
          Expanded(
              child: Center(
            child: Text(
              "Main Body",
              textDirection: TextDirection.ltr,
            ),
          ))
        ],
      ),
    );
  }
}
