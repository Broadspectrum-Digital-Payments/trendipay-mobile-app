

class LocalStorageService{

  static final LocalStorageService _localStorage = LocalStorageService._internal();
  factory LocalStorageService() => _localStorage;
  LocalStorageService._internal();

  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //   encryptedSharedPreferences: true,
  // );

  Future<void> writeToken(String value) async{
    // final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    // await storage.write(key: 'bearerToken', value: value);
  }

  Future<String> getToken() async{
    // final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    // String? token = await storage.read(key: 'bearerToken');
    // return token?? '';
    return '';
  }

  Future<void> write(String key, String? value) async{
    // final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    // await storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async{
    // final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    // return await storage.read(key: key);
    return '';
  }

  Future<void> delete(String key) async{
    // final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    // await storage.delete(key: key);
  }

  Future<Map<String, dynamic>> decodeAndReadMap(String key) async {
    // final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    // String? data = await storage.read(key: key);
    // return data == null? {} : jsonDecode(data);
    return {};
  }

  Future<dynamic> decodeAndRead(String key) async {
    // final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    // String? data = await storage.read(key: key);
    // return data == null? null : jsonDecode(data);
  }

  Future<void> encodeAndWrite(String key, dynamic value) async{
    // final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    // await storage.write(key: key, value: jsonEncode(value));
  }

  Future<void> clearAll() async {
    // final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    // await storage.deleteAll();
  }

  Future<void> clearOnLogout() async{
    // await clearAll();
    // await write(kOnboardingCompleted, 'yes');
  }


}