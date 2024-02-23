
import 'package:dartz/dartz.dart';

import '../../../errors/failure.dart';
import '../../domain/models/file/file_model.dart';
import '../datasources/local/user_local_datasource.dart';
import '../datasources/remote/user_remote_datasource.dart';
import '../../domain/models/user/user_model.dart';

abstract class UserRepository{
  Future<Either<Failure, UserModel>> signup({required Map<String, dynamic> requestBody});
  Future<Either<Failure, UserModel>> login({required Map<String, dynamic> requestBody});
  Future<bool> isLoggedIn();
  Future<Either<Failure, String>> sendOtp({required Map<String, dynamic> requestBody});
  Future<Either<Failure, String>> verifyOtp({required Map<String, dynamic> requestBody});
  Future<Either<Failure, String>> changePin({required Map<String, dynamic> requestBody});
  Future<Either<Failure, List<FileModel>>> uploadKYCFile({required Map<String, dynamic> requestBody});
  Future<Either<Failure, UserModel>> fetchUser();

  ///LOCAL DB
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

  @override
  Future<Either<Failure, String>> sendOtp({required Map<String, dynamic> requestBody}) async{
    try {
      final response = await userRemoteDataSource.sendOtp(requestBody: requestBody);
      return Right(response);
    } catch (e) {
      return Left(FailureToMessage.returnLeftError(e));
    }
  }

  @override
  Future<Either<Failure, String>> verifyOtp({required Map<String, dynamic> requestBody}) async{
    try {
      final response = await userRemoteDataSource.verifyOtp(requestBody: requestBody);
      return Right(response);
    } catch (e) {
      return Left(FailureToMessage.returnLeftError(e));
    }
  }

  @override
  Future<Either<Failure, String>> changePin({required Map<String, dynamic> requestBody}) async{
    try {
      final response = await userRemoteDataSource.changePin(requestBody: requestBody);
      return Right(response);
    } catch (e) {
      return Left(FailureToMessage.returnLeftError(e));
    }
  }

  @override
  Future<Either<Failure, List<FileModel>>> uploadKYCFile({required Map<String, dynamic> requestBody}) async{
    try {
      final response = await userRemoteDataSource.uploadKYCFile(requestBody: requestBody);
      return Right(response);
    } catch (e) {
      return Left(FailureToMessage.returnLeftError(e));
    }
  }

  @override
  Future<Either<Failure, UserModel>> fetchUser() async{
    try {
      final response = await userRemoteDataSource.fetchUser();
      return Right(response);
    } catch (e) {
      return Left(FailureToMessage.returnLeftError(e));
    }
  }
}