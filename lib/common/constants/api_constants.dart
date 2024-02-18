
class ApiConstants {
  static const baseUrl = "http://api.bsl.com.gh:8080/rest/";


  //generate otp
  static const generateOtp = "members/registration/generate-otp";


  //verify otp endpoint
  static const verifyOtp = "members/registration/verify-otp";


  //registration
  static const registration = "members/registration";

  static const login = "access/login";

  static const submitDocuments = "members/self/documents";

  static const changePin = "members/self/pin";

  static const memberPayment = "payments/member-payment";

  static const confirmMemberPayment = "payments/confirm/member-payment";

  static const systemPayment = "payments/system-payment";

  static const confirmSystemPayment = "payments/confirm/system-payment";


  static const transactionHistory = "accounts/default/history";

  static const transactionById = "accounts/transfer-data/";
}