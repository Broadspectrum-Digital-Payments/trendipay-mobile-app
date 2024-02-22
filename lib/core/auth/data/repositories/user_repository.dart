
import 'package:dartz/dartz.dart';

import '../../../errors/failure.dart';
import '../datasources/local/user_local_datasource.dart';
import '../datasources/remote/user_remote_datasource.dart';
import '../../domain/models/user/user_model.dart';

abstract class UserRepository{
  Future<Either<Failure, UserModel>> signup({required Map<String, dynamic> requestBody});
  Future<Either<Failure, UserModel>> login({required Map<String, dynamic> requestBody});
  Future<bool> isLoggedIn();
  Future<Either<Failure, String>> forgotPassword({required Map<String, dynamic> requestBody});
  Future<Either<Failure, bool>> resetPassword({required Map<String, dynamic> requestBody});
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, bool>> deleteAccount({required Map<String, dynamic> requestBody});
  Future<Either<Failure, UserModel>> updateUser({ required Map<String, dynamic> requestBody });
  Future<Either<Failure, UserModel>> retrieveUser();
  Future<Either<Failure, bool>> persistUser(UserModel user);
}


class UserRepositoryImpl extends UserRepository{
  UserRepositoryImpl({
    required this.userRemoteDataSource,
    required this.userLocalDataSource,
  });

  final UserRemoteDataSource userRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;



  @override
  Future<Either<Failure, UserModel>> signup({required Map<String, dynamic> requestBody}) async{
    try{
      final response = await userRemoteDataSource.signup(requestBody: requestBody);
      return Right(response);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login({required Map<String, dynamic> requestBody}) async{
    try{
      final response = await userRemoteDataSource.login(requestBody: requestBody);
      return Right(response);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<bool> isLoggedIn() async => await userLocalDataSource.isLoggedIn();

  @override
  Future<Either<Failure, String>> forgotPassword({ required Map<String, dynamic> requestBody }) async{
    try {
      final response = await userRemoteDataSource.forgotPassword(requestBody: requestBody);
      return Right(response);
    } catch (e, s) {
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword({ required Map<String, dynamic> requestBody }) async{
    try {
      final response = await userRemoteDataSource.resetPassword(requestBody: requestBody);
      return Right(response);
    } catch (e, s) {
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async{
    try {
      final response = await userRemoteDataSource.logout();
      return Right(response);
    } catch (e) {
      return Left(FailureToMessage.returnLeftError(e));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAccount({required Map<String, dynamic> requestBody}) async{
    try {
      final response = await userRemoteDataSource.deleteAccount(requestBody: requestBody);
      return Right(response);
    } catch (e, s) {
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUser({ required Map<String, dynamic> requestBody }) async{
    try {
      final response = await userRemoteDataSource.updateUser(requestBody: requestBody);
      return Right(response);
    } catch (e, s) {
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, UserModel>> retrieveUser() async{
    try {
      final response = await userLocalDataSource.retrieveUser();
      return Right(response);
    } catch (e, s) {
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, bool>> persistUser(UserModel user) async{
    try {
      await userLocalDataSource.persistUser(user);
      return const Right(true);
    } catch (e, s) {
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }
}