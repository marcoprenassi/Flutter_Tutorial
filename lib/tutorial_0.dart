void main() {
  print('Hello, World!');
  func_1();
  func_2();
}

void func_1() {
  print('I am a function!');
  int? nullableVariable;
  if(nullableVariable == null)
    print("Nullable");
}

void func_2() {
  var iAmAString = 'String';
  iAmAString = 10.toString();
  dynamic iAmWhatIwant = 'String';
  iAmWhatIwant = 10;
  print(iAmAString + " " + (iAmWhatIwant+5).toString());
  print("$iAmAString ${iAmWhatIwant+5}");
}