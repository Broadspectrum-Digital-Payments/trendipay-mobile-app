

class LocalStorageService{

  static final LocalStorageService _localStorage = LocalStorageService._internal();
  factory LocalStorageService() => _localStorage;
  LocalStorageService._internal();

  // CONFIGURE LOCAL STORAGE HERE
  Future<void> writeToken(String value) async{

  }

  Future<String> getToken() async{
    return '';
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