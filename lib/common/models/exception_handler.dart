

import 'package:dio/dio.dart';

class DioExceptionHandler {

  static String getMessage(DioException error) {
    if (error.type == DioExceptionType.badResponse) {
      return 'There was a problem with the server response. Try again';
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return 'Receive timeout. Try again';
    } else if (error.type == DioExceptionType.sendTimeout) {
      return 'Send timeout. Try again.';
    } else if (error.type == DioExceptionType.connectionError) {
      return 'Connection error. Try again';
    }else if (error.type == DioExceptionType.connectionTimeout) {
      return 'Connection timeout. Try again';
    }
    else if (error.type == DioExceptionType.cancel) {
      return 'Request cancelled';
    } else if (error.type == DioExceptionType.unknown) {
      return 'A connection error occurred. Try again';
    }
    return 'Unknown error';
  }
}