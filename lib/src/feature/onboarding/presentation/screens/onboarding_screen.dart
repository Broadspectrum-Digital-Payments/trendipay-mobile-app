import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/core/services/local_storage_service.dart';
import 'package:bdp_payment_app/src/feature/onboarding/presentation/widgets/onboarding_next_button.dart';
import 'package:bdp_payment_app/src/feature/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/common.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children:  const [
              OnBoardingPage(
                image: BDPImages.onBoardingImage1,
                title: BDPTexts.onBoardingTitle1,
              ),
              OnBoardingPage(
                image: BDPImages.onBoardingImage2,
                title: BDPTexts.onBoardingTitle2,
              ),
            ],
          ),
          OnBoardingNextButton(
            buttonName: BDPTexts.getStarted,
            image: BDPImages.rightArrow,
            onPressed: () async{
              await LocalStorageService().write(kOnboardingCompleted, 'yes');
              if (!context.mounted) return;
              await AppNavigator.pushReplacementNamed(context, AppRoute.loginScreen);
            }
          ),
        ],
      ),
    );
  }
}