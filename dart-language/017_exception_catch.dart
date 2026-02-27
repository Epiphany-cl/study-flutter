/**
 * 异常捕获
 *
 * 可以使用 try-catch 语句捕获异常。
 * 用到的关键字：
 * - try：包含可能会抛出异常的代码。
 * - on：指定要捕获的异常类型。
 * - catch：用于捕获异常并执行处理逻辑。
 * - finally：可选，无论是否抛出异常，都会执行的代码块。
 * - rethrow：用于重新抛出捕获的异常。
 *
 * 与 java 不同，dart 所有的异常都是 unchecked 异常，不需要显式声明。
 */

/// 基本的 try-catch 用法
void basicTryCatch() {
  try {
    var result = 10 ~/ 0; // 整数除以零，抛出异常
    print('结果：$result');
  } catch (e) {
    print('捕获到异常：$e');
  }
}

/// 捕获特定类型的异常
void catchSpecificException() {
  try {
    // int.parse('abc');  // FormatException
    var result = 10 ~/ 0; // IntegerDivisionByZeroException
    print('结果：$result');
  } on FormatException catch (e) {
    print('格式错误：$e');
  } on UnsupportedError catch (e) {
    print('除以零错误：$e');
  } catch (e) {
    // 捕获其他所有异常
    print('其他异常：$e');
  }
}

/// 捕获异常并获取堆栈跟踪信息
void catchWithStackTrace() {
  try {
    throw Exception('自定义异常信息');
  } catch (e, stackTrace) {
    print('异常对象：$e');
    print('异常类型：${e.runtimeType}');
    print('堆栈跟踪：\n$stackTrace');
  }
}

/// finally 块 - 无论是否异常都会执行
void withFinally() {
  try {
    print('try 块：开始执行');
    throw Exception('模拟错误');
  } catch (e) {
    print('catch 块：处理异常 - $e');
  } finally {
    print('finally 块：清理资源（总是执行）');
  }
}

/// 重新抛出异常
void rethrowExample() {
  try {
    innerFunction();
  } catch (e) {
    print('外层捕获到：$e');
  }
}

void innerFunction() {
  try {
    throw Exception('内部错误');
  } catch (e) {
    print('内层捕获到：$e');
    rethrow; // 重新抛出，让外层处理
  }
}

void main() {
  print('=== 示例 1：基本 try-catch ===');
  basicTryCatch();

  print('\n=== 示例 2：捕获特定异常 ===');
  catchSpecificException();

  print('\n=== 示例 3：获取堆栈信息 ===');
  catchWithStackTrace();

  print('\n=== 示例 4：finally 块 ===');
  withFinally();

  print('\n=== 示例 5：重新抛出异常 ===');
  rethrowExample();
}
