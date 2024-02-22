import '../../../../../../core/constants/api_routes.dart';
import '../../../../../../core/errors/error.dart';
import '../../../../../../core/services/http_service_requester.dart';

abstract class WalletRemoteDataSource{
  // Future<List<WalletTransactionModel>> fetchTransactions({required Map<String, dynamic> queryParam});
}

class WalletRemoteDataSourceImpl extends WalletRemoteDataSource{

  WalletRemoteDataSourceImpl({required this.httpServiceRequester});

  final HttpServiceRequester httpServiceRequester;

  // @override
  // Future<List<WalletTransactionModel>> fetchTransactions({required Map<String, dynamic> queryParam}) async{
  //   final response = await httpServiceRequester.getRequest(
  //     endpoint: ApiRoutes.walletTransaction,
  //     queryParam: queryParam,
  //   );
  //
  //   var body = response.data;
  //   if(body['success'] == false){
  //     throw ServerException(message: body['message']?? '');
  //   }
  //
  //   return WalletTransactionList.fromJson(response.data['data']?? {}).list;
  // }

}