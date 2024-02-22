//
// import 'package:flutter/material.dart';
import '../../../../../core/view_models/base_view_model.dart';

class WalletViewModel extends BaseViewModel{
//   final _walletRepository = sl.get<WalletRepository>();
//
//   List<WalletTransactionModel> _recentTransactions = [];
//
//   set setRecentTransaction(List<WalletTransactionModel> transactions){
//     _recentTransactions = transactions;
//     notifyListeners();
//   }
//
//   UnmodifiableListView<WalletTransactionModel> get getRecentTransactions => UnmodifiableListView(_recentTransactions);
//
//   Future<void> fetchTransactions(BuildContext context, {String loadingComponent = 'walletRecent'}) async{
//     setComponentErrorType = null;
//     setLoading(true, component: loadingComponent);
//
//     final result = await _walletRepository.fetchTransactions(queryParam: {});
//
//     result.fold((left) {
//       setComponentErrorType = {
//         'error': FailureToMessage.mapFailureToMessage(left),
//         'component': loadingComponent
//       };
//       setLoading(false, component: loadingComponent);
//     }, (right) async{
//       setLoading(false, component: loadingComponent, notify: false);
//       setRecentTransaction = right;
//     });
//   }
//
//
}