
import '../../../../../common/models/transaction_history.dart';

class TransactionStates {
  List<TransactionHistory> recentTransactions;
  List<TransactionHistory> allTransactions;

  final bool loadingTransactions;

  final bool firstLoad;

  TransactionStates(
      {this.recentTransactions = const [],
        this.allTransactions = const [],
        this.loadingTransactions = false,
        this.firstLoad = false,
      });


  TransactionStates copyWith({
    List<TransactionHistory>? recentTransactions,
    List<TransactionHistory>? allTransactions,
    bool? loadingTransactions,
    bool? firstLoad
  }) {
    return TransactionStates(
      recentTransactions: recentTransactions ?? this.recentTransactions,
      allTransactions: allTransactions ?? this.allTransactions,
      loadingTransactions: loadingTransactions ?? this.loadingTransactions,
      firstLoad: firstLoad ?? this.firstLoad
    );
  }
}