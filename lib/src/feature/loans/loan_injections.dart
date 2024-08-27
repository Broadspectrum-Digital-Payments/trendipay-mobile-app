


import 'package:get_it/get_it.dart';

import 'data/datasources/loan_local_datasource.dart';
import 'data/datasources/loan_remote_datasource.dart';
import 'data/repositories/loan_repository.dart';

void intLoan(){
  final sl = GetIt.instance;
    sl.registerLazySingleton<LoanRemoteDataSource>(() => LoanRemoteDataSourceImpl(httpServiceRequester: sl()));
    sl.registerLazySingleton<LoanLocalDataSource>(() => LoanLocalDataSourceImpl(localStorageService: sl()));
    sl.registerLazySingleton<LoanRepository>(() => LoanRepositoryImpl(loanRemoteDataSource: sl(), loanLocalDataSource: sl()));

}