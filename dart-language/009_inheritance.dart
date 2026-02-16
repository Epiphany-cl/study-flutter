import '007_classes.dart';

// Dart 和 java 类似都是单继承, 但是可以实现多个接口
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);

  @override
  String toString() {
    return '${super.toString()}, altitude: $altitude';
  }
}

main(List<String> args) {
  final orbiter = Orbiter('Orbiter', DateTime(2023, 1, 1), 1000);
  print(orbiter.toString());
}