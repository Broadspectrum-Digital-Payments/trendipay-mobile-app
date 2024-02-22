

import '../services/api_config_service.dart';

class ApiRoutes{
  static final String _baseUrl = ApiConfigService.baseURL;

  /// USER
  static get signup => '$_baseUrl/v1/users/register';
  static get login => '$_baseUrl/v1/users/login';
  static get sendOtp => '$_baseUrl/v1/users/otp';
  static get verifyOtp => '$_baseUrl/v1/users/otp/verify';
  static get changePin => '$_baseUrl/v1/users/change-pin';
  static get uploadSelfie => '$_baseUrl/v1/users/kyc';

  /// TRANSACTIONS
  static get walletTransaction => '$_baseUrl/v1/transactions';
  static get walletNameEnquiry => '$_baseUrl/v1/users/name-enquiry';
}