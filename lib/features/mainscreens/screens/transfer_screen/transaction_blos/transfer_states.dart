

class TransferStates {
  final String? accountName;
  final String? accountNumber;
  final String? description;
  final String? amount;
  final String? otp;
  final String? transferId;
  final bool? completingTransfer;


  TransferStates({this.accountName = "",
    this.accountNumber = "",
    this.description = "",
      this.amount = "0.00",
      this.transferId = "",
      this.otp = "",
    this.completingTransfer = false
  });

  TransferStates copyWith({String? accountName, String? otp, String? transferId,  String? accountNumber, String? description, String? amount, bool? completingTransfer}){
    return TransferStates(
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      completingTransfer: completingTransfer ?? this.completingTransfer,
      transferId: transferId ?? this.transferId,
      otp: otp ?? this.otp
    );
  }
}