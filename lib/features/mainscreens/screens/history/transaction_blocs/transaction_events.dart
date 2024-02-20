

import '../../../../../common/models/transaction_history.dart';

abstract class TransactionEvents {
  TransactionEvents();
}



class GetAllTransactions extends TransactionEvents {
  List<TransactionHistory> transactions;
  GetAllTransactions({required this.transactions});
}


class LoadingTransactionEvent extends TransactionEvents {
  bool loading;
  LoadingTransactionEvent({required this.loading});
}

class GetCurrentTransactionHistory extends TransactionEvents {
  TransactionHistory history;
  GetCurrentTransactionHistory({required this.history});
}

class FirstLoadEvent extends TransactionEvents {
  bool eventLoaded;
  FirstLoadEvent({required this.eventLoaded});
}

