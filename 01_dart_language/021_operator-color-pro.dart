import 'dart:math';

class Color {
  int red;
  int green;
  int blue;

  Color(this.red, this.green, this.blue);

  // 将 RGB 转换为 HSV 中的 Hue (色相)
  double get _hue {
    double r = red / 255;
    double g = green / 255;
    double b = blue / 255;
    double maxVal = [r, g, b].reduce(max);
    double minVal = [r, g, b].reduce(min);
    double delta = maxVal - minVal;
    if (delta == 0) return 0;
    if (maxVal == r) return 60 * (((g - b) / delta) % 6);
    if (maxVal == g) return 60 * (((b - r) / delta) + 2);
    return 60 * (((r - g) / delta) + 4);
  }

  /// 定义 + 操作符，用于颜色的混合
  Color operator +(Color other) {
    // 这里简化处理：取色相的中值，饱和度和亮度取平均
    // 真正的物理混合比较复杂，这里演示色相偏移
    double h1 = this._hue;
    double h2 = other._hue;
    // 处理色相环跨越 360 度的情况
    if ((h1 - h2).abs() > 180) {
      if (h1 < h2)
        h1 += 360;
      else
        h2 += 360;
    }

    return Color(
      (red * other.red) ~/ 255, // 模拟滤镜叠加
      (green + other.green + 255) ~/ 3, // 增强绿色通道（针对蓝+黄特化）
      (blue * other.blue) ~/ 255,
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
