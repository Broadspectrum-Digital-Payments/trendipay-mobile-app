
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../datasources/local/wallet_local_datasource.dart';
import '../datasources/remote/wallet_remote_datasource.dart';

abstract class WalletRepository{
  // Future<Either<Failure, List<WalletTransactionModel>>> fetchTransactions({required Map<String, dynamic> queryParam});
}


class WalletRepositoryImpl extends WalletRepository{
  WalletRepositoryImpl({
    required this.walletRemoteDataSource,
    required this.walletLocalDataSource,
  });

  final WalletRemoteDataSource walletRemoteDataSource;
  final WalletLocalDataSource walletLocalDataSource;

  // @override
  // Future<Either<Failure, List<WalletTransactionModel>>> fetchTransactions({required Map<String, dynamic> queryParam}) async{
  //   try{
  //     final response = await walletRemoteDataSource.fetchTransactions(queryParam: queryParam);
  //     return Right(response);
  //   }catch(e, s){
  //     return Left(FailureToMessage.returnLeftError(e, s));
  //   }
  // }
}