

import 'dart:developer';

import 'package:bdp_payment_app/common/constants/global_constants.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_details/transaction_Otp.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_events.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../common/constants/general_repository.dart';
import '../../../../../common/models/api_response.dart';
import '../../../../../common/models/exception_handler.dart';
import '../../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../../src/feature/home/presentation/screens/navigation_menu.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';
import '../transaction_repository/transfer_repository.dart';

class TransFerController {

  final BuildContext context;

  TransFerController({required this.context});

  final _apis = TransferRepository();
  // final _phoneApis = PhoneNumberRepository();
  //transfer the money
  initiatePtoPTransfer() async {
    var bloc = context.read<TransferBloc>();
    var state = bloc.state;
    if (state.amount!.isEmpty) {
      GeneralRepository.showSnackBar("Amount Error", "Amount to be sent can not be empty");
      return;
    }
    if (state.accountNumber!.isEmpty) {
      GeneralRepository.showSnackBar("Account Number Error", "Account Number can not be empty");
      return;
    }
    var body = {
      "toMemberPrincipal": state.accountNumber,
      "transferTypeId": state.transferId,
      "amount": state.amount,
      "description": state.description
    };
    log(body.toString());
    try{
      bloc.add(CompletingTransferEvent(completingTransfer: true));
      var response = await _apis.startTransfer(body);
      log("initiate transfer Response ====> ${response.toString()}");
      bloc.add(CompletingTransferEvent(completingTransfer: false));
      var apiResponse = ApiResponse.parse(response);
      log("code ${apiResponse.code}");
      if (apiResponse.allGood!) {
       // sendOtp();
      }else {
        GeneralRepository.showSnackBar("Error", apiResponse.message!);
      }
    } on DioException catch(e) {
      bloc.add(CompletingTransferEvent(completingTransfer: false));
      GeneralRepository.showSnackBar("Error", DioExceptionHandler.getMessage(e));
    }
  }

  //confirm payment transfer
  confirmPaymentTransfer() async {
    var bloc = context.read<TransferBloc>();
    var state = bloc.state;
    var body = {
      "toMemberPrincipal": state.accountNumber,
      "transferTypeId": state.transferId,
      "amount": state.amount,
      "description": state.description,
      "isOtpEnable": true,
      "otp": state.otp
    };
    try{
      bloc.add(CompletingTransferEvent(completingTransfer: true));
      var response = await -_apis.validateTransfer(body);

      bloc.add(CompletingTransferEvent(completingTransfer: false));
      var apiResponse = ApiResponse.parse(response);
      if (apiResponse.allGood!) {
        Get.off(
          SuccessScreen(
            image: BDPImages.transactionSuccess,
            title: BDPTexts.transactionSuccessful,
            onPressed: () { Get.offAll(()=> const NavigationMenu());},
            buttonName: BDPTexts.backHome, imageButton: BDPImages.rightArrow,
          ),
        );
        bloc.add(ResetTransferData());
      }else {
        GeneralRepository.showSnackBar("Error", apiResponse.message!);
      }
    } on DioException catch(e) {
      bloc.add(CompletingTransferEvent(completingTransfer: false));
      GeneralRepository.showSnackBar("Error", DioExceptionHandler.getMessage(e));
    }
  }


  //send otp
  // sendOtp({bool? resendOtp = false}) async {
  //   var bloc = context.read<TransferBloc>();
  //   var state = bloc.state;
  //   var medium = GlobalConstants.storageService.getString(GeneralRepository.mobileNumber);
  //   var body  = {
  //     "medium" : medium,
  //     "actionType" : "Verification",
  //     "otpToMobile" : true
  //   };
  //   try {
  //     bloc.add(CompletingTransferEvent(completingTransfer: true));
  //     var response = await _phoneApis.sendOtp(body);
  //     log("otp generation Response ====> ${response.toString()}");
  //     bloc.add(CompletingTransferEvent(completingTransfer: false));
  //     var apiResponse = ApiResponse.parse(response);
  //     if(apiResponse.allGood!) {
  //       if (resendOtp! == false) Get.to(()=> const TransactionVerifyOTP());
  //       GeneralRepository.showSnackBar("Success", apiResponse.message!);
  //     }else {
  //       GeneralRepository.showSnackBar("Error", apiResponse.message!);
  //     }
  //   }on DioException catch (e) {
  //     bloc.add(CompletingTransferEvent(completingTransfer: false));
  //     GeneralRepository.showSnackBar("Error", DioExceptionHandler.getMessage(e));
  //   }
  // }


  // otpVerify() async {
  //   var bloc = context.read<TransferBloc>();
  //   var state = bloc.state;
  //   var otp = state.otp;
  //   var medium = state.accountNumber;
  //   var body  = {
  //     "medium" : medium,
  //     "otp" : otp,
  //   };
  //   try {
  //     bloc.add(CompletingTransferEvent(completingTransfer: true));
  //     var response = await _phoneApis.verifyOtp(body);
  //     log("otp verification Response ====> ${response.toString()}");
  //     bloc.add(CompletingTransferEvent(completingTransfer: false));
  //     var apiResponse = ApiResponse.parse(response);
  //     if(apiResponse.allGood!) {
  //       confirmPaymentTransfer();
  //       GeneralRepository.showSnackBar("Success", apiResponse.message!);
  //     }else {
  //       GeneralRepository.showSnackBar("Error", apiResponse.message!);
  //     }
  //   }on DioException catch (e) {
  //     bloc.add(CompletingTransferEvent(completingTransfer: false));
  //     GeneralRepository.showSnackBar("Error", DioExceptionHandler.getMessage(e));
  //   }
  // }
}