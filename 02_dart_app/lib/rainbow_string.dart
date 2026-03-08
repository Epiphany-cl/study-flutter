import 'dart:math';
import 'package:characters/characters.dart';

///  RainbowString 类用于为字符串添加 ANSI 颜色代码，实现终端输出的彩色显示。
class RainbowString {
  /// 将字符串转换为彩虹字符串，每个字符根据其位置分配不同的颜色。
  ///
  /// [str] 要转换的字符串。
  ///
  /// 返回添加了颜色代码的彩虹字符串。
  static String toRainbow(String str) {
    final chars = str.characters.toList();
    return List.generate(chars.length, (i) {
      final ratio = (chars.length - i) / chars.length;
      return addColor(chars[i], wavelengthToRGB(ratio));
    }).join();
  }

  /// 为字符串添加 ANSI 颜色代码，实现终端输出的彩色显示。
  ///
  /// [str] 要添加颜色的字符串。
  /// [rgb] 包含 RGB 颜色值的对象。
  ///
  /// 返回添加了颜色代码的字符串。
  static String addColor(String str, RGB rgb) {
    return '\x1B[38;2;${rgb.red};${rgb.green};${rgb.blue}m$str\x1B[0m';
  }

  /// 将波长转换为 RGB 颜色值。
  ///
  /// [wavelengthNorm] 波长值，归一化到 0-1 范围。
  ///
  /// 返回对应的 RGB 颜色值对象。
  static RGB wavelengthToRGB(double wavelengthNorm) {
    // 1. 限制输入范围并映射到优化的波长范围（避开低对比度区域）
    double norm = wavelengthNorm.clamp(0.0, 1.0);

    // 优化的波长范围：380-510nm（蓝-青）和 580-780nm（黄-红），跳过 510-580nm 低对比度区域
    double wavelength;
    if (norm < 0.5) {
      // 0.0-0.5 对应 380-510nm（蓝-青）
      wavelength = 380.0 + (510.0 - 380.0) * (norm * 2);
    } else {
      // 0.5-1.0 对应 580-780nm（黄-红）
      wavelength = 580.0 + (780.0 - 580.0) * ((norm - 0.5) * 2);
    }

    double r = 0.0;
    double g = 0.0;
    double b = 0.0;

    // 2. 根据波长所在的区间计算纯色的 RGB 比例
    if (wavelength >= 380 && wavelength < 440) {
      r = -(wavelength - 440) / (440 - 380);
      g = 0.0;
      b = 1.0;
    } else if (wavelength >= 440 && wavelength < 490) {
      r = 0.0;
      g = (wavelength - 440) / (490 - 440);
      b = 1.0;
    } else if (wavelength >= 490 && wavelength < 510) {
      r = 0.0;
      g = 1.0;
      b = -(wavelength - 510) / (510 - 490);
    } else if (wavelength >= 580 && wavelength < 645) {
      r = 1.0;
      g = -(wavelength - 645) / (645 - 580);
      b = 0.0;
    } else if (wavelength >= 645 && wavelength <= 780) {
      r = 1.0;
      g = 0.0;
      b = 0.0;
    }

    // 3. 计算人眼对光谱边缘的敏感度衰减因子 (Intensity Falloff)
    // 人眼对可见光边缘（极紫、极红）的敏感度较低，所以需要降低亮度
    double factor = 0.0;
    if (wavelength >= 380 && wavelength < 420) {
      factor = 0.3 + 0.7 * (wavelength - 380) / (420 - 380);
    } else if (wavelength >= 420 && wavelength < 700) {
      factor = 1.0;
    } else if (wavelength >= 700 && wavelength <= 780) {
      factor = 0.3 + 0.7 * (780 - wavelength) / (780 - 700);
    }

    // 4. Gamma 校正 (显示器发光特性的反向补偿，算法标准常用 0.8)
    const double gamma = 0.80;

    int adjust(double color) {
      if (color == 0.0) return 0;
      // 乘以衰减因子，进行 gamma 幂运算，最后映射到 0-255
      return (pow(color * factor, gamma) * 255).round().clamp(0, 255);
    }

    return RGB(adjust(r), adjust(g), adjust(b));
  }
}

/// 表示 RGB 颜色值的类。
class RGB {
  final int red;
  final int green;
  final int blue;

  const RGB(this.red, this.green, this.blue);

  @override
  String toString() => 'RGB($red, $green, $blue)';
}

void main(List<String> args) {
  const text = '''
生存还是毁灭，这是一个值得考虑的问题；
默默忍受命运暴虐的毒箭，
或是挺身反抗人世的苦难，
通过斗争把它们扫清，这两种行为，哪一种更高贵？
死了；睡着了；什么都完了；
要是在这一种睡眠之中，我们心头的创痛，
以及其他无数血肉之躯所不能避免的打击，都可以从此消失，
那正是我们求之不得的解脱。''';
  print(RainbowString.toRainbow(text));
}
