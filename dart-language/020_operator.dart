/**
 * operator 关键字
 * 用于定义类的操作符，如 +、-、*、/ 等。
 */

class Color {
  int red;
  int green;
  int blue;

  Color(this.red, this.green, this.blue);

  /// 定义 + 操作符，用于颜色的混合
  Color operator +(Color other) {
    return Color(
      (red + other.red) ~/ 2,
      (green + other.green) ~/ 2,
      (blue + other.blue) ~/ 2,
    );
  }

  String toAnsiString(String text) {
    return '\x1B[38;2;$red;$green;${blue}m$text\x1B[0m';
  }
}

void main(List<String> args) {
  var blue = Color(0, 0, 255);
  var yellow = Color(255, 255, 0);
  var mixed = blue + yellow;

  print(blue.toAnsiString('Blue'));
  print(yellow.toAnsiString('Yellow'));
  print(mixed.toAnsiString('Hello, World!'));
}
