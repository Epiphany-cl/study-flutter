/**
 * extension 关键字
 * 扩展类的功能，而无需继承或使用 mixin
 * 扩展名（Extension Name）可省略
 */
extension StringExtension on String {
  bool get isEmail =>
      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(this);
}

main() {
  final email = 'alice@example.com';
  print(email.isEmail); // true
}
