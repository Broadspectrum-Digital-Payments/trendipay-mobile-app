import '../../../../../core/constants/api_routes.dart';
import '../../../../../core/errors/error.dart';
import '../../../../../core/services/http_service_requester.dart';

abstract class WalletRemoteDataSource{
  Future<bool> topUpWallet({required Map<String, dynamic> requestBody});
}

class WalletRemoteDataSourceImpl extends WalletRemoteDataSource{

  WalletRemoteDataSourceImpl({required this.httpServiceRequester});

  final HttpServiceRequester httpServiceRequester;

  @override
  Future<bool> topUpWallet({required Map<String, dynamic> requestBody}) async{
    final response = await httpServiceRequester.postRequest(
      endpoint: ApiRoutes.topUpWallet,
      requestBody: requestBody,
    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }

    return true;
  }

}