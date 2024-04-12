var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'};

void main() {
  /// Types declaration
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;


  /// Explicit not nullable declaration and assignment
  int declaredType;
  declaredType = 5;

  /// Explicit nullable declaration and check
  int? nullableVariable;
  if(nullableVariable == null)
    print("Nullable");

  /// Static type assignment
  var staticType = "String";
  staticType = 10.toString();

  /// Dynamic type assignment
  dynamic dynamicType = "String";
  dynamicType = 10;

  /// String formatting
  print('String formatting:');
  print(name + " " + year.toString() + " " + image['url'].toString());
  print("$name $year ${image['url']}"); // Best practice for DART

  /// final and const variables
  final finalVar = DateTime.now();
  const constVar = 3.14;

  /// If Statement
  print("If statement:");
    if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  /// Switch statement
  print("Switch statement:");
  switch(year) {
    case(1977):
      print("Correct Year");
    case(1978):
      print("Incorrect Year");
  }

  /// Foreach object
  for (final object in flybyObjects) {
    print(object);
  }

  /// For Cycle and increment operators
  for (int month = 1; month <= 3; month++) {
    print(month);
  }
  print("---");
  for (int month = 1; month <= 3; ) {
      print(++month); // Count and print
  }

   /// While loop
  while (year < 1985) {
    year += 1;
  }

    /// Inline conditions
  var a = year ?? 0;  // Not Null
  print(a);
  var b = year > 1982 ? 1 : -1; // Condition
  print(b);


}

