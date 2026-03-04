# Flutter 学习项目

## Dart SDK 安装

- [Dart SDK 安装](https://dart.dev/get-dart)

### macOS 安装

```bash
# 增加 tap 仓库
brew tap dart-lang/dart

# 安装 dart
brew install dart
```

## Dart 语言学习

### 文档教程

- [Dart 官方文档 - dart.dev](https://dart.dev/language)
- [Dart 中文文档 - dart.cn](https://dart.cn/language)
- [Dart 风格指南 - dart.dev](https://dart.dev/effective-dart/style)
- [Dart 语言教程 - dart.dev](https://dart.dev/learn/tutorial)
- [Dart 备忘清单 - Quick Reference](https://quickref.cn/docs/dart.html)

### 视频教程

- [Welcome to the Dart and Flutter tutorial! - Youtube](https://www.youtube.com/watch?v=2kjp9yAKpT4)
- [What is Dart? - Youtube](https://www.youtube.com/watch?v=ulg4bjQQJi0)
- [The Dart platform - Youtube](https://www.youtube.com/watch?v=En5lVTdmZIY)
- [黑马程序员Flutter从入门到实战 - Bilibili](https://www.bilibili.com/video/BV1wR4Xz6EqG)

### Dart 重要特性

- **对象模型**: 所有的变量都是对象，包括 `null`，除了 `null`
  其他所有对象都继承自 `Object` 类。
- **静态类型**: Dart 是一种静态类型语言，变量的类型在编译时就确定了。
- **空安全**: 变量不能包含 `null` 除非你明确允许。你可以通过在类型末尾加上问号
  `?` 来使变量可空。如果你确定某个值不为 `null`，但 Dart 认为可能为
  `null`，可以用 `!` 断言它不为 `null`。
- **类型检查**: `Object?` 是把类型检查推迟到运行前的编译时，`dynamic`
  是把类型检查推迟到真正的运行时。
- **Top-level 函数**: Dart 支持 top-level
  函数（函数可以直接写在类或对象的外部，不像 Java
  强制"一切必须在类中"，可以根据需要选择最合适的位置）。
- **Top-level 变量**: Dart supports top-level
  variables，也可以在类或对象的外部定义变量。
- **访问控制**: Dart 没有 `public`、`protected` 和 `private`
  这些关键字。使用下划线 `_` 来表示私有变量。
- **标识符规则**: Dart 标识符以字母或下划线开头，字母/数字/下划线组合。相比于
  Java 更加严格，Java 中标识符可以包含美元符号 `$` 和 Unicode，但在 Dart
  中不能使用。
- **错误报告**: Dart tools 报告的问题有两种：`Warning` 和 `Error`。`Warning`
  是警告，不会阻止代码运行，而 `Error` 是错误，会阻止代码运行。

### Dart 关键字

- [Dart 关键字 - dart.dev](https://dart.dev/language/keywords)

Dart 一共有 67 个关键字。

| Dart 关键字 |           |            |          |          |
| :---------- | :-------- | :--------- | :------- | :------- |
| abstract    | as        | assert     | async    | await    |
| base        | break     | case       | catch    | class    |
| const       | continue  | covariant  | default  | deferred |
| do          | dynamic   | else       | enum     | export   |
| extends     | extension | external   | factory  | false    |
| final       | finally   | for        | Function | get      |
| hide        | if        | implements | import   | in       |
| interface   | is        | late       | library  | mixin    |
| new         | null      | of         | on       | operator |
| part        | required  | rethrow    | return   | sealed   |
| set         | show      | static     | super    | switch   |
| sync        | this      | throw      | true     | try      |
| type        | typedef   | var        | void     | when     |
| with        | while     | yield      |          |          |

#### 关键字分类说明

- **变量声明与基础类型**
  - `var`：类型推断
  - `final`：运行时常量
  - `const`：编译时常量
  - `late`：延迟初始化
  - `dynamic`：动态类
  - `void`：空类型
  - `null`：空值
  - `true`：布尔值，真
  - `false`：布尔值，假

- **控制流**
  - `if`：条件判断
  - `else`：条件分支的否定条件
  - `for`：普通循环
  - `in`：迭代集合（常与 `for` 结合使用：`for...in`）
  - `while`：前置条件循环
  - `do`：后置条件循环（常与 `while` 结合使用）
  - `switch`：多分支选择语句
  - `case`：`switch` 中的具体分支条件
  - `default`：`switch` 中的默认分支
  - `break`：跳出当前循环或 `switch` 语句
  - `continue`：跳过本次循环，进入下一次循环
  - `when`：模式匹配中的守卫条件（常配合 `switch` 或 `catch` 使用）
  - `return`：结束函数执行并返回值

- **错误处理与调试**
  - `try`：定义可能抛出异常的代码块
  - `catch`：捕获异常
  - `finally`：无论是否发生异常，最后都会执行的代码块
  - `throw`：抛出异常
  - `rethrow`：将捕获的异常再次抛出
  - `on`：针对特定类型的异常进行捕获（常与 `catch` 结合）
  - `assert`：断言，仅在调试模式下生效，条件为假时抛出异常，通常用于内部检查

- **类与面向对象（基础）**
  - `class`：声明一个类
  - `enum`：声明枚举类型
  - `extends`：继承一个父类
  - `implements`：实现一个或多个接口
  - `mixin`：声明一个混入（用于多重继承复用代码）
  - `with`：将混入（mixin）应用到类中
  - `extension`：为现有的类添加扩展方法
  - `super`：引用父类
  - `this`：引用当前类的实例对象
  - `new`：实例化对象（Dart 2 之后已变成可选关键字）
  - `factory`：声明工厂构造函数（可控制实例化的缓存或返回子类）
  - `get`：定义 getter 属性读取方法
  - `set`：定义 setter 属性赋值方法
  - `static`：声明类的静态成员（变量或方法）
  - `operator`：操作符重载
  - `covariant`：协变，允许子类重写方法时收窄参数的类型

- **类修饰符**
  - `abstract`：声明抽象类（不能被实例化）或抽象方法
  - `base`：基类修饰符，强制类只能被继承，不能被实现（implements）
  - `interface`：接口修饰符，强制类只能被实现，不能被继承
  - `final (class)`：最终类修饰符，类不能被继承也不能被实现
  - `sealed`：密封类，限制所有子类必须定义在同一个库文件中（支持 switch
    完备性检查）

| 修饰符    | 可 extends | 可 implements | 可实例化 | 子类位置限制 |
| :-------- | :--------: | :-----------: | :------: | :----------- |
| (默认)    |     ✅     |      ✅       |    ✅    | 无           |
| abstract  |     ✅     |      ✅       |    ❌    | 无           |
| base      |     ✅     |      ❌       |    ✅    | 无           |
| interface |     ❌     |      ✅       |    ✅    | 无           |
| final     |     ❌     |      ❌       |    ✅    | 无           |
| sealed    |     ✅     |      ❌       |    ❌    | 同库文件     |

- **函数与异步编程**
  - `Function`：表示所有函数类型的基类,函数也是对象
  - `async`：标记异步函数，允许在函数体内使用 `await`
  - `await`：等待异步操作（Future）完成
  - `sync`：标记同步生成器（常以 `sync*` 形式出现）
  - `yield`：在生成器函数（`sync*` 或 `async*`）中产出（返回）一个值
  - `external`：声明一个由外部（如 C/C++ 底层或宿主环境）实现的方法
  - `required`：标记命名参数为必传参数，编译时检查

- **库、模块与可见性**
  - `import`：导入其他库
  - `export`：导出其他库
  - `library`：指定当前文件的库名称
  - `part`：声明当前文件是另一个主库文件的一部分
  - `of`：声明属于哪个主库（常与 `part` 结合：`part of`）
  - `show`：选择性导入或导出库中的特定部分
  - `hide`：隐藏库中的特定部分不被导入或导出
  - `deferred`：延迟加载库（常配合 `as` 使用，需要时使用 `.loadLibrary()`
    才加载代码），减小首屏体积 / 提升启动速度

- **类型测试与定义**
  - `as`：类型转换（强制向下转型），或用于库导入时的别名（`import...as`）
  - `is`：类型判断（检查对象是否属于某类型）
  - `typedef`：定义类型别名（常用于函数签名或复杂泛型）
  - `type`：类型声明关键字，与 `extension type` 组合使用，定义扩展类型

## Dart 项目的构建

初始化项目

```bash
dart create dart_app
```

> 有不同的模板，例如 `console`, `package`, `plugin` 等。 例如
> `dart create -t cli my_app`

项目结构

```
dart_app/
├── bin/                        # 📌 可执行文件入口（类似 Java 的 main 类）
│   └── dart_app.dart           # 程序入口，dart run 时执行的文件
│
├── lib/                        # 📦 库代码（类似 Java 的 src/main/java）
│   └── dart_app.dart           # 对外暴露的公共 API
│
├── test/                       # 🧪 测试文件（类似 Java 的 src/test/java）
│   └── dart_app_test.dart      # 单元测试
│
├── pubspec.yaml                # ⚙️ 项目配置 + 依赖管理（类似 Maven 的 pom.xml）
├── pubspec.lock                # 🔒 依赖锁定文件（类似 package-lock.json）
├── analysis_options.yaml       # 📏 代码分析规则（类似 ESLint/Checkstyle）
├── README.md                   # 📖 项目说明
├── CHANGELOG.md                # 📝 版本变更日志
├── .gitignore                  # 🚫 Git 忽略文件
└── .dart_tool/                 # 🔧 Dart 工具生成的缓存（
```

运行项目

```bash
dart run dart_app
```

常用命令

```bash
# 编译项目
dart compile

# 管理依赖
dart pub

# 格式化代码
dart format

# 运行测试
dart test
```
