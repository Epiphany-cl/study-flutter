import 'dart:io';
import 'package:dart_app/rainbow_string.dart';

void main() {
  for (double i = 1; i >= 0; i = i - 0.01) {
    var str = RainbowString.addColor(
      i.toStringAsFixed(2),
      RainbowString.wavelengthToRGB(i),
    );
    stdout.write('$str ');
  }
}
