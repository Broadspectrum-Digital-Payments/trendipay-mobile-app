import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class WalletController extends GetxController {
  static WalletController get instance => Get.find();


  final carouselCurrentIndex = 0.obs;

  void updatePageIndicator(index){
    carouselCurrentIndex.value =  index;
  }
}