import 'package:bdp_payment_app/common/constants/api_constants.dart';
import 'package:bdp_payment_app/common/constants/http_service.dart';

class TransferRepository {
  HttpService httpService = HttpService();

  //transfer amount
  startTransfer(Map<String, dynamic> body) async {
    var response =
        await httpService.postWithAuth(ApiConstants.memberPayment, body);
    return response;
  }

  //confirm transfer amount
  validateTransfer(Map<String, dynamic> body) async {
    var response =
        await httpService.postWithAuth(ApiConstants.confirmMemberPayment, body);
    return response;
  }
}
