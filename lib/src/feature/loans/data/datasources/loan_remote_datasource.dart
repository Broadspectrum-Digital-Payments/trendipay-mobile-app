
import '../../../../../core/constants/api_routes.dart';
import '../../../../../core/errors/error.dart';
import '../../../../../core/services/http_service_requester.dart';
import '../../domain/models/amortize/amortize_model.dart';

abstract class LoanRemoteDataSource{
  Future<AmortizeModel> requestAmortization({required Map<String, dynamic> queryParams});
}

class LoanRemoteDataSourceImpl extends LoanRemoteDataSource{

  LoanRemoteDataSourceImpl({required this.httpServiceRequester});

  final HttpServiceRequester httpServiceRequester;

  @override
  Future<AmortizeModel> requestAmortization({required Map<String, dynamic> queryParams}) async{
    final response = await httpServiceRequester.getRequest(
      endpoint: ApiRoutes.amortization,
      queryParam: queryParams,
    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }

    return AmortizeModel.fromJson(response.data['data']?? {});
  }
}