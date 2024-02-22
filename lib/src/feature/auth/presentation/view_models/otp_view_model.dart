
import 'dart:collection';

import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/core/view_models/base_view_model.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/auth/data/repositories/user_repository.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/git_it_service_locator.dart';
import '../../../../../core/utils/app_dialog_util.dart';
import '../../../../shared_widgets/modals/error_modal_content.dart';

class OtpViewModel extends BaseViewModel{
  final _userRepository = sl.get<UserRepository>();

  Map<String, dynamic> _otpRequestBody = {};


  set setOtpRequestBody(Map<String, dynamic> request){
    _otpRequestBody = {..._otpRequestBody, ...request};
  }

  UnmodifiableMapView<String, dynamic> get getOtpRequestBody => UnmodifiableMapView(_otpRequestBody);

  void clearRequestBody(){
    _otpRequestBody.clear();
  }

  Future<void> sendOtp(BuildContext context, {bool resend = false, required Map<String, dynamic> requestBody}) async{
    setIsSubmitted(true);
    final result = await _userRepository.sendOtp(requestBody: requestBody);

    result.fold((failure){
      setIsSubmitted(false);
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        AppDialogUtil.popUpModal(
          context,
          modalContent: ErrorModalContent(
            errorMessage: FailureToMessage.mapFailureToMessage(failure),
          ),
        );
      });
    }, (response){
      setIsSubmitted(false);
      if(!resend){
        setOtpRequestBody = requestBody;
        AppNavigator.pushNamed(context, AppRoute.otpVerificationScreen);
      }
    });
  }

  Future<void> verifyOtp(BuildContext context, {required Map<String, dynamic> requestBody}) async{
    setIsSubmitted(true);
    final result = await _userRepository.verifyOtp(requestBody: requestBody);

    result.fold((failure){
      setIsSubmitted(false);
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        AppDialogUtil.popUpModal(
          context,
          modalContent: ErrorModalContent(
            errorMessage: FailureToMessage.mapFailureToMessage(failure),
          ),
        );
      });
    }, (response) async{
      setIsSubmitted(false);
      if(_otpRequestBody['action'] == kSignupAction){
        setOtpRequestBody = {...requestBody, 'otp': requestBody['otp']};
        AppNavigator.pushReplacementNamed(context, AppRoute.accountRegistrationScreen);
        return;
      }
      if(_otpRequestBody['action'] == kChangePin){
        if(context.mounted){
          await context.read<UserViewModel>().changePin(context, requestBody: {..._otpRequestBody, 'otp': requestBody['otp']});
        }
        return;
      }
    });
  }


}