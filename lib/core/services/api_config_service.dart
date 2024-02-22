

import '../env/environment.dart';

class ApiConfigService{

  static String get baseURL => Environment.getBaseUrl;

  static Future<Map<String, String>> getHttpHeaders() async{
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    };
    // String token = await sl.get<LocalStorageService>().getToken();
    String token = '';
    if(token.isNotEmpty){
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    return headers;
  }



}

