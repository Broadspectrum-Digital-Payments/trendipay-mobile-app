

import 'package:bdp_payment_app/utils/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GeneralRepository {

  static const sessionKey = "session-key";
  static const resourceId = "resourceId-key";
  static const phoneMedium = "phoneMedium-key";

  static const walletScreenKey = "wallet-screen-key";

  static const name = "nameKey";
  static const email = "emailKey";
  static const mobileNumber = "mobileNumberKey";
  static const pin = "pinKey";

  static const documentSubmitted = "document-submitted";


  static showSnackBar(String title, String message) {
    return Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: BDPColors.primary,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
      snackStyle: SnackStyle.FLOATING,
      overlayBlur: 10.h,
      overlayColor: BDPColors.primary.withOpacity(0.2),
      titleText: Text(
        title,
        style: TextStyle(
          color: BDPColors.white,
          fontWeight: FontWeight.w800,
          fontFamily: "Ubuntu",
          fontSize: 16.sp,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          color: BDPColors.white,
          fontWeight: FontWeight.w500,
          fontFamily: "Ubuntu",
          fontSize: 14.sp,
        ),
      ),
    );
  }

  static formatNumber({num? value}) => NumberFormat("#,##0.00##").format(value).toString();

}