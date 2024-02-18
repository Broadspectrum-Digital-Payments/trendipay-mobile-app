
import 'dart:convert';
import 'dart:io';

import 'package:bdp_payment_app/common/constants/api_constants.dart';
import 'package:bdp_payment_app/common/constants/general_repository.dart';
import 'package:bdp_payment_app/common/constants/global_constants.dart';
import 'package:dio/dio.dart';

import '../models/api_response.dart';

class HttpService {
  String? host;
  BaseOptions? baseOptions;
  Dio? dio;
  int connectTimeout = 60000;
  int receiveTimeout = 60000;



  HttpService(){
    initHttpService();
  }

  Future<Map<String, String>> getHeaders() async {
    return {
      HttpHeaders.acceptHeader: "application/json",
      "Paynet-Session-Token": GlobalConstants.storageService.getString(
          GeneralRepository.sessionKey),
    };
  }

  Future<void> initHttpService() async {
    host = ApiConstants.baseUrl;
    //initialize dio
    baseOptions = BaseOptions(
        baseUrl: host!,
        connectTimeout: const Duration(seconds: 120),
        receiveTimeout: const Duration(seconds: 120),
        validateStatus: (status) {
          return status! <= 500;
        }

    );
    dio  = Dio(baseOptions);
  }

  //get Route
  Future<Response> get(String? url) async {
    String uri = "$host$url";
    return dio!.get(uri,
      options: Options(
        headers: await getHeaders()
      )
    );
}
  //post With auth Route
  Future<Response> postWithAuth(String url, body, {CancelToken? token, String? idempotencyKey}) async {
    String uri = "$host$url";
    print(uri);
    return dio!.post(
      uri,
      data: body,
      cancelToken: token,
      options: Options(
        headers: await getHeaders()
      ),
    );
  }

  //post with basic auth
  Future<Response> postWithBasicAuth(String url, body, String username, String password, {CancelToken? token, String? idempotencyKey}) async {
    String uri = "$host$url";
    print(uri);
    return dio!.post(
      uri,
      data: body,
      cancelToken: token,
      options: Options(
          headers: {
            HttpHeaders.acceptHeader: "application/json",
            "channel": "rest",
            HttpHeaders.authorizationHeader: "Basic ${base64Encode(utf8.encode('$username:$password'))}"
          }
      ),
    );
  }
  //post with no auth
  Future<Response> postWithNoAuth(String url, body, {CancelToken? token, String? idempotencyKey}) async {
    String uri = "$host$url";
    print(uri);
    return dio!.post(
      uri,
      data: body,
      cancelToken: token,
      options: Options(
          headers: {
            HttpHeaders.acceptHeader : "application/json"
          }
      ),
    );
  }

  //put with auth
  Future<Response> put (String url, {Map<String, dynamic>? queryParameters, dynamic body,  CancelToken? token}) async {
    String uri = "$host$url";
    print(uri);
    return dio!.put(
        uri,
        data: body,
        options: Options(
          headers: await getHeaders(),
        ),
        queryParameters: queryParameters
    );
  }


}





