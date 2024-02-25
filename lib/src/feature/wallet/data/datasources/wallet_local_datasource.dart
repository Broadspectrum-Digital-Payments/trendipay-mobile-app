

import '../../../../../core/services/local_storage_service.dart';

abstract class WalletLocalDataSource{
}

class WalletLocalDataSourceImpl extends WalletLocalDataSource{
  WalletLocalDataSourceImpl({required this.localStorageService,});

  final LocalStorageService localStorageService;
}