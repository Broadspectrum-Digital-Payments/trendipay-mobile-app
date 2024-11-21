

import 'package:bdp_payment_app/core/services/logger_service.dart';

import '../env/environment.dart';
import 'git_it_service_locator.dart';
import 'local_storage_service.dart';

class ApiConfigService{

  static String get baseURL => Environment.getBaseUrl;
  static String get loanBaseURL => Environment.getLoanBaseUrl;

  static Future<Map<String, String>> getHttpHeaders() async{
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    };
    String token = await sl.get<LocalStorageService>().getToken();
    if(token.isNotEmpty){
      headers.addAll({'Authorization': 'Bearer $token'});
      ZLoggerService.logOnInfo(headers.toString());
    }
    return headers;
  }



}

