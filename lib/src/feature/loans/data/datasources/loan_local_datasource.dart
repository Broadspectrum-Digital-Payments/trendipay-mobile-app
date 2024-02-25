
import '../../../../../core/services/local_storage_service.dart';

abstract class LoanLocalDataSource{
}

class LoanLocalDataSourceImpl extends LoanLocalDataSource{
  LoanLocalDataSourceImpl({required this.localStorageService,});

  final LocalStorageService localStorageService;

}