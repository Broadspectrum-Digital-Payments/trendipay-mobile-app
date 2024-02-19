import 'dart:async';

import 'package:bdp_payment_app/features/authentication/controllers/user_authentication_controller.dart';
import 'package:bdp_payment_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:bdp_payment_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/constants/general_repository.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../login/login.dart';



class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late UserAuthController controller;
  @override
  void initState() {
    controller = UserAuthController(context: context);
    _handleSplashScreen();
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }


  _handleSplashScreen() {
    Timer(const Duration(seconds: 3), (){
      //Get.offAll(const Welcome(), );
      controller.isUserExists().then((value) {
        if (value) {
          return Get.offAll(()=> const NavigationMenu(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 800));
        }
        if (!value) {
          return Get.offAll(()=> const LoginScreen(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 800));
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: BDPColors.white,
      body: Padding(
        padding: EdgeInsets.all(BDPSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(BDPImages.bdpSplashScreen),
              width: 314.31,
              height: 83,
            ),
          ],
        ),
      ),
    );
  }
}