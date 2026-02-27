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
| 关键字 | 赋值时机 | 表达式要求 |
|--------|----------|------------|
| `const` | 编译时 | 必须是编译时常量 |
| `final` | 运行时 | 可以是运行时表达式 |

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
import 'path/to/my_other_file.dart';
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

| 特性 | Java | Dart |
|------|------|------|
| 实例化 | `new ClassName()` | `ClassName()` |
| 构造函数 | 通过参数区分重载 | 通过命名构造函数 |
| 访问修饰符 | public/private/protected | 默认 public，_ 开头表示 private |
| this | `this.name = name` | `this.name` 参数语法糖 |

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

### 回调方式（不推荐）

```dart
Future<void> printWithDelay2(String message) {
  return Future.delayed(Duration(seconds: 1)).then((_) {
    print(message);
  });
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

void main() async {
  final stream = report(spacecraft, ['Moon', 'Mars', 'Jupiter']);
  
  await for (final message in stream) {
    print(message);
  }
}
```

**关键字：**
| 关键字 | 作用 |
|--------|------|
| `async` | 标记异步函数，返回 `Future` |
| `await` | 等待异步操作完成 |
| `async*` | 异步生成器，返回 `Stream` |
| `yield` | 在 Stream 中产生值 |

**与 Java 对比：**
```java
// Java CompletableFuture
CompletableFuture.delayedFuture(1, TimeUnit.SECONDS)
    .thenAccept(v -> System.out.println("Hello"));

// Java 19+ Virtual Threads
Thread.startVirtualThread(() -> {
    Thread.sleep(1000);
    System.out.println("Hello");
});
```

---

## 14. 异常处理

### 抛出异常

```dart
throw Exception('出错了～');
throw "出错了～";  // Dart 允许抛出任意对象
```

### 捕获异常

```dart
// 基本 try-catch
try {
  var result = 10 ~/ 0;
} catch (e) {
  print('捕获到异常：$e');
}

// 捕获特定异常
try {
  var result = 10 ~/ 0;
} on IntegerDivisionByZeroException catch (e) {
  print('除以零错误：$e');
} catch (e) {
  print('其他异常：$e');
}

// 获取堆栈信息
try {
  throw Exception('错误');
} catch (e, stackTrace) {
  print('异常：$e');
  print('堆栈：$stackTrace');
}

// finally
try {
  // ...
} catch (e) {
  // ...
} finally {
  print('总是执行');
}

// 重新抛出
try {
  // ...
} catch (e) {
  rethrow;  // 重新抛出
}
```

### 与 Java 对比

| 特性 | Java | Dart |
|------|------|------|
| Checked Exception | ✅ 有 | ❌ 无 |
| 必须声明 throws | ✅ Checked 异常需要 | ❌ 不需要 |
| 抛出任意对象 | ❌ 只能 Throwable | ✅ 可以 |
| 获取堆栈 | `e.getStackTrace()` | `catch (e, stack)` |
| 重新抛出 | `throw` | `rethrow` |

**重要：Dart 所有异常都是 unchecked，不需要显式声明 throws**

---

## 快速参考

### 类型系统

```dart
var name = 'Bob';      // 类型推断
String name = 'Bob';   // 显式类型
const pi = 3.14;       // 编译时常量
final now = DateTime.now();  // 运行时常量
String? nullable;      // 可空类型
int value = nullable ?? 0;   // 空值合并
```

### 集合

```dart
List<String> list = ['a', 'b'];
Map<String, int> map = {'a': 1, 'b': 2};
Set<int> set = {1, 2, 3};
```

### 操作符

```dart
??    // 空值合并
?.    // 条件访问
!     // 空断言
..    // 级联调用
is    // 类型测试
as    // 类型转换
```

---

## 总结

Dart 与 Java 的相似之处：
- ✅ 类似的语法结构
- ✅ 面向对象编程
- ✅ 强类型系统
- ✅ 异常处理机制

Dart 的独特之处：
- 🎯 顶层函数（不需要类包裹）
- 🎯 命名构造函数
- 🎯 Mixin 混入
- 🎯 所有异常都是 unchecked
- 🎯 async/await 原生支持
- 🎯 不需要 `new` 关键字
