import 'package:flutter/material.dart';
import 'InputOutput.dart';
import 'BasicLayout.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: SafeArea(
        child: MyScaffold()
      ),
    ),
  );
}