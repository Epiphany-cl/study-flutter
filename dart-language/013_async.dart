// async 异步
/**
 * 由 async 关键字定义的函数就是异步函数。
 * 异步函数返回一个 Future 对象。
 */

Future<void> printWithDelay(String message) async {
  await Future.delayed(Duration(seconds: 1));
  print(message);
}

// 效果与 printWithDelay 相同，但是可读性较差
Future<void> printWithDelay2(String message) {
  return Future.delayed(Duration(seconds: 1)).then((_) {
    print(message);
  });
}

void main(List<String> args) async {
  await printWithDelay('Hello, world!');
  await printWithDelay2('Hello, world 2 !');
  printWithDelay2('Hello, world 2 !');
}
