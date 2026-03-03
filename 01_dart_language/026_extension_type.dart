/**
 * extension type 关键字
 * 定义一个扩展类型，扩展类型是一种特殊的类型，它可以扩展其他类型的功能
 * 扩展类型 与 继承相比
 * Dart 不允许继承原始类型, 扩展类型只能扩展其他类型, 不能继承原始类型
 * 运行时开销，零开销
 * 
 */
extension type phoneString(String phone) {
  bool isPhoneNumber() {
    return RegExp(r'^1[3-9]\d{9}$').hasMatch(phone);
  }
}

void main(List<String> args) {
  var phone = '13800000000' as phoneString;
  print(phone.isPhoneNumber());
}
