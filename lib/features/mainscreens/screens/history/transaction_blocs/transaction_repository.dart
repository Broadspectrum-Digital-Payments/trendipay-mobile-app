

import 'package:bdp_payment_app/common/constants/http_service.dart';

import '../../../../../common/constants/api_constants.dart';

class TransactionRepository {

  final HttpService http = HttpService();


  //get transaction data by id
  getTransactionHistoryById(int id) async {
    var response = await http.get("${ApiConstants.transactionById}/$id");
    return response;
  }

}