

import 'package:bdp_payment_app/common/constants/http_service.dart';

import '../../../../../common/constants/api_constants.dart';

class WalletRepository {
  HttpService http = HttpService();

  get httpService => null;


  //transfer amount
  startTopUp(Map<String, dynamic> body) async {
    var response =
    await http.postWithAuth(ApiConstants.systemPayment, body);
    return response;
  }

  //confirm transfer amount
  validateTopUp(Map<String, dynamic> body) async {
    var response =
    await http.postWithAuth(ApiConstants.confirmSystemPayment, body);
    return response;
  }
}