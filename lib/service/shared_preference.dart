import 'dart:convert';

import 'package:rejalar_apps/models/reja_modeli.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  //set , get , remove
  static storeName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);
  }

  static Future<String?> loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }

  static Future<bool> removeName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("name");
  }

  static storeReja(RejaModeli2 reja) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String reja_matn = jsonEncode(reja);
    prefs.setString("reja", reja_matn);
  }

  static Future<RejaModeli2?> loadReja() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? reja_matn = prefs.getString("reja");
    if (reja_matn == null || reja_matn.isEmpty) {
      return null;
    } else {
      Map<String, dynamic> map = jsonDecode(reja_matn);
      return RejaModeli2.fromJson(map);
    }
  }

  static Future<bool> removeReja() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('reja');
  }
}
