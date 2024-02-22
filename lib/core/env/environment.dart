

import 'env.dart';

class Environment{

  static bool get inDevMode  => !Env.production;

  static String get getLiveBaseUrl => Env.liveBaseUrl;

  static String get getStagingBaseUrl => Env.stagingBaseUrl;


  static String get getBaseUrl => inDevMode? getStagingBaseUrl : getLiveBaseUrl;


}