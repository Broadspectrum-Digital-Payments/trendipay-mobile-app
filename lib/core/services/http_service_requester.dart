
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retry/retry.dart';

import '../env/environment.dart';
import '../errors/errors.dart';
import '../services/api_config_service.dart';
import '../services/logger_service.dart';
import '../services/network_connection_service.dart';

class HttpServiceRequester{
  static final HttpServiceRequester _httpServiceRequester = HttpServiceRequester._internal();
  factory HttpServiceRequester() => _httpServiceRequester;
  HttpServiceRequester._internal();

  final dio = Dio();

  Future<Response> postRequest({
    required String endpoint,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParam,
  }) async {
    if (await NetworkConnectionService.isConnected) {
      final headers = await ApiConfigService.getHttpHeaders();
      final cancelToken = CancelToken();
      dio.options.headers = headers;
      dio.options.followRedirects = false;
      final response = await dio.post<dynamic>(
        endpoint,
        data: json.encode(requestBody),
        queryParameters: queryParam,
        options: Options(
          headers: headers,
        ),
        cancelToken: cancelToken,
      ).timeout(const Duration(seconds: 60));

      if(Environment.inDevMode) {
          ZLoggerService.logRequests(
          endpoint: endpoint,
          method: 'POST',
          realUri: response.realUri.toString(),
          body: requestBody,
          queryParam: queryParam,
          statusCode: response.statusCode.toString(),
          response: response.data
        );
      }

      return response;
    } else {
      throw NoInternetException();
    }
  }


  Future<Response> putRequest({
    required String endpoint,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParam,
  }) async {
    if (await NetworkConnectionService.isConnected) {
      final headers = await ApiConfigService.getHttpHeaders();
      final cancelToken = CancelToken();

      dio.options.headers = headers;
      dio.options.followRedirects = false;
      final response = await dio.put<dynamic>(
        endpoint,
        data: json.encode(requestBody),
        queryParameters: queryParam,
        options: Options(
          headers: headers,
        ),
        cancelToken: cancelToken,
      ).timeout(const Duration(seconds: 60));

      if(Environment.inDevMode) {
          ZLoggerService.logRequests(
          endpoint: endpoint,
          method: 'PUT',
          realUri: response.realUri.toString(),
          body: requestBody,
          queryParam: queryParam,
          statusCode: response.statusCode.toString(),
          response: response.data,
        );
      }

      return response;
    } else {
      throw NoInternetException();
    }
  }


  Future<Response> getRequest({
    required String endpoint,
    Map<String, dynamic>? queryParam,
  }) async {
    if(await NetworkConnectionService.isConnected){
      final headers = await ApiConfigService.getHttpHeaders();
      final response = await retry(() => dio.get<dynamic>(
        endpoint,
        options: Options(
          headers: headers,
        ),
        queryParameters: queryParam,
      ).timeout(const Duration(seconds: 60)),
        retryIf: (e) =>
        e is SocketException ||
            e is TimeoutException ||
            (e is DioException &&
                (e.type == DioExceptionType.connectionTimeout ||
                    e.type == DioExceptionType.sendTimeout ||
                    e.type == DioExceptionType.receiveTimeout)),
      );

      if(Environment.inDevMode) {
        ZLoggerService.logRequests(
        endpoint: endpoint,
        method: 'GET',
        realUri: response.realUri.toString(),
        queryParam: queryParam,
        statusCode: response.statusCode.toString(),
        response: response.data
      );
      }

      return response;

    } else {
      throw NoInternetException();
    }
  }


  Future<Response> deleteRequest({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParam,
  }) async {
    if (await NetworkConnectionService.isConnected) {
      final headers = await ApiConfigService.getHttpHeaders();

      dio.options.headers = headers;
      final response = await dio.delete<dynamic>(
        endpoint,
        data: body,
        queryParameters: queryParam,
        options: Options(
          headers: headers,
        ),
      ).timeout(const Duration(seconds: 60));

      if(Environment.inDevMode) {
        ZLoggerService.logRequests(
        endpoint: endpoint,
        method: 'DELETE',
        realUri: response.realUri.toString(),
        queryParam: queryParam,
        statusCode: response.statusCode.toString(),
      );
      }

      return response;
    } else {
      throw NoInternetException();
    }
  }


  Future<Response> postFormDataRequest({
    required String endpoint,
    FormData? requestBody,
    Map<String, dynamic>? queryParam,
  }) async {

    if (await NetworkConnectionService.isConnected) {
      final headers = await ApiConfigService.getHttpHeaders();
      final cancelToken = CancelToken();
      dio.options.headers = headers;
      dio.options.followRedirects = false;
      final response = await dio.post<dynamic>(
        endpoint,
        data: requestBody,
        queryParameters: queryParam,
        options: Options(
          headers: headers,
        ),
        cancelToken: cancelToken,
      ).timeout(const Duration(seconds: 60));

      if(Environment.inDevMode) {
        ZLoggerService.logRequests(
            endpoint: endpoint,
            method: 'POST',
            realUri: response.realUri.toString(),
            body: {},
            queryParam: queryParam,
            statusCode: response.statusCode.toString(),
            response: response.data
        );
      }

      return response;
    } else {
      throw NoInternetException();
    }
  }

}