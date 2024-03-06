import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  Future<bool> containsKey(String key);
  Future<bool> remove(String key);
  Future<bool> clear();
  Future<Object?> get(String key);
  Future<String?> getString(String key);
  Future<bool> setString(String key, String value);
}

class LocalStorageServiceImpl implements LocalStorageService {
  @override
  Future<bool> containsKey(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.containsKey(key);
  }

  @override
  Future<bool> clear() async {
    final instance = await SharedPreferences.getInstance();
    return instance.clear();
  }

  @override
  Future<bool> remove(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.remove(key);
  }

  @override
  Future<Object?> get(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.get(key);
  }

  @override
  Future<String?> getString(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.getString(key);
  }

  @override
  Future<bool> setString(String key, String value) async {
    final instance = await SharedPreferences.getInstance();
    return instance.setString(key, value);
  }
}

class LocalStorageKeys {
  static String mostRecentApod = 'most_recent_apod';
  static String mostRecentApodTitle = "${mostRecentApod}_title";
  static String mostRecentApodUrl = "${mostRecentApod}_url";
  static String mostRecentApodExplanation = "${mostRecentApod}_explanation";
  static String mostRecentApodDate = "${mostRecentApod}_date";
}
