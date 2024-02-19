import '../../../../../common/models/wallet_model.dart';

class WalletState {
  final String amount;
  final String refNumber;

  final String transferId;

  final String description;

  final bool submitData;

  final bool saveWalletForFuture;

  List<WalletModel> savedWallets;

  WalletModel? currentWallet;

  WalletState(
      {this.amount = "",
      this.refNumber = "",
      this.transferId = "",
      this.description = "",
        this.savedWallets = const [],
      this.submitData = false,
      this.saveWalletForFuture = false,
        this.currentWallet,
      });

  WalletState copyWith(
      {String? amount,
      String? refNumber,
      String? transferId,
      String? description,
        List<WalletModel>? savedWallets,
        bool? saveWalletForFuture,
        WalletModel? currentWallet,
      bool? submitData}) {
    return WalletState(
      amount: amount ?? this.amount,
      refNumber: refNumber ?? this.refNumber,
      transferId: transferId ?? this.transferId,
      description: description ?? this.description,
      submitData: submitData ?? this.submitData,
      savedWallets: savedWallets ?? this.savedWallets,
      saveWalletForFuture: saveWalletForFuture ?? this.saveWalletForFuture,
      currentWallet: currentWallet ?? this.currentWallet
    );
  }
}
