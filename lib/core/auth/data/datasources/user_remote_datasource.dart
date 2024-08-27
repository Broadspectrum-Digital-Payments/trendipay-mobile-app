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
  Future<String> sendOtp({required Map<String, dynamic> requestBody});
  Future<String> verifyOtp({required Map<String, dynamic> requestBody});
  Future<String> changePin({required Map<String, dynamic> requestBody});
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
  Future<UserModel> login({required Map<String, dynamic> requestBody}) async{
    final response = await httpServiceRequester.postRequest(
      endpoint: ApiRoutes.login,
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
  Future<String> sendOtp({required Map<String, dynamic> requestBody}) async{
    final response = await httpServiceRequester.postRequest(
      endpoint: ApiRoutes.sendOtp,
      requestBody: requestBody,
    );

    var body = response.data;
    if(body['success'] == false){
      throw ServerException(message: body['message']?? '');
    }

    return (body['message']?? '').toString();
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