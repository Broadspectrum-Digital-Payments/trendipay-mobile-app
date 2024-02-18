

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {

  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  //get string
  String getString(String key) {
    return _prefs.getString(key) ?? "";
  }

  setString(String key, String value) async {
    return await _prefs.setString(key, value) ;
  }

  double getDouble(String key) {
    return _prefs.getDouble(key) ?? 0.0;
  }


  removeKey(String key) {
    return _prefs.remove(key);
  }

}