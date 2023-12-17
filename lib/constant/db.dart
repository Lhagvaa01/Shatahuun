import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DashFuelDatabase {
  static const String key = 'dbFuelData';

  static Future<void> saveDashFuel(
      List<Map<String, String>> dashFuelList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(dashFuelList);
    prefs.setString(key, jsonString);
  }

  static Future<List<Map<String, String>>> getDashFuel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);

    if (jsonString != null && jsonString.isNotEmpty) {
      List<dynamic> jsonData = jsonDecode(jsonString);
      List<Map<String, String>> dashFuelList = jsonData
          .map((dynamic item) => Map<String, String>.from(item))
          .toList();
      return dashFuelList;
    } else {
      return [];
    }
  }
}
