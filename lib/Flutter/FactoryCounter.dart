import 'package:flutter/material.dart';
import 'package:tutorial_project_0/Flutter/StateInputOutput.dart';
import 'InputOutput.dart';

class CounterFactory {
  static StatefulWidget createCounterFactory(String CounterType) {
    switch(CounterType) {
      case('Simple'):
        return const CounterSimple();
      case('State Aware'):
        return const CounterStateAware();
      default:
        throw const FormatException('Invalid string');
    }

  }
}