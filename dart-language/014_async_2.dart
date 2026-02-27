import 'dart:io';

/**
 * 创建描述文件（异步版本）
 * 
 * 为每个对象创建一个文本文件，文件名为对象名.txt。
 * 如果文件已存在，则打印提示信息并跳过。
 * 
 * 异步特点：
 * - 使用 async/await 处理文件 I/O，不阻塞主线程
 * - 适合 Flutter UI 场景，避免界面卡顿
 * - 当前为串行执行，如需并发可用 Future.wait
 * 
 * @param objects 对象名称列表，将作为文件名。Iterable 可迭代对象，如 List、Set 等
 */
Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    await _createDescriptionFile(object);
  }
}

/**
 * 内部辅助函数，创建单个描述文件
 * 
 * @param object 对象名称，将作为文件名。
 */
Future<void> _createDescriptionFile(String object) async {
  try {
    var file = File('tmp/$object.txt');

    if (await file.exists()) {
      var modified = await file.lastModified();
      print('$object 的描述文件已存在，最后修改时间：$modified');
      return;
    }

    await file.create(recursive: true);
    await file.writeAsString('在此文件中开始描述 $object。');
  } on IOException catch (e) {
    print('无法为 $object 创建描述文件：$e');
  }
}

/**
 * 创建描述文件（并行版本）
 * 
 * 与 createDescriptions 不同，此函数会并发创建所有文件，
 * 利用多核处理器提升效率。
 * 
 * 异步特点：
 * - 使用 Future.wait 并行执行所有文件创建任务
 * - 适合处理大量对象，如批量创建描述文件
 * - 注意：并行操作可能会增加系统负载，需谨慎使用
 * 
 * @param objects 对象名称列表，将作为文件名。
 */
Future<void> createDescriptionsParallel(Iterable<String> objects) async {
  await Future.wait(objects.map((object) => _createDescriptionFile(object)));
}

main(List<String> args) async {
  await createDescriptions(['猫A1', '狗A2', '兔子A3']);
  await createDescriptionsParallel(['猫B1', '狗B2', '兔子B3']);
}
