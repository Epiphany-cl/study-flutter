import 'dart:convert';
import 'dart:io';
import 'package:dart_app/llm_util.dart';
import 'package:dart_app/rainbow_string.dart';

void main() async {
  // 解决 Windows CMD 中文乱码问题
  if (Platform.isWindows) {
    stdout.encoding = utf8;
  }

  // 对话历史
  final List<Map<String, String>> history = [
    {
      "role": "system",
      "content":
          "你是 AI 助手 Longger AI，你只是用英文名称呼你自己。请以专业、正式的语气回答所有问题，并避免使用任何 Markdown 格式。",
    },
  ];

  print(
    RainbowString.toRainbow(
      '=================================================',
    ),
  );
  print(RainbowString.toRainbow('   欢迎使用 Longger AI 命令行助手 (连续对话模式)   '));
  print(RainbowString.toRainbow('   输入 "exit" 退出，输入 "clear" 清空对话      '));
  print(
    RainbowString.toRainbow(
      '=================================================',
    ),
  );

  // AI 主动发起第一次对话
  stdout.write(' Longger 正在准备...\r');
  try {
    final String welcomePrompt = "请用一句简短的中文问候用户，介绍你自己和你的功能。";
    history.add({"role": "user", "content": welcomePrompt});

    final String welcomeResponse = await llmCompletions(history);
    history.add({"role": "assistant", "content": welcomeResponse});

    print(RainbowString.toRainbow(welcomeResponse));
  } catch (e) {
    print('欢迎消息加载失败：$e');
  }

  while (true) {
    stdout.write(': ');
    // 显式指定使用 utf8 编码读取输入
    final String? input = stdin.readLineSync(encoding: utf8);

    if (input == null || input.trim().isEmpty) continue;

    final String userInput = input.trim();

    // 处理退出
    if (userInput.toLowerCase() == 'exit') {
      print('再见！');
      break;
    }

    // 处理清空对话
    if (userInput.toLowerCase() == 'clear') {
      history.removeWhere((m) => m['role'] != 'system');
      print('对话历史已清空。\n');
      continue;
    }

    // 将用户输入加入历史
    history.add({"role": "user", "content": userInput});

    stdout.write(' Longger 正在思考...\r');

    try {
      // 调用 LLM
      final String response = await llmCompletions(history);

      // 清除 "AI 正在思考..." 提示
      stdout.write(' ' * 20 + '\r');

      // 将 AI 回复加入历史
      history.add({"role": "assistant", "content": response});

      // 打印回复
      print(RainbowString.toRainbow(response));
    } catch (e) {
      // 清除提示
      stdout.write(' ' * 20 + '\r');
      print(e);

      // 出错时移除刚才加入的历史，防止影响后续对话
      history.removeLast();
    }
  }

  // 关闭 HttpClient
  client.close();
}
