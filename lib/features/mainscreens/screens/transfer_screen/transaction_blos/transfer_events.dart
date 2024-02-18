



abstract class TransferEvents {
  TransferEvents();
}

class AmountEvent extends TransferEvents {
  String? amount;
  AmountEvent({required this.amount});
}

class AccountName extends TransferEvents {
  String? name;
  AccountName({required this.name});
}

class DescriptionEvent extends TransferEvents {
  String? desc;
  DescriptionEvent({required this.desc});
}

class AccountNumber extends TransferEvents {
  String? accountNum;
  AccountNumber({required this.accountNum});
}

class OtpEvent extends TransferEvents {
  String? otp;
  OtpEvent({required this.otp});
}

class TransferIdEvent extends TransferEvents {
  String? id;
  TransferIdEvent({required this.id});
}


class CompletingTransferEvent extends TransferEvents {
  bool completingTransfer;
  CompletingTransferEvent({required this.completingTransfer});
}


class ResetTransferData extends TransferEvents{}