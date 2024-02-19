class WalletModel {
  String? walletName;
  String? walletNetwork;
  String? phoneNumber;

  bool? futureUse;

  WalletModel(
      {this.walletName,
      this.walletNetwork,
      this.phoneNumber,
      this.futureUse});


  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
    walletName: json['walletName'] ?? "",
    walletNetwork: json['walletNetwork'] ?? "",
    phoneNumber: json['phoneNumber'] ?? "",
    futureUse: json['futureUse'] ?? false
  );
  Map<String, dynamic> toJson() {
    return {
      "walletName" : walletName,
      "walletNetwork" : walletNetwork,
      "phoneNumber" : phoneNumber,
      "futureUse" : futureUse,
    };
  }
}
