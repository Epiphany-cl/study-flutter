var name = '小明';
var age = 18;
var height = 188;
var friend = ['小红', '小白'];
var isMale = true;
var location = {'province': '北京', 'city': '北京'};

const pi = 3.14;
// pi = 3.1415926; // 错误，常量值不能改变

var radius = 2;
// const area = pi * radius * radius; // 错误，表达式必须是一个编译时常量

final area = pi * radius * radius; // 正确，表达式是一个编译时常量

/**
 * variables 变量
 * 使用 var 声明变量，且可以自动推断，类型不能改变
 * 常量使用 const 声明，值不能改变，且表达式必须是一个编译时常量
 * final 声明的变量，值不能改变，但是可以在运行时赋值
 */
