import '../../../../../../core/constants/api_routes.dart';
import '../../../../../../core/errors/error.dart';
import '../../../../../../core/services/http_service_requester.dart';
import '../../../../wallet/domain/models/wallet/wallet_model.dart';
import '../../../domain/models/transaction/wallet_transaction_model.dart';

abstract class TransactionRemoteDataSource{
  Future<List<WalletTransactionModel>> fetchTransactions({required Map<String, dynamic> queryParam});
  Future<WalletModel> enquireWalletName({required Map<String, dynamic> queryParam});
}

class TransactionRemoteDataSourceImpl extends TransactionRemoteDataSource{

  TransactionRemoteDataSourceImpl({required this.httpServiceRequester});

  final HttpServiceRequester httpServiceRequester;

  @override
  Future<List<WalletTransactionModel>> fetchTransactions({required Map<String, dynamic> queryParam}) async{
    final response = await httpServiceRequester.getRequest(
      endpoint: ApiRoutes.walletTransaction,
      queryParam: queryParam,
    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }

    return WalletTransactionList.fromJson(response.data['data']?? {}).list;
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