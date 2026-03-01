/**
 * Function 关键字
 * dart 中函数也是对象，所以可以赋值给变量，也可以作为参数传递。
 * 函数可以作为参数传递，也可以作为返回值。
 */

// 普通函数，静态的，编译时就确定了，不能在运行时改变。
int add(int a, int b) => a + b;

// 匿名函数赋值给变量，动态的，运行时才确定。
Function add1 = (int a, int b) => a + b;

// 函数作为参数传递
void printAdd(int a, int b, Function(int, int) addFunc) {
  print(addFunc(a, b));
}

// 函数作为返回值
Function(int, int) getAddFunc() => add;
