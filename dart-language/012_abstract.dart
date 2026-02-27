// abstract 抽象类
/**
 * 由 abstract 关键字定义的类就是抽象类。
 * 抽象类不能被实例化，只能被继承。
 */

abstract class Animal {
  void eat();
  void run(){
    print('Running');
  }
}

class Dog extends Animal {
@override
  void eat() {
    print('Dog is eating');
  }
}

void main(List<String> args) {
  var dog = Dog();
  dog.eat();
  dog.run();

  // new Animal(); // 抽象类不能被实例化
}