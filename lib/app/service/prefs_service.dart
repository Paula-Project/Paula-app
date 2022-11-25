import 'dart:convert';

import 'package:paula/app/state/usuario_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static final String _key = "key";

  static saveUser(Map<String, dynamic> json) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(
        _key,
        jsonEncode({
          "username": json['username'],
          "name": json['name'],
          "gender": json['gender'],
          "age": json['age'],
          "birthdate": json['birthdate'],
          "progress": json['progress'],
          "id": json['id'],
          "token": json['token']
        }));
  }

  static removeUser() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(_key);
  }

  static Future<String> isAuth() async {
    var prefs = await SharedPreferences.getInstance();
    var jsonResult = prefs.getString(_key);

    if (jsonResult != null) {
      return jsonResult;
    } else {
      return "null";
    }
  }
}
