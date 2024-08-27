import 'dart:convert';
import 'package:logger/logger.dart';


class ZLoggerService{
  
  static final _logger = Logger(
    printer: PrettyPrinter(),
  );

  static void logRequests({
    required String endpoint,
    required String method,
    required String realUri,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParam,
    required String statusCode,
    dynamic response,
  }){
    _logger.i('### ENDPOINT: $endpoint ###');
    _logger.i('### URL: $realUri ###');
    _logger.i('### METHOD: $method ###');
    if (body != null) {
      _logger.i('### REQUEST BODY: ${jsonEncode(body)} ###');
    }
    if (queryParam != null) {
      _logger.i('### QUERY PARAMS: ${jsonEncode(queryParam)} ###');
    }

    _logger.i('### STATUS CODE: $statusCode ###');

    _logger.i('### RESPONSE: $response ###');
  }


  static void logOnInfo(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.i(message, error: error, stackTrace: stackTrace,);
  }

  static void logOnDebug(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.d(message, error: error, stackTrace: stackTrace,);
  }

  static void logOnError(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace,);
  }

}