/**
 * factory 关键字
 * 用于创建对象的特殊构造函数，可以用于单例模式。
 * 普通的构造函数隐式返回 this，而工厂构造函数可以返回任何对象。
 * 
 */
class Logger {
  final String name;
  static final Map<String, Logger> _cache = <String, Logger>{};

  // 工厂构造函数
  factory Logger(String name) {
    // 如果缓存里有，直接返回旧的；没有则创建新的并缓存
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }
  // 命名构造函数（私有，用于内部真正创建实例）
  Logger._internal(this.name);

  void log(String msg) => print('[$name] $msg');
}

void main() {
  var logger = Logger('UI');
  var loggerSecond = Logger('UI');
  var loggerThird = Logger('DB');

  print(identical(logger, loggerSecond)); // true，证明是同一个实例！
  print(identical(logger, loggerThird)); // false，不同的实例！
}
