/**
 * typedef 关键字
 * 用于定义一个函数类型的别名，方便代码的阅读和维护。
 */

// 定义别名
typedef LoginCallback =
    void Function(String username, int userId, bool success);

// 使用别名，代码瞬间清晰
void login(LoginCallback callback) {
  callback("Alice", 123, true);
}

void main(List<String> args) {
  login(
    (username, userId, success) => print("Login $username, $userId, $success"),
  );
}
