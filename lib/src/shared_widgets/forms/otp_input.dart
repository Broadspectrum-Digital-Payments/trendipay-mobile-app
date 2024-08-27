import 'dart:async';

import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/constants/colors.dart';

class OTPInput extends StatelessWidget {
  const OTPInput({
    super.key,
    this.enabled = true,
    this.controller,
    this.errorAnimationController,
    this.onCompleted,
    this.onChanged,
  });

  final bool enabled;
  final TextEditingController? controller;
  final StreamController<ErrorAnimationType>? errorAnimationController;
  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
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
            fontSize: AppThemeUtil.fontSize(20.0),
            fontWeight: FontWeight.w600,
        ),
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
        onChanged: onChanged,
    );
  }
}
