// 混入（Mixin）
/**
 * 混入（Mixin）是一种在多个类之间共享代码的机制。
 * 它允许你在不使用继承的情况下，将类的行为添加到其他类中。
 * 如果出现多个混入类中都有相同的方法，那么子类会调用最后一个混入类中的方法。
 */
mixin A {
  void say() => print("A");
}

mixin B {
  void say() => print("B");
}

class Test with A, B {}

// 调用 test.say() 会打印 "B"
void main(List<String> args) {
  var test = Test();
  test.say();
}
