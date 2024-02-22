import 'dart:developer';

import 'package:bdp_payment_app/common/constants/general_repository.dart';
import 'package:bdp_payment_app/common/constants/global_constants.dart';
import 'package:bdp_payment_app/common/models/api_response.dart';
import 'package:bdp_payment_app/common/models/exception_handler.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_blocs.dart';
import 'package:bdp_payment_app/features/authentication/screens/phonenumber_authentication/phone_number_blocs/phone_number_bloc.dart';
import 'package:bdp_payment_app/features/authentication/screens/phonenumber_authentication/phone_number_blocs/phone_number_events.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/signup/pin_setup_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../src/feature/auth/presentation/signup/account_registration_screen.dart';
import '../../../../../src/feature/auth/presentation/signup/otp_verify_screen.dart';
import '../phone_number_repository/phone_number_repository.dart';

class PhoneNumberController {
  final BuildContext context;

  PhoneNumberController({required this.context});
  final _apiService = PhoneNumberRepository();

  //send the otp
  generateOtp({bool? resendOtp = false}) async {
    var phoneNumberBloc = context.read<PhoneNumberBlocs>();
    var state = phoneNumberBloc.state;
    var medium = state.medium;
    var body = {
      "medium": medium,
      "actionType": "Registration",
      "otpToMobile": true
    };
    try {
      phoneNumberBloc.add(SubmittingPhoneEvent(submitting: true));
      var response = await _apiService.sendOtp(body);
      log("otp generation Response ====> ${response.toString()}");
      phoneNumberBloc.add(SubmittingPhoneEvent(submitting: false));
      var apiResponse = ApiResponse.parse(response);
      if (apiResponse.allGood!) {
        if (!resendOtp!) Get.to(() => const VerifyOTPScreen());
        GeneralRepository.showSnackBar("Success", apiResponse.message!);
      } else {
        GeneralRepository.showSnackBar("Error", apiResponse.message!);
      }
    } on DioException catch (e) {
      phoneNumberBloc.add(SubmittingPhoneEvent(submitting: false));
      GeneralRepository.showSnackBar(
          "Error", DioExceptionHandler.getMessage(e));
    }
  }

  otpVerify() async {
    var phoneNumberBloc = context.read<PhoneNumberBlocs>();
    var state = phoneNumberBloc.state;
    var otp = state.otp;
    var medium = state.medium;
    var body = {
      "medium": medium,
      "otp": otp,
    };
    try {
      phoneNumberBloc.add(SubmittingPhoneEvent(submitting: true));
      var response = await _apiService.verifyOtp(body);
      log("otp verification Response ====> ${response.toString()}");
      phoneNumberBloc.add(SubmittingPhoneEvent(submitting: false));
      var apiResponse = ApiResponse.parse(response);
      if (apiResponse.allGood!) {
        var data = apiResponse.mappedObjects['payloadX'];
        var medium = data["medium"];
        var resourceId = data['resourceId'];
        await GlobalConstants.storageService
            .setString(GeneralRepository.phoneMedium, medium);
        await GlobalConstants.storageService
            .setString(GeneralRepository.resourceId, resourceId);
        Get.off(() => const AccountRegistrationScreen());
        GeneralRepository.showSnackBar("Success", apiResponse.message!);
      } else {
        GeneralRepository.showSnackBar("Error", apiResponse.message!);
      }
    } on DioException catch (e) {
      phoneNumberBloc.add(SubmittingPhoneEvent(submitting: false));
      GeneralRepository.showSnackBar(
          "Error", DioExceptionHandler.getMessage(e));
    }
  }
}
