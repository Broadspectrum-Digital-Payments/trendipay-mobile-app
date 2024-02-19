import 'package:bdp_payment_app/common/config/providers.dart';
import 'package:bdp_payment_app/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'features/authentication/screens/onboarding/onboarding.dart';




class BDPApp extends StatelessWidget {
const BDPApp({super.key});

@override
Widget build(BuildContext context) {
return ScreenUtilInit(
    designSize: const Size(428, 926),
    minTextAdapt: true,
  builder: (_, child) {
    return MultiBlocProvider(
      providers: providers,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'IBMPlexSans',
        ),
        home: SplashScreen(),
      ),
    );
  }
);
}
}