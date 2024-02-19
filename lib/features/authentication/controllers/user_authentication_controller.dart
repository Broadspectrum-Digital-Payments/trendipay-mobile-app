

import 'package:bdp_payment_app/common/constants/global_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/constants/general_repository.dart';
import '../../../navigation_menu.dart';
import '../screens/login/login.dart';

class UserAuthController {

  final BuildContext context;
  UserAuthController({required this.context});


  Future<bool> isUserExists() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool exists = false;
    var sessionId = _prefs.getString(GeneralRepository.sessionKey) ?? "";
    var name = _prefs.getString(GeneralRepository.name) ?? "";
    if (name.isNotEmpty && sessionId.isEmpty) {
      exists = false;
    }else if(sessionId.isNotEmpty) {
     exists = true;
    }
    return exists;
  }
}