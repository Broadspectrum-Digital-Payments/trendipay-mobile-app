

import 'package:bdp_payment_app/core/services/logger_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LocalStorageService{

  static final LocalStorageService _localStorage = LocalStorageService._internal();
  factory LocalStorageService() => _localStorage;
  LocalStorageService._internal();

  // CONFIGURE LOCAL STORAGE HERE
  Future<void> writeToken(String value) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userToken', value);
    ZLoggerService.logOnInfo("this is the user token $value");
  }

  Future<String> getToken() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken') ?? '';
  }

  Future<void> write(String key, String? value) async{

  }

  Future<String?> read(String key) async{
    return '';
  }

  Future<void> delete(String key) async{

  }

  Future<Map<String, dynamic>> decodeAndReadMap(String key) async {

    return {};
  }

  Future<dynamic> decodeAndRead(String key) async {
  }

  Future<void> encodeAndWrite(String key, dynamic value) async{
  }

  Future<void> clearAll() async {

  }

  Future<void> clearOnLogout() async{
  }


}