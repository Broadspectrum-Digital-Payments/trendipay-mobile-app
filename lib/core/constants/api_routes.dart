

import '../services/api_config_service.dart';

class ApiRoutes{
  static final String _baseUrl = ApiConfigService.baseURL;
  static final String _loanBaseUrl = ApiConfigService.loanBaseURL;

  /// USER
  static get signup => '$_baseUrl/v1/register';
  static get login => '$_baseUrl/v1/login';
  static get sendOtp => '$_baseUrl/v1/otp';
  static get verifyOtp => '$_baseUrl/v1/otp';
  static get forgetPin => '$_baseUrl/v1/users/pin';
  static get changePin => '$_baseUrl/v1/pin';
  static get uploadKYCFile => '$_baseUrl/v1/kyc';
  static get getUser => '$_baseUrl/v1/me';

  /// TRANSACTIONS
  static get walletTransaction => '$_baseUrl/v1/transactions';
  static get transferMoney => '$_baseUrl/v1/transfers';
  static get topUpWallet => '$_baseUrl/v1/payments';
  static get makePurchase => '$_baseUrl/v1/purchases';
  static get walletNameEnquiry => '$_baseUrl/v1/users/name-enquiry';

  /// LOANS
  static get amortization => '$_loanBaseUrl/v1/amortization';
  static loans(userExternalId) => '$_loanBaseUrl/v1/borrowers/$userExternalId/loans';
  static loanDocument(loanExternalId) => '$_loanBaseUrl/v1/loans/$loanExternalId/files';
}