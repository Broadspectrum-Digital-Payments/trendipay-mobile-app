import 'package:bdp_payment_app/common/constants/general_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../common/constants/global_constants.dart';
import '../../../src/feature/auth/presentation/login/login_screen.dart';


class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  ///variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs ;

  void updatePageIndicator(int index) => currentPageIndex.value = index;

  void nextPage(){
    if(currentPageIndex.value == 1 || currentPageIndex.value ==0 ){
      Get.offAll(const LoginScreen());
      GlobalConstants.storageService.setString(GeneralRepository.onboardingCompleted, "Yes");

    }
  }

}