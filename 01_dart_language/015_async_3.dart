/**
 * async* 是一个异步的生成器函数，它返回一个 Stream 对象。
 * 
 */

import "007_classes.dart";

Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (final object in objects) {
    await Future.delayed(Duration(seconds: 1));
    yield '${craft.name} flies by $object';
  }
}

void main(List<String> args) async {
  final spacecraft = Spacecraft('Apollo 11', DateTime(1969, 7, 16));

  // 调用 async* 函数，返回 Stream
  final stream = report(spacecraft, ['Moon', 'Mars', 'Jupiter']);

  // 监听 Stream 的每个值
  await for (final message in stream) {
    print(message);
  }
}
