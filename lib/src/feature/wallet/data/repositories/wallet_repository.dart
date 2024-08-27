
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../datasources/wallet_local_datasource.dart';
import '../datasources/wallet_remote_datasource.dart';

abstract class WalletRepository{
  Future<Either<Failure, bool>> topUpWallet({required Map<String, dynamic> requestBody});
}


class WalletRepositoryImpl extends WalletRepository{
  WalletRepositoryImpl({
    required this.walletRemoteDataSource,
    required this.walletLocalDataSource,
  });

  final WalletRemoteDataSource walletRemoteDataSource;
  final WalletLocalDataSource walletLocalDataSource;

  @override
  Future<Either<Failure, bool>> topUpWallet({required Map<String, dynamic> requestBody}) async{
    try{
      final response = await walletRemoteDataSource.topUpWallet(requestBody: requestBody);
      return Right(response);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }
}