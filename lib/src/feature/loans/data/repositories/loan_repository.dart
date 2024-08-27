
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../domain/models/amortize/amortize_model.dart';
import '../../domain/models/document/loan_document_model.dart';
import '../../domain/models/history/loan_history_model.dart';
import '../../domain/models/loan/loan_model.dart';
import '../datasources/loan_local_datasource.dart';
import '../datasources/loan_remote_datasource.dart';

abstract class LoanRepository{
  Future<Either<Failure, AmortizeModel>> requestAmortization({required Map<String, dynamic> queryParams});
  Future<Either<Failure, LoanModel>> applyLoan({required String userExternalId, required Map<String, dynamic> requestBody});
  Future<Either<Failure, LoanHistoryModel>> fetchLoans({required String userExternalId, required Map<String, dynamic> queryParams});
  Future<Either<Failure, LoanDocumentModel>> uploadLoanDocument({required String loanExternalId, required Map<String, dynamic> requestBody});

  ///LOCAL DB
 Future<Either<Failure, bool>> persistLoans(LoanHistoryModel loanHistory);
 Future<Either<Failure, LoanHistoryModel>> retrieveLoans();
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
  Future<Either<Failure, LoanModel>> applyLoan({required String userExternalId, required Map<String, dynamic> requestBody}) async{
    try{
      final response = await loanRemoteDataSource.applyLoan(userExternalId: userExternalId, requestBody: requestBody);
      return Right(response);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, LoanHistoryModel>> fetchLoans({required String userExternalId, required Map<String, dynamic> queryParams}) async{
    try{
      final response = await loanRemoteDataSource.fetchLoans(userExternalId: userExternalId, queryParams: queryParams);
      return Right(response);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, LoanDocumentModel>> uploadLoanDocument({required String loanExternalId, required Map<String, dynamic> requestBody}) async{
    try{
      final response = await loanRemoteDataSource.uploadLoanDocument(loanExternalId: loanExternalId, requestBody: requestBody);
      return Right(response);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, bool>> persistLoans(LoanHistoryModel loanHistory) async{
    try{
      await loanLocalDataSource.persistLoans(loanHistory);
      return const Right(true);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

  @override
  Future<Either<Failure, LoanHistoryModel>> retrieveLoans() async{
    try{
      final response = await loanLocalDataSource.retrieveLoans();
      return Right(response);
    }catch(e, s){
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

}