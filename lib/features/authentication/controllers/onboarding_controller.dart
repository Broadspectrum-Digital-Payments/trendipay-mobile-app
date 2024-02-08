import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../screens/login/login.dart';


class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  ///variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs ;

  void updatePageIndicator(int index) => currentPageIndex.value = index;

  void nextPage(){
    if(currentPageIndex.value == 1 || currentPageIndex.value ==0 ){
      Get.offAll(const LoginScreen());

    }
  }

}