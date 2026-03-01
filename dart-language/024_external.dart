/**
 * external 关键字
 * 用于声明一个外部函数，外部函数是指在其他文件中定义的函数。
 */
import 'dart:ffi';
import 'dart:io';

// 定义外部函数的签名
@Native<Void Function()>()
external void hello_world();

void main() {
  // 动态库的路径
  final path = Platform.script.resolve('024_external_hello.dylib').path;
  // 加载动态库
  DynamicLibrary.open(path);
  hello_world(); // 调用外部函数
}
