import 'tutorial_1.dart';

void main () {  /// '=>' operator
  flybyObjects.where((name) => name.contains('tu')).forEach(print);
}