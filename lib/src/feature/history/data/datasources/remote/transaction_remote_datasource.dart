
import '../../../../../../core/constants/api_routes.dart';
import '../../../../../../core/errors/error.dart';
import '../../../../../../core/services/http_service_requester.dart';
import '../../../../wallet/domain/models/wallet/wallet_model.dart';
import '../../../domain/models/history/transaction_history_model.dart';

abstract class TransactionRemoteDataSource{
  Future<TransactionHistoryModel> fetchTransactions({required Map<String, dynamic> queryParam});
  Future<WalletModel> enquireWalletName({required Map<String, dynamic> queryParam});
}

class TransactionRemoteDataSourceImpl extends TransactionRemoteDataSource{

  TransactionRemoteDataSourceImpl({required this.httpServiceRequester});

  final HttpServiceRequester httpServiceRequester;

  @override
  Future<TransactionHistoryModel> fetchTransactions({required Map<String, dynamic> queryParam}) async{
    final response = await httpServiceRequester.getRequest(
      endpoint: ApiRoutes.walletTransaction,
      queryParam: queryParam,
    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }


    return TransactionHistoryModel.fromJson({
      'data': response.data['data'],
      'meta': response.data['meta'],
    });
  }

  @override
  Future<WalletModel> enquireWalletName({required Map<String, dynamic> queryParam}) async{
    final response = await httpServiceRequester.getRequest(
      endpoint: ApiRoutes.walletNameEnquiry,
      queryParam: queryParam,
    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }

    return WalletModel.fromJson(response.data['data']?? {});
  }

}