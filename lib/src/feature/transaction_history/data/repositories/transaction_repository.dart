
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../wallet/domain/models/wallet/wallet_model.dart';
import '../../domain/models/history/transaction_history_model.dart';
import '../../domain/models/transaction/transaction_model.dart';
import '../datasources/transaction_local_datasource.dart';
import '../datasources/transaction_remote_datasource.dart';

abstract class TransactionRepository{
  Future<Either<Failure, TransactionHistoryModel>> fetchTransactions({required Map<String, dynamic> queryParam});
  Future<Either<Failure, WalletModel>> enquireWalletName({required Map<String, dynamic> queryParam});
  Future<Either<Failure, TransactionModel>> transferMoney({required Map<String, dynamic> requestBody});

  /// LOCAL DB
  Future<Either<Failure, bool>> persistTransactions(TransactionHistoryModel transactionHistory);
  Future<Either<Failure, TransactionHistoryModel>> retrieveTransactions();
}


class TransactionRepositoryImpl extends TransactionRepository{
  TransactionRepositoryImpl({
    required this.transactionRemoteDataSource,
    required this.transactionLocalDataSource,
  });

  final TransactionRemoteDataSource transactionRemoteDataSource;
  final TransactionLocalDataSource transactionLocalDataSource;

  @override
  Future<Either<Failure, TransactionHistoryModel>> fetchTransactions({required Map<String, dynamic> queryParam}) async{
    try{
      final response = await transactionRemoteDataSource.fetchTransactions(queryParam: queryParam);
      return Right(response);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, WalletModel>> enquireWalletName({required Map<String, dynamic> queryParam}) async{
    try{
      final response = await transactionRemoteDataSource.enquireWalletName(queryParam: queryParam);
      return Right(response);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, TransactionModel>> transferMoney({required Map<String, dynamic> requestBody}) async{
    try{
      final response = await transactionRemoteDataSource.transferMoney(requestBody: requestBody);
      return Right(response);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, bool>> persistTransactions(TransactionHistoryModel transactionHistory) async{
    try{
      await transactionLocalDataSource.persistTransactions(transactionHistory);
      return const Right(true);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, TransactionHistoryModel>> retrieveTransactions() async{
    try{
      final response = await transactionLocalDataSource.retrieveTransactions();
      return Right(response);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }
}