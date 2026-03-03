void main(List<String> args) {
  // 斐波那契数列 递归实现 F(n) = F(n-1) + F(n-2)
  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  var result = fibonacci(20);
  print(result);

  // 简写 箭头函数
  int fibonacci2(int n) =>
      n == 0 || n == 1 ? n : fibonacci2(n - 1) + fibonacci2(n - 2);

  var result2 = fibonacci2(20);
  print(result2);
}
