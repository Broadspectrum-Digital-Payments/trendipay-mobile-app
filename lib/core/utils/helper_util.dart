
import 'dart:io';

import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:flutter/material.dart';

import '../routing/app_navigator.dart';
import '../routing/app_route.dart';
import '../services/git_it_service_locator.dart';
import '../services/local_storage_service.dart';

class HelperUtil{

  static void onLogout(){
    sl.get<LocalStorageService>().clearOnLogout();
    AppNavigator.pushNamedAndRemoveUntil(AppNavigator.navigatorKey.currentContext!, AppRoute.loginScreen, (route) => false);
  }


  static bool get isIOS => Platform.isIOS;

  static String get getOSPlatform {
    if (Platform.isAndroid) return 'android';

    if (Platform.isIOS) return 'ios';

    return 'unknown';
  }

  static String getLocalPhoneNumber(String intPhoneFormat){
    if(intPhoneFormat.isEmpty) return '';
    return intPhoneFormat.substring(intPhoneFormat.length-9).padLeft(10, '0');
  }

  static String getTransactionStatus(String status){
    if([kCompletedStatus, kSuccessStatus].contains(status.toLowerCase())) return kSuccessStatus;
    if([kQueuedStatus, kInitiatedStatus, kStartedStatus].contains(status.toLowerCase())) return kPendingStatus;
    return status;
  }

  static Color getTransactionStatusTextColor(String status){
    if(status.toLowerCase() == kSuccessStatus) return BDPColors.successColor;
    if(status.toLowerCase() == kPendingStatus) return Colors.orange;
    return BDPColors.secondary;
  }

  static String getLoanTransactionStatus(String status){
    if([kQueuedStatus, kInitiatedStatus, kStartedStatus, kSubmittedStatus].contains(status.toLowerCase())) return kPendingStatus;
    return status;
  }

  static Color getLoanTransactionStatusTextColor(String status){
    if([kApprovedStatus, kPaidStatus, kDisbursedStatus].contains(status.toLowerCase())) return BDPColors.successColor;
    if(status.toLowerCase() == kPendingStatus) return Colors.orange;
    return BDPColors.secondary;
  }

}