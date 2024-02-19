

import 'package:bdp_payment_app/common/models/exception_handler.dart';
import 'package:bdp_payment_app/common/models/transaction_history.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_events.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/constants/general_repository.dart';
import '../../../../../common/constants/global_constants.dart';
import '../../../../../common/models/api_response.dart';
import '../navigation_menu_repository/navigation_menu_repository.dart';

class NavigationMenuController {

  final BuildContext context;

  NavigationMenuController({required this.context});

  final _apis = NavigationMenuRepository();

  String name = GlobalConstants.storageService.getString(GeneralRepository.name);
  String email = GlobalConstants.storageService.getString(GeneralRepository.email);
  String mobileNumber = GlobalConstants.storageService.getString(GeneralRepository.mobileNumber);
  String pin = GlobalConstants.storageService.getString(GeneralRepository.pin);

  init(){
    loadTransactionHistory();
  }

  loadTransactionHistory() async {
    var bloc = context.read<TransactionBlocs>();
    var state = bloc.state;
    try {
      if (!state.firstLoad) bloc.add(LoadingTransactionEvent(loading: true));
      var response = await _apis.getTransactionHistory();
      bloc.add(LoadingTransactionEvent(loading: false));
      var apiResponse = ApiResponse.parse(response);
      if (apiResponse.allGood!) {
        Map<dynamic, dynamic> accountHistory = apiResponse.mappedData?['AccountHistoryResultPage'];
        List<dynamic> trxns = accountHistory['elements'];
        List<TransactionHistory> history = trxns.map<TransactionHistory>((e) => TransactionHistory.fromJson(e)).toList();
        bloc.add(GetAllTransactions(transactions: history));
        bloc.add(FirstLoadEvent(eventLoaded: true));
      }  
    }on DioException catch(e) {
      bloc.add(LoadingTransactionEvent(loading: true));
      GeneralRepository.showSnackBar("Error", DioExceptionHandler.getMessage(e));
    }
  }
}