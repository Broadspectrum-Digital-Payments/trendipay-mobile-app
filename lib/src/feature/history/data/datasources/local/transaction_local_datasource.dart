

import '../../../../../../core/services/local_storage_service.dart';

abstract class TransactionLocalDataSource{
}

class TransactionLocalDataSourceImpl extends TransactionLocalDataSource{
  TransactionLocalDataSourceImpl({required this.localStorageService,});

  final LocalStorageService localStorageService;
}