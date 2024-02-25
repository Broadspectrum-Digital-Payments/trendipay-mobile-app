
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../domain/models/amortize/amortize_model.dart';
import '../datasources/loan_local_datasource.dart';
import '../datasources/loan_remote_datasource.dart';

abstract class LoanRepository{
  Future<Either<Failure, AmortizeModel>> requestAmortization({required Map<String, dynamic> queryParams});
  Future<Either<Failure, bool>> applyLoan({required Map<String, dynamic> requestBody});
  Future<Either<Failure, bool>> fetchLoans({required Map<String, dynamic> queryParams});

  ///LOCAL DB
}


class LoanRepositoryImpl extends LoanRepository{
  LoanRepositoryImpl({
    required this.loanRemoteDataSource,
    required this.loanLocalDataSource,
  });

  final LoanRemoteDataSource loanRemoteDataSource;
  final LoanLocalDataSource loanLocalDataSource;

  @override
  Future<Either<Failure, AmortizeModel>> requestAmortization({required Map<String, dynamic> queryParams}) async{
    try{
      final response = await loanRemoteDataSource.requestAmortization(queryParams: queryParams);
      return Right(response);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, bool>> applyLoan({required Map<String, dynamic> requestBody}) async{
    try{
      final response = await loanRemoteDataSource.applyLoan(requestBody: requestBody);
      return Right(response);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, bool>> fetchLoans({required Map<String, dynamic> queryParams}) async{
    try{
      final response = await loanRemoteDataSource.fetchLoans(queryParams: queryParams);
      return Right(response);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

}