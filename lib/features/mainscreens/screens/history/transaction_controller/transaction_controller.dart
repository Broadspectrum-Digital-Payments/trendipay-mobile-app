

import 'dart:developer';

import 'package:bdp_payment_app/common/models/api_response.dart';
import 'package:bdp_payment_app/common/models/transaction_history.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_events.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/constants/general_repository.dart';
import '../../../../../common/models/exception_handler.dart';

class TransactionHistoryController {
  
  final BuildContext context;
  
  TransactionHistoryController({required this.context});
  final _apis = TransactionRepository();
  
  //get the transaction data by id'
  loadTransactionById(int id) async {
    var bloc = context.read<TransactionBlocs>();
    var state = bloc.state;
    try{
      bloc.add(LoadingTransactionEvent(loading: true));
      var response = await _apis.getTransactionHistoryById(id);
      log("getTransferDetails ====>>> ${response.toString()}");
      bloc.add(LoadingTransactionEvent(loading: false));
      var apiResponse = ApiResponse.parse(response);
      if (apiResponse.allGood!) {
        Map<dynamic, dynamic> transferData = apiResponse.mappedData?['transferDataVO'];
        var currentHistory = TransactionHistory.fromJson(transferData['accountHistoryTransfer']);
        bloc.add(GetCurrentTransactionHistory(history: currentHistory));
      }else {
        GeneralRepository.showSnackBar("Error", apiResponse.message!);
      }
    }on DioException catch (e){
      bloc.add(LoadingTransactionEvent(loading: false));
      GeneralRepository.showSnackBar("Error", DioExceptionHandler.getMessage(e));
    }
  }
}