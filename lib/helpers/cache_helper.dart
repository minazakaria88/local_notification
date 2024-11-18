import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences sharedPreferences;

 static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) await sharedPreferences.setString(key, value);
    if (value is int) await sharedPreferences.setInt(key, value);
    if (value is bool) await sharedPreferences.setBool(key, value);
    if (value is double) await sharedPreferences.setDouble(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }
}


class Keys {
  static const String notificationId = 'notificationId';
}
