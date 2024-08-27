
import '../../../../../core/services/local_storage_service.dart';
import '../../../../../core/services/logger_service.dart';
import '../../domain/models/history/loan_history_model.dart';

abstract class LoanLocalDataSource{
  Future<bool> persistLoans(LoanHistoryModel loanHistory);
  Future<LoanHistoryModel> retrieveLoans();
}

class LoanLocalDataSourceImpl extends LoanLocalDataSource{
  LoanLocalDataSourceImpl({required this.localStorageService,});

  final LocalStorageService localStorageService;

  @override
  Future<bool> persistLoans(LoanHistoryModel loanHistory) async{
    await localStorageService.encodeAndWrite('loans', loanHistory.toJson());
    ZLoggerService.logOnInfo('PERSISTING LOANS');
    return true;
  }

  @override
  Future<LoanHistoryModel> retrieveLoans() async{
    final data = await localStorageService.decodeAndReadMap('loans');
    ZLoggerService.logOnInfo('RETRIEVING LOANS');
    return LoanHistoryModel.fromJson(data);
  }

}