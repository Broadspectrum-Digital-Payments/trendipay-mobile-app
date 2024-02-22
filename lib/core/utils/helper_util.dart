
import 'package:flutter/material.dart';

import '../routing/app_navigator.dart';
import '../routing/app_route.dart';
import '../services/git_it_service_locator.dart';
import '../services/local_storage_service.dart';

class HelperUtil{

  static void onLogout(BuildContext context){
    sl.get<LocalStorageService>().clearOnLogout();
    AppNavigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);
  }

}