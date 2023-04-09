import 'dart:convert';
import 'package:flutter/services.dart';

class Config {
  static final Config _singleton = Config._internal();

  late String youdaoApiUrl;
  late String youdaoAppKey;
  late String youdaoSecretKey;

  factory Config() {
    return _singleton;
  }

  Config._internal();

  Future<void> loadFromAsset() async {
    final jsonString = await rootBundle.loadString('assets/config/config.json');
    final data = json.decode(jsonString);

    youdaoApiUrl = data['youdaoApiUrl'];
    youdaoAppKey = data['youdaoAppKey'];
    youdaoSecretKey = data['youdaoSecretKey'];
  }
}
