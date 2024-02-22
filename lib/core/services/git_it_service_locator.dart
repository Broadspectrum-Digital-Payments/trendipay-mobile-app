


import 'package:get_it/get_it.dart';

import '../auth/auth_injections.dart';
import 'http_service_requester.dart';
import 'local_storage_service.dart';

GetIt sl = GetIt.instance;

void setUpGetItServiceLocator(){
  // GeocodingService
  sl.registerSingleton<LocalStorageService>(LocalStorageService());
  // sl.registerSingleton<LocalNotificationService>(LocalNotificationService());
  // sl.registerLazySingleton<PushNotificationService>(() => PushNotificationService());
  // sl.registerLazySingleton<RemoteConfigService>(() => RemoteConfigService());
  sl.registerLazySingleton(() => HttpServiceRequester());

  initAuth();

}