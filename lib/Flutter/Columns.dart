import 'package:flutter/material.dart';
import 'BasicLayout.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Text('Deliver features faster', textAlign: TextAlign.center),
            ),
            Expanded(
              child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
            ),
            Expanded(
              child: FittedBox(
                child: FlutterLogo(),
              ),
            ),
          ],
        )
      ),
    ),
  );
}


