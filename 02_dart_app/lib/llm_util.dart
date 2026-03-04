import 'dart:io';
import 'dart:convert';

final client = HttpClient();
final url = "https://watch-change.deno.dev/api/llm";

/// 调用 LLM API 进行文本生成。
///
/// [messages] 包含对话历史的消息列表，每个消息是一个 Map，包含 "role"（"user" 、"assistant"、"system"）和 "content"（消息内容）。
///
/// 返回 LLM 生成的回复文本。
Future<String> llmCompletions(List<Map<String, String>> messages) async {
  final request = await client.postUrl(Uri.parse(url));
  request.headers.set("Content-Type", "application/json");
  final body = jsonEncode({"messages": messages});
  request.add(utf8.encode(body));
  final response = await request.close();

  if (response.statusCode == 429) {
    throw Exception("LLM API 调用频率超过限制，请稍后重试");
  } else if (response.statusCode != 200) {
    throw Exception("LLM API 调用失败，状态码：${response.statusCode}");
  }

  final responseBody = await response.transform(utf8.decoder).join();
  final jsonResponse = jsonDecode(responseBody);

  // 提取 content 字段
  switch (jsonResponse) {
    case {
      'success': true,
      'data': {'choices': [{'message': {'content': String content}}, ...]},
    }:
      return content;
    default:
      throw Exception("无法从响应中提取 content 字段");
  }
}

Future<void> main() async {
  final messages = [
    {"role": "user", "content": "你好，请简单介绍一下自己。"},
  ];
  final response = await llmCompletions(messages);
  print(response);
}
