

import '../../../../../core/services/local_storage_service.dart';
import '../../../../../core/services/logger_service.dart';
import '../../domain/models/history/transaction_history_model.dart';

abstract class TransactionLocalDataSource{
  Future<bool> persistTransactions(TransactionHistoryModel transactionHistory);
  Future<TransactionHistoryModel> retrieveTransactions();
}

class TransactionLocalDataSourceImpl extends TransactionLocalDataSource{
  TransactionLocalDataSourceImpl({required this.localStorageService,});

  final LocalStorageService localStorageService;

  @override
  Future<bool> persistTransactions(TransactionHistoryModel transactionHistory) async{
    await localStorageService.encodeAndWrite('transactions', transactionHistory.toJson());
    ZLoggerService.logOnInfo('PERSISTING TRANSACTIONS');
    return true;
  }

  @override
  Future<TransactionHistoryModel> retrieveTransactions() async{
    final data = await localStorageService.decodeAndReadMap('transactions');
    ZLoggerService.logOnInfo('RETRIEVING TRANSACTIONS');
    return TransactionHistoryModel.fromJson(data);
  }
}