import 'dart:async';

import 'package:bdp_payment_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

Widget reusableOtpWidget(BuildContext context,
    {TextEditingController? controller,
    StreamController<ErrorAnimationType>? errorAnimationController,
    Function(String)? onCompleted,
      bool enabled = true,
    Function(String)? onChanged}) {
  return PinCodeTextField(
      appContext: context,
      length: 6,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      autoDisposeControllers: true,
      autoFocus: true,
      obscureText: true,
      enabled: enabled,
      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Colors.black.withOpacity(0.8),
          fontSize: 20.sp,
          fontWeight: FontWeight.w600),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.underline,
        activeColor: BDPColors.primary,
        selectedColor: BDPColors.primary,
        inactiveColor: BDPColors.grey,
        errorBorderColor: BDPColors.secondary,
        fieldHeight: 50,
        fieldWidth: 40,
      ),
      controller: controller,
      errorAnimationController: errorAnimationController,
      validator: (value) {
        if (value!.isEmpty) {
          return "The code input must not be empty";
        } else if (value.length < 6) {
          return "The code input is less than 6 digits";
        }
        return null;
      },
      errorTextSpace: 28,
      cursorColor: BDPColors.primary,
      onCompleted: onCompleted,
      onChanged: onChanged);
}
