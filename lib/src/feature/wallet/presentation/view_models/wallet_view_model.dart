
import 'dart:collection';

import 'package:bdp_payment_app/core/view_models/base_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/git_it_service_locator.dart';
import '../../data/repositories/wallet_repository.dart';
import '../../domain/models/transaction/wallet_transaction_model.dart';

class WalletViewModel extends BaseViewModel{
  final _walletRepository = sl.get<WalletRepository>();

  List<WalletTransactionModel> _recentTransactions = [];

  UnmodifiableListView<WalletTransactionModel> get getRecentTransactions => UnmodifiableListView(_recentTransactions);

  Future<void> fetchTransactions(BuildContext context, {String loadingComponent = 'walletRecent'}) async{
    setComponentErrorType = null;
    setLoading(true, component: loadingComponent);

    final result = await _walletRepository.fetchTransactions(queryParam: {});

    result.fold((left) {
      setComponentErrorType = {
        'error': FailureToMessage.mapFailureToMessage(left),
        'component': loadingComponent
      };
      setLoading(false, component: loadingComponent);
    }, (right) async{
      setLoading(false, component: loadingComponent, notify: false);
    });
  }


}