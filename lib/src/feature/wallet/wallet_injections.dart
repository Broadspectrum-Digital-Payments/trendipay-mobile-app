


import 'package:get_it/get_it.dart';

import 'data/datasources/local/wallet_local_datasource.dart';
import 'data/datasources/remote/wallet_remote_datasource.dart';
import 'data/repositories/wallet_repository.dart';

void initWallet(){
  final sl = GetIt.instance;
    sl.registerLazySingleton<WalletRemoteDataSource>(() => WalletRemoteDataSourceImpl(httpServiceRequester: sl()));
    sl.registerLazySingleton<WalletLocalDataSource>(() => WalletLocalDataSourceImpl(localStorageService: sl()));
    sl.registerLazySingleton<WalletRepository>(() => WalletRepositoryImpl(walletRemoteDataSource: sl(), walletLocalDataSource: sl()));

}