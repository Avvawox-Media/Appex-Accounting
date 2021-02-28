import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPreferences prefs;

  Future<bool> storeData(String key, dynamic data) async {
    prefs = await SharedPreferences.getInstance();

    switch (data.runtimeType) {
      case String:
        return await prefs.setString(key, data);
      case int:
        return await prefs.setInt(key, data);
      case bool:
        return await prefs.setBool(key, data);
      case double:
        return await prefs.setDouble(key, data);
      case List:
        return await prefs.setStringList(key, data);
      default:
        return false;
    }
  }

  Future<dynamic> getData(String key, String format) async {
    prefs = await SharedPreferences.getInstance();

    switch (format) {
      case 'String':
        return prefs.getString(key);
      case 'int':
        return prefs.getInt(key);
      case 'bool':
        return prefs.getBool(key);
      case 'double':
        return prefs.getDouble(key);
      default:
        return false;
    }
  }

  Future<dynamic> checkKey(String key) async {
    prefs = await SharedPreferences.getInstance();

    prefs.containsKey(key);
  }
}
