import '../../../../../common/models/wallet_model.dart';

abstract class WalletEvents {
  WalletEvents();
}

class WalletAmountEvent extends WalletEvents {
  String value;
  WalletAmountEvent({required this.value});
}

class RefNumberEvent extends WalletEvents {
  String value;
  RefNumberEvent({required this.value});
}

class WalletTransferIdEvent extends WalletEvents {
  String value;
  WalletTransferIdEvent({required this.value});
}

class WalletDescriptionEvent extends WalletEvents {
  String value;
  WalletDescriptionEvent({required this.value});
}

class GetWalletsEvent extends WalletEvents {
  List<WalletModel> wallets;
  GetWalletsEvent({required this.wallets});
}

class SubmitDataEvent extends WalletEvents {
  bool value;
  SubmitDataEvent({required this.value});
}


class GetCurrentWalletEvent extends WalletEvents {
  WalletModel model;
  GetCurrentWalletEvent({required this.model});
}
class SaveWalletEvent extends WalletEvents {
  bool value;
  SaveWalletEvent({required this.value});
}



class ResetDataEvent extends WalletEvents{}