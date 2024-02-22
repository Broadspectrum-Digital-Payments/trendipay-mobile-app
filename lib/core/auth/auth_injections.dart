


import 'package:get_it/get_it.dart';

import 'data/datasources/local/user_local_datasource.dart';
import 'data/datasources/remote/user_remote_datasource.dart';
import 'data/repositories/user_repository.dart';

void initAuth(){
  final sl = GetIt.instance;
    sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(httpServiceRequester: sl()));
    sl.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(localStorageService: sl()));
    sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userRemoteDataSource: sl(), userLocalDataSource: sl()));

}