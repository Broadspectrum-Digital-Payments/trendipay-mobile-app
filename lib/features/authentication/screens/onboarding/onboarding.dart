import 'dart:async';

import 'package:bdp_payment_app/common/constants/general_repository.dart';
import 'package:bdp_payment_app/common/constants/global_constants.dart';
import 'package:bdp_payment_app/features/authentication/screens/login/login.dart';
import 'package:bdp_payment_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:bdp_payment_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:bdp_payment_app/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding_controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  String sessionId = "";
  String documentSubmitted = "";
  String name = "";

  //handle login
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    // Variable to track the current page index
    int currentPageIndex = 0;

    // Function to update the current page index
    void updatePageIndex(int index) {
      currentPageIndex = index;
    }

    // Listener to update the current page index whenever it changes
    controller.pageController.addListener(() {
      updatePageIndex(controller.pageController.page!.round());
    });

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal scroll pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children:  [
              OnBoardingPage(
                image: BDPImages.onBoardingImage1,
                title: BDPTexts.onBoardingTitle1, currentPageIndex: currentPageIndex,
              ),
              OnBoardingPage(
                image: BDPImages.onBoardingImage2,
                title: BDPTexts.onBoardingTitle2, currentPageIndex: currentPageIndex,
              ),
            ],
          ),
      const OnBoardingNextButton(
              buttonName: BDPTexts.getStarted,
              image: BDPImages.rightArrow,
            ),
        ],
      ),
    );
  }
}