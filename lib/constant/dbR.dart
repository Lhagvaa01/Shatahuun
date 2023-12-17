import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class RemindData {
  static const _key = 'remind_data';

  static saveRemindData(List<Map<String, String>> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode(data));
  }

  static Future<List<Map<String, String>>> getRemindData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(_key);
    if (jsonString != null) {
      List<dynamic> decoded = jsonDecode(jsonString);
      return decoded.cast<Map<String, String>>();
    }
    return [];
  }
}
