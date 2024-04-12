import 'package:flutter/material.dart';
import 'HandlingGestures.dart';
import 'FactoryCounter.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  // Fields in a Widget subclass are always marked "final".

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child
          // to fill the available space.
          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: [
      MyAppBar(
      title: Text(
      'Example title',
        style: Theme.of(context) //
            .primaryTextTheme
            .titleLarge,
      ),
    ),
    const Text('Hello World'),
    const MyButton(),
    CounterFactory.createCounterFactory('Simple'),
    Expanded(child:
      CounterFactory.createCounterFactory('State Aware')),

    Stack(
    children: <Widget>[
    Container(
    height: 42,
    width: 42,
    color: const Color.fromARGB(255, 255, 0, 0),
    ),
    Positioned(
    top: 21,
    left: 21,
    child:Container(
    height: 42,
    width: 42,
    color: const Color.fromARGB(200, 0, 255, 0),
    ),
    )],
    )
    ],
    ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}