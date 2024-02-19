import 'dart:convert';
import 'dart:developer';
import 'package:bdp_payment_app/common/constants/global_constants.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/top_up/top-up.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallet_blocs/wallet_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallet_blocs/wallet_events.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallet_repository/wallet_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../common/constants/general_repository.dart';
import '../../../../../common/models/api_response.dart';
import '../../../../../common/models/exception_handler.dart';
import '../../../../../common/models/wallet_model.dart';
import '../../top_up/top_up_screens/top_up_confirm_transaaction.dart';
import '../../top_up/top_up_screens/transaction_confirmed_screen.dart';

class WalletTopUpController {
  final BuildContext context;

  WalletTopUpController({required this.context});

  final _apis = WalletRepository();


  init(){
    getAllWallets();
  }

  initiateTopUpPayment() async {
    var bloc = context.read<WalletBloc>();
    var state = bloc.state;
    if (state.amount!.isEmpty) {
      GeneralRepository.showSnackBar(
          "Amount Error", "Amount to be sent can not be empty");
      return;
    }
    // if (state.refNumber.isEmpty) {
    //   GeneralRepository.showSnackBar(
    //       "Ref Number Error", "Ref Number can not be empty");
    //   return;
    // }
    var body = {
      "transferTypeId": state.transferId,
      "amount": state.amount,
      "description": "Topup Payment",
      "customValues": [
        {"internalName": "REFNO", "value": state.currentWallet!.phoneNumber}
      ]
    };
    log(body.toString());
    try {
      bloc.add(SubmitDataEvent(value: true));
      var response = await _apis.startTopUp(body);
      log("initiate topUp Response ====> ${response.toString()}");
      bloc.add(SubmitDataEvent(value: false));
      var apiResponse = ApiResponse.parse(response);
      log("code ${apiResponse.code}");
      if (apiResponse.allGood!) {
        //TODO: Move Screen to the topUp Confirmation
        Get.to(()=> const TopupConfirmTransaction());
      } else {
        GeneralRepository.showSnackBar("Error", apiResponse.message!);
      }
    } on DioException catch (e) {
      bloc.add(SubmitDataEvent(value: false));
      GeneralRepository.showSnackBar(
          "Error", DioExceptionHandler.getMessage(e));
    }
  }

  //confirm payment transfer
  confirmTopUp() async {
    var bloc = context.read<WalletBloc>();
    var state = bloc.state;
    var body = {
      "transferTypeId": state.transferId,
      "amount": state.amount,
      "description": "Topup Payment",
      "customValues": [
        {"internalName": "REFNO", "value": state.currentWallet!.phoneNumber}
      ]
    };
    try {
      bloc.add(SubmitDataEvent(value: true));
      var response = await _apis.validateTopUp(body);
      bloc.add(SubmitDataEvent(value: false));
      var apiResponse = ApiResponse.parse(response);
      if (apiResponse.allGood!) {
        //TODO: move to the confirmation screen
        Get.off(()=> const TransactionConfirmedScreen());
        bloc.add(ResetDataEvent());
      } else {
        GeneralRepository.showSnackBar("Error", apiResponse.message!);
      }
    } on DioException catch (e) {
      bloc.add(SubmitDataEvent(value: false));
      GeneralRepository.showSnackBar(
          "Error", DioExceptionHandler.getMessage(e));
    }
  }

  //add wallet
  addAWallet(WalletModel model) async {
    var value = GlobalConstants.storageService
        .getString(GeneralRepository.walletScreenKey);
    if (value.isNotEmpty) {
      List<dynamic> decodedValue = json.decode(value);
      decodedValue.add(model.toJson());
      List<WalletModel> savedWallets =
      decodedValue.map<WalletModel>((e) => WalletModel.fromJson(e)).toList();
      context.read<WalletBloc>().add(GetWalletsEvent(wallets: savedWallets));
      var encodedValue = json.encode(decodedValue);
      await GlobalConstants.storageService.setString(GeneralRepository.walletScreenKey, encodedValue);
    } else {
      List<dynamic> decodedValue = [];
      List<WalletModel> savedWallets =
      decodedValue.map<WalletModel>((e) => WalletModel.fromJson(e)).toList();
      context.read<WalletBloc>().add(GetWalletsEvent(wallets: savedWallets));
      var encodedValue = json.encode(decodedValue);
      await GlobalConstants.storageService.setString(GeneralRepository.walletScreenKey, encodedValue);

    }
  }

  //getAllWallet
  getAllWallets() async {
    var value = GlobalConstants.storageService
        .getString(GeneralRepository.walletScreenKey);
    if (value.isNotEmpty) {
      List<dynamic> decodedValue = json.decode(value);
      List<WalletModel> savedWallets =
      decodedValue.map<WalletModel>((e) => WalletModel.fromJson(e)).toList();
      context.read<WalletBloc>().add(GetWalletsEvent(wallets: savedWallets));
    }
  }
}
