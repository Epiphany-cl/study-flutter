mixin Flyable {
  void fly() => print("I can fly");
}

mixin Swimmable {
  void swim() => print("I can swim");
}

class Animal {}

// 鸭子既能飞又能游泳，继承自 Animal，混入 Flyable 和 Swimmable
class Duck extends Animal with Flyable, Swimmable {}

void main() {
  var d = Duck();
  d.fly();   // 来自 Flyable
  d.swim();  // 来自 Swimmable
}