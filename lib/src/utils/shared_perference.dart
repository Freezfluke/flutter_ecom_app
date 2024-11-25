import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPerference {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  void save({required String key, required value}) async {
    print('value $value');
    await asyncPrefs.setString(key, json.encode(value));
  }

  Future<dynamic> read({required String key}) async {
    final value = await asyncPrefs.getString(key);
    return Future.value(value);
  }

  Future<bool> contains({required String key}) async {
    final value = await asyncPrefs.containsKey(key);
    return Future.value(value);
  }

  void remove({required String key}) async {
    await asyncPrefs.remove(key);
  }
}
