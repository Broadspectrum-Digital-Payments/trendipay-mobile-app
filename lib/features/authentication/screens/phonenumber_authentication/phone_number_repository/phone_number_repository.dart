

import 'package:bdp_payment_app/common/constants/api_constants.dart';
import 'package:bdp_payment_app/common/constants/http_service.dart';

class PhoneNumberRepository {

  HttpService httpService = HttpService();



  //sendOtp
  sendOtp(Map<String, dynamic> body) async {
    var response = await httpService.postWithNoAuth(ApiConstants.generateOtp, body);
    return response;
  }


  //verifyOtp
  verifyOtp(Map<String, dynamic> body) async {
    var response = await httpService.postWithNoAuth(ApiConstants.verifyOtp, body);
    return response;
  }
}