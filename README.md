# flutter 学习项目

## Dart SDK 安装

[Dart SDK 安装](https://dart.dev/get-dart)

### macos 安装

```bash
# 增加 tap 仓库
brew tap dart-lang/dart
# 安装 dart
brew install dart
```

## Dart 语言学习

[Dart 官方文档](https://dart.dev/language)
[Dart 中文文档](https://dart.cn/language)

### 重要特性

- 所有的变量都是对象，包括 null，除了 null 其他所有对象都继承自 Object 类。
- Dart 是一种静态类型语言，变量的类型在编译时就确定了。
- 变量不能包含 null 除非你明确允许。你可以通过在类型末尾加上问号 ?
  来使变量可空。如果你确定某个值不为 null，但 Dart 认为可能为 null，可以用 `!`
  断言它不为 null。
- Object? 是把类型检查推迟到运行前的编译时，dynamic
  是把类型检查推迟到真正的运行时。
- Dart 支持 top-level 函数（函数可以直接写在类或对象的外部，不像 Java
  强制"一切必须在类中"，可以根据需要选择最合适的位置）。
- Dart supports top-level variables，也可以在类或对象的外部定义变量。
- Dart 没有 public 、 protected 和 private 这些关键字。 使用下划线 _
  来表示私有变量。
- Dart 标识符以字母或下划线开头，字母/数字/下划线组合。相比于 Java
  更加严格，java 中 标识符可以包含美元符号 $ 和 Unicode ，但在 Dart 中不能使用。
- Dart tools 报告的问题有两种： Warning 和 Error。 Warning 是警告，不会阻止
  代码运行，而 Error 是错误，会阻止代码运行。
