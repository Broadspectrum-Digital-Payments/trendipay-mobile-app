
import 'dart:collection';

import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/core/services/logger_service.dart';
import 'package:bdp_payment_app/core/view_models/base_view_model.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:bdp_payment_app/src/feature/transaction_history/presentation/view_models/transaction_view_model.dart';
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

  Future<void> sendOtp(BuildContext context, {bool resend = false, String? phoneNumber, Map<String, dynamic>? requestBody}) async {
    if (!resend) AppDialogUtil.loadingDialog(context);
    if (resend) setIsSubmitted(false);

    ZLoggerService.logOnInfo('this is the $requestBody');
    final result = await _userRepository.sendOtp(phoneNumber: requestBody?['phoneNumber']);


    if (context.mounted && !resend) AppNavigator.pop(context);

    result.fold((failure) {
      if (resend) setIsSubmitted(false);
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        AppDialogUtil.popUpModal(
          context,
          modalContent: ErrorModalContent(
            errorMessage: FailureToMessage.mapFailureToMessage(failure),
          ),
        );
      });
    }, (response) {
      if (resend) setIsSubmitted(false);
      if (!resend) {
        setOtpRequestBody = {'phoneNumber': phoneNumber};
        String otpTitle = '';
        if (_otpRequestBody['action'] == kChangePinAction) otpTitle = 'Change Pin ';
        if (_otpRequestBody['action'] == kPerformTransferAction) otpTitle = 'Transaction ';
        AppNavigator.pushNamed(context, AppRoute.otpVerificationScreen, arguments: otpTitle);
      }
    });
  }

  Future<void> verifyOtp(BuildContext context, {required Map<String, dynamic> requestBody}) async {
    AppDialogUtil.loadingDialog(context);
    final result = await _userRepository.verifyOtp(requestBody: requestBody);

    ZLoggerService.logOnInfo('this is the first request body $requestBody.toString()');
    ZLoggerService.logOnInfo('this is the otp request body $_otpRequestBody.toString()');

    result.fold((failure){
      if(context.mounted) AppNavigator.pop(context);
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        AppDialogUtil.popUpModal(
          context,
          modalContent: ErrorModalContent(
            errorMessage: FailureToMessage.mapFailureToMessage(failure),
          ),
        );
      });
    }, (response) async{
      AppNavigator.pushReplacementNamed(context, AppRoute.accountRegistrationScreen);

      if(_otpRequestBody['action'] == kSignupAction){
        if(context.mounted) AppNavigator.pop(context);
        setOtpRequestBody = {...requestBody, 'otp': requestBody['otp']};
        AppNavigator.pushReplacementNamed(context, AppRoute.accountRegistrationScreen);
        return;
      }
      if(_otpRequestBody['action'] == kPerformTransferAction){
        if(context.mounted){
          await context.read<TransactionViewModel>().transfer(context, requestBody: _otpRequestBody);
        }
        return;
      }
      if(_otpRequestBody['action'] == kChangePinAction){
        if(context.mounted){
          ZLoggerService.logOnInfo('this is the first request body $requestBody.toString()');
          ZLoggerService.logOnInfo('this is the otp request body $_otpRequestBody.toString()');
          await context.read<UserViewModel>().changePin(context, requestBody: {..._otpRequestBody, 'otp': requestBody['otp']});
        }
        return;
      }
    });
  }
}

