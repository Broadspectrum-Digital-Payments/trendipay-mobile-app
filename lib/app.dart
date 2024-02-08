import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/authentication/screens/onboarding/onboarding.dart';




class BDPApp extends StatelessWidget {
const BDPApp({super.key});

@override
Widget build(BuildContext context) {
return GetMaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    fontFamily: 'IBMPlexSans',
  ),
  home: const OnboardingScreen(),
);
}
}