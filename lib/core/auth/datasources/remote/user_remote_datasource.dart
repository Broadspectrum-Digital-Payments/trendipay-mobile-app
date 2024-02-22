import '../../../constants/api_routes.dart';
import '../../../errors/error.dart';
import '../../../services/git_it_service_locator.dart';
import '../../../services/http_service_requester.dart';
import '../../../services/local_storage_service.dart';
import '../../models/user/user_model.dart';

abstract class UserRemoteDataSource{
  Future<UserModel> signup({required Map<String, dynamic> requestBody});
  Future<UserModel> login({required Map<String, dynamic> requestBody});
  Future<String> forgotPassword({required Map<String, dynamic> requestBody});
  Future<bool> resetPassword({ required Map<String, dynamic> requestBody });
  Future<bool> logout();
  Future<bool> deleteAccount({ required Map<String, dynamic> requestBody });
  Future<UserModel> updateUser({ required Map<String, dynamic> requestBody });
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
  Future<String> forgotPassword({ required Map<String, dynamic> requestBody }) async{
    final response = await httpServiceRequester.postRequest(
      endpoint: ApiRoutes.forgotPassword,
      requestBody: requestBody,
    );
    var body = response.data;
    if(body['success'] != null && !body['success']){
      throw ServerException(message: body['message']?? '');
    }

    return body['data']['code'];
  }

  @override
  Future<bool> resetPassword({ required Map<String, dynamic> requestBody }) async{
    final response = await httpServiceRequester.postRequest(
      endpoint: ApiRoutes.resetPassword,
      requestBody: requestBody,
    );
    var body = response.data;
    if(body['success'] != null && !body['success']){
      throw ServerException(message: body['message']?? '');
    }

    return true;
  }

  @override
  Future<bool> logout() async{
    final response = await httpServiceRequester.postRequest(
      endpoint: ApiRoutes.logout,
    );
    var body = response.data;
    if(body['success'] != null && !body['success']){
      throw ServerException(message: body['message']?? '');
    }

    return true;
  }

  @override
  Future<bool> deleteAccount({ required Map<String, dynamic> requestBody }) async{
    await httpServiceRequester.postRequest(
      endpoint: ApiRoutes.deleteAccount, requestBody: requestBody,
    );

    return true;
  }

  @override
  Future<UserModel> updateUser({ required Map<String, dynamic> requestBody }) async{
    final response = await httpServiceRequester.putRequest(
      endpoint: ApiRoutes.updateUser, requestBody: requestBody,
    );

    var body = response.data;
    if(body['success'] != null && !body['success']){
      throw ServerException(message: body['message']?? '');
    }

    return UserModel.fromJson(body['data']?? {});
  }

}