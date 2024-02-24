import 'dart:async';

import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/services/local_storage_service.dart';
import 'package:bdp_payment_app/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../../core/routing/app_route.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/view_models/user_view_model.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleSplashScreen();
    });
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: BDPColors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(BDPSizes.defaultSpace),
          child: Image(
            image: AssetImage(BDPImages.bdpSplashScreen),
            width: 314.31,
            height: 83,
          ),
        ),
      ),
    );
  }


  _handleSplashScreen() {
    Timer(const Duration(seconds: 3), () async{
      if(await context.read<UserViewModel>().isLoggedIn()){
        if(!mounted) return;
        await context.read<UserViewModel>().initState();

        if(!mounted) return;
        AppNavigator.pushReplacementNamed(context, AppRoute.homeScreen);
        return;
      }
      final completeOnboarding = await LocalStorageService().read(kOnboardingCompleted);
      if(completeOnboarding == 'yes'){
        if(!mounted) return;
        AppNavigator.pushReplacementNamed(context, AppRoute.loginScreen);
        return;
      }

      if(!mounted) return;
      AppNavigator.pushReplacementNamed(context, AppRoute.onboardingScreen);
    });
  }
}