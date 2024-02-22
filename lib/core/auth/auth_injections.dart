


import 'package:get_it/get_it.dart';

import 'datasources/local/user_local_datasource.dart';
import 'datasources/remote/user_remote_datasource.dart';
import 'repositories/user_repository.dart';

void initAuth(){
  final sl = GetIt.instance;
    sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(httpServiceRequester: sl()));
    sl.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(localStorageService: sl()));
    sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userRemoteDataSource: sl(), userLocalDataSource: sl()));

}