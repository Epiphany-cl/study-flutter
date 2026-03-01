/**
 * covariant 关键字
 * 用于构造函数参数，允许子类接受更具体的类型。
 * java 中有重载，dart 中没有重载，但是可以使用 covariant 关键字实现类似的效果。
 */

class Food {}

class CatFood extends Food {}

class Animal {
  // 在父类标记该参数可以协变
  void eat(covariant Food food) => print("吃东西");
}

class Cat extends Animal {
  @override
  void eat(CatFood food) => print("猫只吃猫粮");
}
