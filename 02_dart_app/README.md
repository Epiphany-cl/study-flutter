# 一个 Dart 命令行应用程序

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
