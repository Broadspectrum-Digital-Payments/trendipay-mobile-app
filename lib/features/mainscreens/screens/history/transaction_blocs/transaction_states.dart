
import '../../../../../common/models/transaction_history.dart';

class TransactionStates {
  List<TransactionHistory> recentTransactions;
  List<TransactionHistory> allTransactions;

  TransactionHistory? currentHistory;

  final bool loadingTransactions;

  final bool firstLoad;

  TransactionStates(
      {this.recentTransactions = const [],
        this.allTransactions = const [],
        this.loadingTransactions = false,
        this.currentHistory,
        this.firstLoad = false,
      });


  TransactionStates copyWith({
    List<TransactionHistory>? recentTransactions,
    List<TransactionHistory>? allTransactions,
    TransactionHistory? currentHistory,
    bool? loadingTransactions,
    bool? firstLoad
  }) {
    return TransactionStates(
      recentTransactions: recentTransactions ?? this.recentTransactions,
      allTransactions: allTransactions ?? this.allTransactions,
      loadingTransactions: loadingTransactions ?? this.loadingTransactions,
      currentHistory: currentHistory ?? this.currentHistory,
      firstLoad: firstLoad ?? this.firstLoad
    );
  }
}