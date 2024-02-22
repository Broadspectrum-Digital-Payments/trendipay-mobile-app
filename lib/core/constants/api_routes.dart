

import '../services/api_config_service.dart';

class ApiRoutes{
  static final String _baseUrl = ApiConfigService.baseURL;

  // AUTH SERVICE
  static get signup => '$_baseUrl/api/mobile/v1/user/register';
  static get login => '$_baseUrl/api/mobile/v1/user/login';
  static get forgotPassword => '$_baseUrl/auth/api/user/';
  static get resetPassword => '$_baseUrl/auth/api/user/';
  static get logout => '$_baseUrl/auth/api/user/logout';
  static get deleteAccount => '$_baseUrl/auth/api/user/deactivate-account';
  static get updateUser => '$_baseUrl/auth/api/user';
}