

import '../services/api_config_service.dart';

class ApiRoutes{
  static final String _baseUrl = ApiConfigService.baseURL;

  // AUTH SERVICE
  static get signup => '$_baseUrl/v1/users/register';
  static get login => '$_baseUrl/v1/users/login';
  static get sendOtp => '$_baseUrl/v1/users/otp';
  static get verifyOtp => '$_baseUrl/v1/users/otp/verify';
  static get forgotPassword => '$_baseUrl/auth/api/user/';
  static get resetPassword => '$_baseUrl/auth/api/user/';
  static get logout => '$_baseUrl/auth/api/user/logout';
  static get deleteAccount => '$_baseUrl/auth/api/user/deactivate-account';
  static get updateUser => '$_baseUrl/auth/api/user';
}