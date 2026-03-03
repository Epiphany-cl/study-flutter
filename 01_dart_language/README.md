# Dart 语言知识点总结

> 面向 Java 开发者的 Dart 快速入门指南

## 目录

1. [Hello World](#1-hello-world)
2. [变量与常量](#2-变量与常量)
3. [控制流语句](#3-控制流语句)
4. [函数](#4-函数)
5. [注释](#5-注释)
6. [导入](#6-导入)
7. [类与对象](#7-类与对象)
8. [枚举](#8-枚举)
9. [继承](#9-继承)
10. [Mixin 混入](#10-mixin-混入)
11. [Implements 接口](#11-implements-接口)
12. [Abstract 抽象类](#12-abstract-抽象类)
13. [Async 异步编程](#13-async-异步编程)
14. [异常处理](#14-异常处理)
15. [Extension 扩展方法](#15-extension-扩展方法)
16. [Extension Type 扩展类型](#16-extension-type-扩展类型)
17. [Factory 工厂构造函数](#17-factory-工厂构造函数)
18. [Operator 操作符重载](#18-operator-操作符重载)
19. [Typedef 类型别名](#19-typedef-类型别名)
20. [Covariant 协变](#20-covariant-协变)
21. [External 外部函数](#21-external-外部函数)

---

## 1. Hello World

```dart
void main() {
  print('hello world');
}
```

**要点：**

- `main()` 函数是 Dart 程序的入口
- 不需要 `public static` 修饰符
- 不需要分号结尾（但建议加上）

**与 Java 对比：**

```java
// Java
public class Main {
    public static void main(String[] args) {
        System.out.println("hello world");
    }
}
```

---

## 2. 变量与常量

### 变量声明

```dart
var name = '小明';      // 类型推断
var age = 18;
var isMale = true;
var friend = ['小红', '小白'];  // List
var location = {'province': '北京', 'city': '北京'};  // Map
```

### 常量

```dart
const pi = 3.14;  // 编译时常量，值不能改变

final area = pi * 2 * 2;  // 运行时常量，赋值后不能改变
```

**区别：**

| 关键字  | 赋值时机 | 表达式要求         |
| ------- | -------- | ------------------ |
| `const` | 编译时   | 必须是编译时常量   |
| `final` | 运行时   | 可以是运行时表达式 |

**与 Java 对比：**

```java
// Java
final int age = 18;           // 类似 Dart 的 final
static final int PI = 3;      // 类似 Dart 的 const
```

---

## 3. 控制流语句

### if-else

```dart
if (year >= 2001) {
  print('21st century');
} else if (year >= 1901) {
  print('20th century');
}
```

### for 循环

```dart
// for-each
for (final object in flybyObjects) {
  print(object);
}

// 传统 for
for (int month = 1; month <= 12; month++) {
  print(month);
}
```

### while 循环

```dart
while (year < 2016) {
  year += 1;
}
```

**与 Java 几乎相同**

---

## 4. 函数

### 普通函数

```dart
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}
```

### 箭头函数（简写）

```dart
int fibonacci2(int n) =>
    n == 0 || n == 1 ? n : fibonacci2(n - 1) + fibonacci2(n - 2);
```

### 顶层函数

Dart 支持**顶层函数**（Top-Level Functions），函数可以不在类里面：

```dart
// 直接写在文件级别，不需要类包裹
void greet(String name) {
  print('Hello, $name!');
}

void main() {
  greet('Alice');  // 直接调用
}
```

**与 Java 对比：**

```java
// Java 函数必须在类里面
public class Utils {
    public static int fibonacci(int n) {
        return n <= 1 ? n : fibonacci(n-1) + fibonacci(n-2);
    }
}
```

---

## 5. 注释

```dart
// 单行注释

/// 文档注释（用于生成文档）
/// IDE 和 dartdoc 会特殊处理
class MyClass {}

/* 多行注释 */
```

---

## 6. 导入

```dart
// 导入核心库
import 'dart:math';

// 从外部包导入
import 'package:http/http.dart' as http;

// 路径导入
import '../dart-language/path/to/my_other_file.dart';
```

---

## 7. 类与对象

### 基本类定义

```dart
class Spacecraft {
  String name;
  DateTime? launchDate;  // 可空类型

  // Getter
  int? get launchYear => launchDate?.year;

  // 构造函数
  Spacecraft(this.name, this.launchDate) {
    // 初始化代码
  }

  // 命名构造函数
  Spacecraft.unlaunched(String name) : this(name, null);

  // 方法
  void describe() {
    print('航天器：$name');
  }

  @override
  String toString() {
    return 'Spacecraft: $name, launchDate: $launchDate';
  }
}
```

### 实例化对象

```dart
// 不需要 new 关键字
var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));

// 调用命名构造函数
var voyager3 = Spacecraft.unlaunched('Voyager III');
```

**与 Java 对比：**

| 特性       | Java                     | Dart                            |
| ---------- | ------------------------ | ------------------------------- |
| 实例化     | `new ClassName()`        | `ClassName()`                   |
| 构造函数   | 通过参数区分重载         | 通过命名构造函数                |
| 访问修饰符 | public/private/protected | 默认 public，_ 开头表示 private |
| this       | `this.name = name`       | `this.name` 参数语法糖          |

---

## 8. 枚举

### 简单枚举

```dart
enum PlanetType { terrestrial, gas, ice }
```

### 增强枚举（带属性和方法）

```dart
enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  earth(planetType: PlanetType.terrestrial, moons: 1, hasRings: false),
  jupiter(planetType: PlanetType.gas, moons: 79, hasRings: true);

  // 构造函数
  const Planet({
    required this.planetType,
    required this.moons,
    required this.hasRings,
  });

  // 属性
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  // Getter
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

// 使用
final yourPlanet = Planet.earth;
if (!yourPlanet.isGiant) {
  print('Your planet is not a "giant planet".');
}
```

**与 Java 对比：**

```java
// Java 5+ 也支持枚举，但语法不同
enum Planet {
    EARTH(1), MARS(2);
    private final int moons;
    Planet(int moons) { this.moons = moons; }
}
```

---

## 9. 继承

```dart
class Orbiter extends Spacecraft {
  double altitude;

  // 使用 super 传递参数给父类构造函数
  Orbiter(super.name, DateTime super.launchDate, this.altitude);

  @override
  String toString() {
    return '${super.toString()}, altitude: $altitude';
  }
}
```

**要点：**

- Dart 是**单继承**，与 Java 相同
- 使用 `extends` 关键字
- 使用 `super` 调用父类构造函数

---

## 10. Mixin 混入

```dart
mixin A {
  void say() => print("A");
}

mixin B {
  void say() => print("B");
}

class Test with A, B {}

void main() {
  var test = Test();
  test.say();  // 打印 "B"，最后一个混入生效
}
```

**要点：**

- Mixin 允许在多个类之间共享代码
- 不使用继承，而是"混入"行为
- 多个 Mixin 有相同方法时，**最后一个生效**

**与 Java 对比：**

```java
// Java 类似的是默认方法的接口
interface A {
    default void say() { System.out.println("A"); }
}
interface B {
    default void say() { System.out.println("B"); }
}
class Test implements A, B {
    // 必须重写解决冲突
    @Override
    public void say() {
        B.super.say();  // 指定调用哪个
    }
}
```

---

## 11. Implements 接口

Dart 没有 `interface` 关键字，**类就是接口**：

```dart
class Animal {
  void eat() => print('Eating');
}

class Dog implements Animal {
  @override
  void eat() {
    print('Dog is eating');
  }
}
```

**要点：**

- 使用 `implements` 实现接口
- 必须实现接口中的所有方法
- 可以实现多个接口：`class Dog implements Animal, Pet {}`

---

## 12. Abstract 抽象类

```dart
abstract class Animal {
  void eat();  // 抽象方法
  
  void run() {  // 具体方法
    print('Running');
  }
}

class Dog extends Animal {
  @override
  void eat() {
    print('Dog is eating');
  }
}

void main() {
  var dog = Dog();
  dog.eat();
  dog.run();
  
  // Animal();  // 错误：抽象类不能被实例化
}
```

**与 Java 相同**

---

## 13. Async 异步编程

### Future 异步函数

```dart
Future<void> printWithDelay(String message) async {
  await Future.delayed(Duration(seconds: 1));
  print(message);
}

void main() async {
  await printWithDelay('Hello, world!');
}
```

### Stream 流式数据

```dart
Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (final object in objects) {
    await Future.delayed(Duration(seconds: 1));
    yield '${craft.name} flies by $object';
  }
}
```

**关键字：**

| 关键字   | 作用                        |
| -------- | --------------------------- |
| `async`  | 标记异步函数，返回 `Future` |
| `await`  | 等待异步操作完成            |
| `async*` | 异步生成器，返回 `Stream`   |
| `yield`  | 在 Stream 中产生值          |

---

## 14. 异常处理

### 基本用法

```dart
try {
  var result = 10 ~/ 0;
} on IntegerDivisionByZeroException catch (e) {
  print('除以零错误：$e');
} catch (e, stackTrace) {
  print('其他异常：$e');
  print('堆栈：$stackTrace');
} finally {
  print('总是执行');
}
```

**要点：**

- Dart 所有异常都是 **Unchecked Exception**，不需要显式声明 `throws`。
- 允许抛出任何对象（不仅仅是 Exception 类型）。

---

## 15. Extension 扩展方法

用于给现有的类增加新功能，而无需继承。

```dart
extension StringExtension on String {
  bool get isEmail =>
      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(this);
}

void main() {
  print('alice@example.com'.isEmail); // true
}
```

**与 Java 对比：** Java 通常需要写一个 `StringUtils` 工具类，而 Dart
可以让代码看起来像是类原生自带的方法。

---

## 16. Extension Type 扩展类型

Dart 3.2+ 引入。提供一种“零成本”的包装器，给现有类型套个“马甲”。

```dart
extension type PhoneString(String phone) {
  bool isPhoneNumber() => RegExp(r'^1[3-9]\d{9}$').hasMatch(phone);
}

void main() {
  var phone = PhoneString('13800000000');
  print(phone.isPhoneNumber()); // true
  // phone.substring(0); // 错误！原 String 方法默认被隐藏
}
```

**与 Java 对比：** 类似于 Java
的包装类，但**没有运行时开销**（编译后直接替换为底层类型），且能实现接口隐藏。

---

## 17. Factory 工厂构造函数

用于创建对象的特殊构造函数，可以手动控制返回的实例（如单例、缓存实例）。

```dart
class Logger {
  static final Map<String, Logger> _cache = {};
  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }
  Logger._internal(this.name);
  final String name;
}
```

**与 Java 对比：** Java 需要手动实现静态方法 `getInstance()`，而 Dart
直接集成在构造函数语法中。

---

## 18. Operator 操作符重载

允许类重新定义 `+`、`-`、`==`、`[]` 等操作符的行为。

```dart
class Vector {
  final int x, y;
  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
}
```

**与 Java 对比：** Java 不支持操作符重载（除了 String 的 +），Dart 类似于 C++
的这一特性，在处理数学运算或集合访问时更简洁。

---

## 19. Typedef 类型别名

为复杂的函数签名起一个简单的名字。

```dart
typedef LoginCallback = void Function(String username, bool success);

void login(LoginCallback callback) {
  callback("Alice", true);
}
```

---

## 20. Covariant 协变

允许子类在重写方法时，将参数类型修改为父类参数类型的**子类**。

```dart
class Food {}
class CatFood extends Food {}

class Animal {
  void eat(covariant Food food) {}
}

class Cat extends Animal {
  @override
  void eat(CatFood food) {} // 合法
}
```

**与 Java 对比：** Java 的方法重写要求参数类型必须完全一致。Dart 的 `covariant`
提供了一种灵活的类型安全机制来模拟类似“重载”的行为。

---

## 21. External 外部函数

用于声明在其他地方（如 C/C++）实现的函数，常用于 FFI 调用。

```dart
import 'dart:ffi';

@Native<Void Function()>()
external void hello_world();
```

---

## 快速参考表

| 特性           | Java 对应/备注                  | 关键字           |
| :------------- | :------------------------------ | :--------------- |
| **异步**       | CompletableFuture               | `async`, `await` |
| **混入**       | 带默认方法的接口 (多重继承替代) | `mixin`, `with`  |
| **扩展**       | StringUtils 工具类              | `extension`      |
| **工厂**       | 静态 getInstance() 方法         | `factory`        |
| **零成本包装** | Valhalla (未来的 Java 特性)     | `extension type` |
| **类型别名**   | 函数式接口                      | `typedef`        |
| **操作符**     | 不支持                          | `operator`       |

---

## 总结

Dart 是一门**为 UI 而生**的语言，它融合了 Java 的强类型、JavaScript
的异步友好以及 C++ 的某些灵活特性（如操作符重载）。对于 Java 开发者来说，理解
**“一切皆对象”** 和 **“零成本抽象（Extension Types）”** 是掌握 Dart
高级用法的关键。
