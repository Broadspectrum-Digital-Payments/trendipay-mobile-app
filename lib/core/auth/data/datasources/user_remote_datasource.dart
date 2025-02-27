import 'package:bdp_payment_app/core/services/logger_service.dart';
import 'package:dio/dio.dart';

import '../../../constants/api_routes.dart';
import '../../../errors/error.dart';
import '../../../services/git_it_service_locator.dart';
import '../../../services/http_service_requester.dart';
import '../../../services/local_storage_service.dart';
import '../../domain/models/file/file_model.dart';
import '../../domain/models/user/user_model.dart';

abstract class UserRemoteDataSource{
  Future<UserModel> signup({required Map<String, dynamic> requestBody});
  Future<UserModel> login({required Map<String, dynamic> requestBody});
  Future<String> sendOtp({String? phoneNumber});
  Future<String> verifyOtp({required Map<String, dynamic> requestBody});
  Future<String> changePin({required Map<String, dynamic> requestBody});
  Future<String> forgotPin({required Map<String, dynamic> requestBody});
  Future<List<FileModel>> uploadKYCFile({required Map<String, dynamic> requestBody});
  Future<UserModel> fetchUser();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource{

  UserRemoteDataSourceImpl({required this.httpServiceRequester});

  final HttpServiceRequester httpServiceRequester;



  @override
  Future<UserModel> signup({required Map<String, dynamic> requestBody}) async{
    final response = await httpServiceRequester.postRequest(
      endpoint: ApiRoutes.signup,
      requestBody: requestBody,
    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }

    await sl.get<LocalStorageService>().writeToken(body['data']['bearerToken']??'');
    return UserModel.fromJson(response.data['data']?? {});
  }

  @override
  Future<UserModel> login({required Map<String, dynamic> requestBody}) async {
    final response = await httpServiceRequester.postRequest(
      endpoint: ApiRoutes.login,
      requestBody: requestBody,
    );

    var body = response.data;
    if (body['success'] == false) {
      throw ServerException(message: body['message'] ?? '');
    }

    // Check if the user type is 'customer'
    if (body['data']['type'] != 'customer') {
      throw const ServerException(message: 'Access denied: You are not allowed to use this service.');
    }

    await sl.get<LocalStorageService>().writeToken(body['data']['bearerToken'] ?? '');
    return UserModel.fromJson(response.data['data'] ?? {});
  }


  @override
  Future<String> sendOtp({String? phoneNumber}) async {
    final queryParams = {
      'phoneNumber': phoneNumber,
    };

    try {
      final response = await httpServiceRequester.getRequest(
        endpoint: ApiRoutes.sendOtp,
        queryParam: queryParams,
      );

      ZLoggerService.logOnInfo("Response status code: ${response.statusCode}");

      ZLoggerService.logOnInfo("Response data: ${response.data}");
      var body = response.data;

      if (body == null || body['success'] == false) {
        throw ServerException(message: body?['message'] ?? 'Unknown error');
      }

      return (body['message'] ?? '').toString();
    } catch (e) {
      throw const ServerException(message: 'Failed to send OTP');
    }
  }

  @override
  Future<String> verifyOtp({required Map<String, dynamic> requestBody}) async{
    final response = await httpServiceRequester.postRequest(
      endpoint: ApiRoutes.verifyOtp,
      requestBody: requestBody,
    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }

    return (body['message']?? '').toString();
  }

  @override
  Future<String> changePin({required Map<String, dynamic> requestBody}) async{
    final response = await httpServiceRequester.putRequest(
      endpoint: ApiRoutes.changePin,
      requestBody: requestBody,
    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }

    return (body['message']?? '').toString();
  }

  @override
  Future<String> forgotPin({required Map<String, dynamic> requestBody}) async{
    final response = await httpServiceRequester.putRequest(
      endpoint: ApiRoutes.forgetPin,
      requestBody: requestBody,
    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }

    return (body['message']?? '').toString();
  }

  @override
  Future<List<FileModel>> uploadKYCFile({required Map<String, dynamic> requestBody}) async{
    final response = await httpServiceRequester.postFormDataRequest(
      endpoint: ApiRoutes.uploadKYCFile,
      requestBody: FormData.fromMap(requestBody),
    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }

    return FileList.fromJson(response.data['data']?? []).list;
  }

  @override
  Future<UserModel> fetchUser() async{
    final response = await httpServiceRequester.getRequest(
      endpoint: ApiRoutes.getUser,

    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }

    return UserModel.fromJson(response.data['data']?? {});
  }

}