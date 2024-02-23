


import 'package:get_it/get_it.dart';

import 'presentation/data/datasources/local/transaction_local_datasource.dart';
import 'presentation/data/datasources/remote/transaction_remote_datasource.dart';
import 'presentation/data/repositories/transaction_repository.dart';

void initTransactions(){
  final sl = GetIt.instance;
    sl.registerLazySingleton<TransactionRemoteDataSource>(() => TransactionRemoteDataSourceImpl(httpServiceRequester: sl()));
    sl.registerLazySingleton<TransactionLocalDataSource>(() => TransactionLocalDataSourceImpl(localStorageService: sl()));
    sl.registerLazySingleton<TransactionRepository>(() => TransactionRepositoryImpl(transactionRemoteDataSource: sl(), transactionLocalDataSource: sl()));

}