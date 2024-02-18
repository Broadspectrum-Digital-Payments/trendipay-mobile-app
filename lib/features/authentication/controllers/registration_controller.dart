

import 'dart:developer';

import 'package:bdp_payment_app/common/constants/general_repository.dart';
import 'package:bdp_payment_app/common/constants/global_constants.dart';
import 'package:bdp_payment_app/common/models/api_response.dart';
import 'package:bdp_payment_app/common/models/exception_handler.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentiation_events.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_blocs.dart';
import 'package:bdp_payment_app/features/authentication/authentication_repository/authentication_repository.dart';
import 'package:bdp_payment_app/features/authentication/screens/kyc/kyc_setup.dart';
import 'package:bdp_payment_app/navigation_menu.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common/widgets/success_screen/success_screen.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/text_strings.dart';

class RegistrationController {
  final BuildContext context;
  RegistrationController({required this.context});

  final _authApis = AuthenticationRepository();

  String phone = GlobalConstants.storageService.getString(GeneralRepository.phoneMedium);

  registerTheUser() async {
    var bloc = context.read<AuthenticationBloc>();
    var state = bloc.state;
    if (int.parse(state.pin) != int.parse(state.confirmPin)) {
      GeneralRepository.showSnackBar("Pin Mismatch", "The pin and confirm pin values should match");
      return;
    }

    var name = state.name;
    var email = state.emailAddress;
    var phone = state.phoneNumber;
    var pin = state.pin;
    var confirmPin = state.confirmPin;

    var body = {
      "resourceId": GlobalConstants.storageService.getString(GeneralRepository.resourceId),
      "groupId" : 5,
      "email" : email,
      "name": name,
      "mobileNo" : phone,
      "pin": pin,
      "confirmPin": confirmPin
    };
    log("body of registration ${body.toString()}");
    try {
      bloc.add(SubmittingDataEvent(value: true));
      var response = await _authApis.userRegistration(body);
      log("register user =====> ${response.toString()}");
      bloc.add(SubmittingDataEvent(value: false));
      var apiResponse = ApiResponse.parse(response);
      if (apiResponse.allGood!) {
        await GlobalConstants.storageService.setString(GeneralRepository.name, name);
        await GlobalConstants.storageService.setString(GeneralRepository.email, email);
        await GlobalConstants.storageService.setString(GeneralRepository.mobileNumber, phone);
        await GlobalConstants.storageService.setString(GeneralRepository.pin, pin);
        Get.to(
            ()=> SuccessScreen(
              image: BDPImages.successImage,
              title: BDPTexts.pinSetSuccess,
              isLoading: state.submittingData == true,
              onPressed: () {
                loginUser();
              }, buttonName: BDPTexts.regSuccessful,
              imageButton: BDPImages.rightArrow,),
        );
        GeneralRepository.showSnackBar("Success", apiResponse.message!);

      } else {
        GeneralRepository.showSnackBar("Error", apiResponse.message!);
      }
    } on DioException catch (e) {
      bloc.add(SubmittingDataEvent(value: false));
      GeneralRepository.showSnackBar("Error", DioExceptionHandler.getMessage(e));
    }
  }

  //loginTheUser

  loginUser() async{
    var bloc = context.read<AuthenticationBloc>();
    var state = bloc.state;
    try {
      bloc.add(SubmittingDataEvent(value: true));
      var response = await _authApis.userLogin(state.phoneNumber, state.pin);
      log("login user =====> ${response.toString()}");
      bloc.add(SubmittingDataEvent(value: false));
      var apiResponse = ApiResponse.parse(response);
      if (apiResponse.allGood!) {
        var data = apiResponse.mappedObjects;
        var sessionId = data['sessionId'];
        await GlobalConstants.storageService.setString(GeneralRepository.sessionKey, sessionId);
        var documentSubmitted = GlobalConstants.storageService.getString(GeneralRepository.documentSubmitted);
        if (documentSubmitted.isNotEmpty) {
          Get.offAll(const NavigationMenu());
        } else {
          Get.offAll(()=> const KYCSetup());
        }
        GeneralRepository.showSnackBar("Success", apiResponse.message!);
        bloc.add(ResetAuthenticationData());
      } else {
        GeneralRepository.showSnackBar("Error", apiResponse.message!);
      }
    } on DioException catch (e) {
      bloc.add(SubmittingDataEvent(value: false));
      GeneralRepository.showSnackBar("Error", DioExceptionHandler.getMessage(e));
    }
  }

}