import 'dart:async';

import 'package:bdp_payment_app/common/models/transaction_history.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_events.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionBlocs extends Bloc<TransactionEvents, TransactionStates> {
  TransactionBlocs() : super(TransactionStates()) {
    on<LoadingTransactionEvent>(_loadingTransactions);
    on<GetAllTransactions>(_getAllTransactions);
    on<FirstLoadEvent>(_getFirstLoadEvent);
    on<GetCurrentTransactionHistory>(_getCurrentTransactionHistory);
  }

  FutureOr<void> _loadingTransactions(
      LoadingTransactionEvent event, Emitter<TransactionStates> emit) {
    emit(state.copyWith(loadingTransactions: event.loading));

  }

  FutureOr<void> _getAllTransactions(
      GetAllTransactions event, Emitter<TransactionStates> emit) {
    var allTrnx = state.allTransactions;
    List<TransactionHistory> afterLoadedTransaction = List.from(event.transactions);
    List<TransactionHistory> mostRecentTransactions = afterLoadedTransaction.take(6).toList();
    emit(state.copyWith(allTransactions: afterLoadedTransaction, recentTransactions: mostRecentTransactions));

  }

  FutureOr<void> _getFirstLoadEvent(
      FirstLoadEvent event, Emitter<TransactionStates> emit) {
    emit(state.copyWith(firstLoad: event.eventLoaded));
  }

  FutureOr<void> _getCurrentTransactionHistory(GetCurrentTransactionHistory event, Emitter<TransactionStates> emit) {
    emit(state.copyWith(currentHistory: event.history));
  }
}
