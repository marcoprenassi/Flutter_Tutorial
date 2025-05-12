import 'tutorial_4.dart';

void main () {
  /// '=>' operator
  flybyObjects.where((name) => name.contains('tu')).forEach(print);
  /// objects
  var Apollo = Spacecraft("Apollo 1", null);
  print(Apollo.toString());
  var Apollo2 = Spacecraft("Apollo 2", DateTime.now());
  print(Apollo2.toString());
  /// Lists
  /// ---
  var SpacecraftList = {Apollo, Apollo2, Spacecraft("Moon Lander", DateTime(1978))};
  SpacecraftList.forEach((spacecraft){print(spacecraft.toString());});
}


/// class
class Spacecraft {
  String name;
  DateTime? launchDate;

  /// Read-only non-final property
  int? get launchYear => launchDate?.year;

  /// Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    /// Initialization code goes here.
  }

  @override
  String toString() {
    return describe();
  }
  /// Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  /// Method.
  String describe() {
    String tempString = ('Spacecraft: $name');
    /// Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      return '$tempString Launched: $launchYear ($years years ago)';
    } else {
      return '$tempString Unlaunched';
    }
  }

}


///  Simple Enum
enum PlanetType { terrestrial, ice, gas }

/// Enum that enumerates the different planets in our solar system
/// and some of their properties.
enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  // ···
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  /// A constant generating constructor
  const Planet(
      {required this.planetType, required this.moons, required this.hasRings});

  /// All instance variables are final
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  /// Enhanced enums support getters and other methods
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

