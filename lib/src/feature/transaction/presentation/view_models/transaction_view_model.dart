//
// import 'package:flutter/material.dart';
import 'dart:collection';

import 'package:flutter/material.dart';

import '../../../../../../core/view_models/base_view_model.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/git_it_service_locator.dart';
import '../../../../../core/utils/app_dialog_util.dart';
import '../../../../shared_widgets/modals/error_modal_content.dart';
import '../../../wallet/domain/models/wallet/wallet_model.dart';
import '../../data/repositories/transaction_repository.dart';
import '../../domain/models/transaction/wallet_transaction_model.dart';

class TransactionViewModel extends BaseViewModel{
  final _transactionRepository = sl.get<TransactionRepository>();

  List<WalletTransactionModel> _recentTransactions = [];
  WalletModel? _enquiryResult;

  set setRecentTransaction(List<WalletTransactionModel> transactions){
    _recentTransactions = transactions;
    notifyListeners();
  }

  UnmodifiableListView<WalletTransactionModel> get getRecentTransactions => UnmodifiableListView(_recentTransactions);

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
    }, (right) async{
      setLoading(false, component: loadingComponent, notify: false);
      setRecentTransaction = right;
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


}