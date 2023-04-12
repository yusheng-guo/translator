import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';
import 'package:translator/service/config.dart';

Future<http.Response> doRequest(Map<String, String> data) async {
  final url = Uri.parse(Config().youdaoApiUrl);
  final response = await http.post(url, body: data);
  return response;
}

Future<String> translate(String q) async {
  // en->ch or ch->en
  var chineseReg = RegExp(r'[\u4e00-\u9fa5]');
  var englishReg = RegExp(r'[a-zA-Z]');

  var chinese = chineseReg.allMatches(q).length;
  var english = englishReg.allMatches(q).length;

  final String from;
  final String to;
  if (chinese > english) {
    from = 'zh-CHS';
    to = 'en';
  } else {
    from = 'en';
    to = 'zh-CHS';
  }

  var data = {
    'from': from,
    'to': to,
    'signType': 'v3',
    'curtime': '${DateTime.now().millisecondsSinceEpoch ~/ 1000}',
    'salt': const Uuid().v1(),
    'appKey': '5be73b5e5216c825',
    'q': q,
  };
  var signStr =
      '${data['appKey']}${truncate(q)}${data['salt']!}${data['curtime']}${Config().youdaoSecretKey}';
  var sign = encrypt(signStr);
  data['sign'] = sign;

  var response = await doRequest(data);
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    return postProcessing(jsonData);
  } else {
    return '${response.statusCode}';
  }
}

// 裁剪成20个字符
String truncate(String q) {
  var size = q.length;
  return size <= 20
      ? q
      : '${q.substring(0, 10)}$size${q.substring(size - 10, size)}';
}

String encrypt(String signStr) {
  var bytes = utf8.encode(signStr);
  var hash = sha256.convert(bytes);
  return hash.toString();
}

// 后处理
String postProcessing(Map<String, dynamic> jsonData) {
  String ret = '';
  bool isWord = jsonData['isWord'];
  if (isWord == true) {
    List<Map<String, dynamic>> webList =
        (jsonData['web'] as List).cast<Map<String, dynamic>>();

    for (var item in webList) {
      String key = item['key'];
      List<String> valueList = (item['value'] as List).cast<String>();
      ret += '$key: ${valueList.join(", ")}' '\n';
    }
  } else {
    ret = jsonData['translation'][0];
  }
  return ret;
}

// Future<void> main(List<String> args) async {
//   Future<String> futureString = translate('difference');
//   String ret = await futureString;
//   print(ret);
// }