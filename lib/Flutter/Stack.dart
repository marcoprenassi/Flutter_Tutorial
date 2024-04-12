import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
      title: 'My app', // used by the OS task switcher
        home: Stack(
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
          )
            // Add your children widgets here
          ],
        )
    )
  );
}