class Spacecraft {
  String name;
  DateTime? launchDate;

  // 只读的非 final 属性
  int? get launchYear => launchDate?.year;

  // 构造函数，使用语法糖为成员变量赋值。
  Spacecraft(this.name, this.launchDate) {
    // 初始化代码写在这里。
  }

  // 命名构造函数，转发到默认构造函数。
  Spacecraft.unlaunched(String name) : this(name, null);

  // 方法。
  void describe() {
    print('航天器: $name');
    // 类型提升对 getter 无效。
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('发射时间: $launchYear ($years 年前)');
    } else {
      print('未发射');
    }
  }

  @override
  String toString() {
    return 'Spacecraft: $name, launchDate: $launchDate';
  }
}

void main(List<String> args) {
  // 实例化一个对象。 不需要 new 关键字。
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  // 调用命名构造函数。
  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();
}

/**
class 的结构和 java 类似
也可以有多个构造器，但是 java 是通过参数类型/数量不同来定义多个构造函数，
而 dart 是通过命名构造函数来实现的。
dart 没有访问修饰符，默认是 public。
 */
