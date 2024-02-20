

import 'package:bdp_payment_app/common/constants/api_constants.dart';
import 'package:bdp_payment_app/common/constants/http_service.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_blocs.dart';

class NavigationMenuRepository {

  HttpService httpService = HttpService();


  //this function is to get all the transaction history
  getTransactionHistory() async {
    var response = await httpService.get(ApiConstants.transactionHistory);
    return response;
  }


}