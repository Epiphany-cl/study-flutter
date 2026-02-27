// interface 接口
/**
 * dart 中没有 interface 关键字, 但是可以使用 implements 关键字来实现接口。
 * dart 的类就是接口，使用 implements 关键字来实现接口, 类中必须实现接口中的所有方法。
 */

class Animal {
  void eat() => print('Eating');
}

class Dog implements Animal {
  @override
  void eat() {
    print('Dog is eating');
  }
}