
import 'dart:collection';
import 'package:bdp_payment_app/src/feature/transaction_history/domain/models/pagination/pagination_model.dart';
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
      if(history.meta?.currentPage == 1) _persistHistory();
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


  Future<void> transfer(BuildContext context, {required Map<String, dynamic> requestBody}) async{
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

  Future<void>  makePayment(BuildContext context, {required Map<String, dynamic> requestBody}) async{
    AppDialogUtil.loadingDialog(context);
    final result = await _transactionRepository.makePayment(requestBody: requestBody);

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

  Future<void>makePurchase(BuildContext context, {required Map<String, dynamic> requestBody}) async{
    AppDialogUtil.loadingDialog(context);
    final result = await _transactionRepository.makePurchase(requestBody: requestBody);

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


  /// LOCAL DB
  Future<void> _retrieveHistory() async{
    final result = await _transactionRepository.retrieveTransactions();
    result.fold((l) => null, (history) => _transactionHistory = history );
  }

  Future<void> _persistHistory() async{
    final result = await _transactionRepository.persistTransactions(_transactionHistory);
    result.fold((l) => null, (r) => null);
  }

  initState() async{
    await _retrieveHistory();
  }

}