
import 'package:dio/dio.dart';

import '../../../../../core/constants/api_routes.dart';
import '../../../../../core/errors/error.dart';
import '../../../../../core/services/http_service_requester.dart';
import '../../domain/models/amortize/amortize_model.dart';
import '../../domain/models/document/loan_document_model.dart';
import '../../domain/models/loan/loan_model.dart';

abstract class LoanRemoteDataSource{
  Future<AmortizeModel> requestAmortization({required Map<String, dynamic> queryParams});
  Future<LoanModel> applyLoan({required String userExternalId, required Map<String, dynamic> requestBody});
  Future<List<LoanModel>> fetchLoans({required String userExternalId, required Map<String, dynamic> queryParams});
  Future<LoanDocumentModel> uploadLoanDocument({required String loanExternalId, required Map<String, dynamic> requestBody});
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

    return AmortizeModel.fromJson(body['data']?? {});
  }

  @override
  Future<LoanModel> applyLoan({required String userExternalId, required Map<String, dynamic> requestBody}) async{
    final response = await httpServiceRequester.postRequest(
      endpoint: ApiRoutes.loans(userExternalId),
      requestBody: requestBody,
    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }

    return LoanModel.fromJson(body['loan']?? {});
  }

  @override
  Future<List<LoanModel>> fetchLoans({required String userExternalId, required Map<String, dynamic> queryParams}) async{
    final response = await httpServiceRequester.getRequest(
      endpoint: ApiRoutes.loans(userExternalId),
      queryParam: queryParams,
    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }

    return LoanList.fromJson(body['data']['loans']?? []).list;
  }

  @override
  Future<LoanDocumentModel> uploadLoanDocument({required String loanExternalId, required Map<String, dynamic> requestBody}) async{
    final response = await httpServiceRequester.postFormDataRequest(
      endpoint: ApiRoutes.loanDocument(loanExternalId),
      requestBody: FormData.fromMap(requestBody),
    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }

    return LoanDocumentModel.fromJson(body['data']['document']?? {});
  }
}