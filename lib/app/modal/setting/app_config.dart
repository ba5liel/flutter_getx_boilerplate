import 'dart:convert';

class AppConfig {
  final String baseURL;
  AppConfig({
    required this.baseURL,
  });

  Map<String, dynamic> toMap() {
    return {
      'baseURL': baseURL,
    };
  }

  factory AppConfig.fromMap(Map<String, dynamic> map) {
    return AppConfig(
      baseURL: map['baseURL'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AppConfig.fromJson(String source) =>
      AppConfig.fromMap(json.decode(source));
}
