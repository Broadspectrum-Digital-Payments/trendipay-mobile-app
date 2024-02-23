//
// import 'package:flutter/material.dart';
import 'dart:collection';

import 'package:bdp_payment_app/src/feature/history/domain/models/pagination/pagination_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/view_models/base_view_model.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/routing/app_navigator.dart';
import '../../../../../core/routing/app_route.dart';
import '../../../../../core/services/git_it_service_locator.dart';
import '../../../../../core/utils/app_dialog_util.dart';
import '../../../../shared_widgets/modals/error_modal_content.dart';
import '../../../wallet/domain/models/wallet/wallet_model.dart';
import '../../data/repositories/transaction_repository.dart';
import '../../domain/models/history/transaction_history_model.dart';
import '../../domain/models/transaction/transaction_model.dart';

class TransactionViewModel extends BaseViewModel{
  final _transactionRepository = sl.get<TransactionRepository>();

  TransactionHistoryModel _transactionHistory = const TransactionHistoryModel();
  WalletModel? _enquiryResult;

  set setTransactionHistory(TransactionHistoryModel history){
    _transactionHistory = history;
    notifyListeners();
  }

  UnmodifiableListView<TransactionModel> get getTransactions => UnmodifiableListView(_transactionHistory.data?? []);
  PaginationModel? get getTransactionMeta => _transactionHistory.meta;

  Future<void> fetchTransactions(BuildContext context, {String loadingComponent = 'walletRecent', required Map<String, dynamic> queryParam}) async{
    setComponentErrorType = null;
    setLoading(true, component: loadingComponent);

    final result = await _transactionRepository.fetchTransactions(queryParam: queryParam);

    result.fold((left) {
      setComponentErrorType = {
        'error': FailureToMessage.mapFailureToMessage(left),
        'component': loadingComponent
      };
      setLoading(false, component: loadingComponent);
    }, (history){
      setLoading(false, component: loadingComponent, notify: false);
      setTransactionHistory = history;
    });
  }

  set setEnquiryResult(WalletModel? data){
    _enquiryResult = data;
    notifyListeners();
  }

  WalletModel? get getEnquiryResult => _enquiryResult;

  Future<void> enquireWalletName(BuildContext context, {required Map<String, dynamic> queryParam}) async{
    setLoading(true, component: 'nameEnquiry', notify: false);
    setEnquiryResult = null;

    final result = await _transactionRepository.enquireWalletName(queryParam: queryParam);

    result.fold((failure) {
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        AppDialogUtil.popUpModal(
          context,
          modalContent: ErrorModalContent(
            errorMessage: FailureToMessage.mapFailureToMessage(failure),
          ),
        );
      });
      setLoading(false, component: 'nameEnquiry');
    }, (right) async{
      setLoading(false, component: 'nameEnquiry', notify: false);
      setEnquiryResult = right;
    });
  }


  Future<void> transferMoney(BuildContext context, {required Map<String, dynamic> requestBody}) async{
    print('####TRANSFER: $requestBody####');
    final result = await _transactionRepository.transferMoney(requestBody: requestBody);

    if(context.mounted) AppNavigator.pop(context);

    result.fold((left) {
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        AppDialogUtil.popUpModal(
          context,
          modalContent: ErrorModalContent(
            errorMessage: FailureToMessage.mapFailureToMessage(left),
          ),
        );
      });

    }, (transaction) {
      setTransactionHistory = _transactionHistory.copyWith(
        data: List.from(_transactionHistory.data?? [])..add(transaction),
      );
      AppNavigator.pushReplacementNamed(context, AppRoute.transferSuccessScreen);
    });
  }



}