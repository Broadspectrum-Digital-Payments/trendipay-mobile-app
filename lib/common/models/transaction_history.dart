

class TransactionHistory {
  int? id;
  DateTime? date;
  String? formattedDate;
  DateTime? processDate;
  String? formattedProcessDate;
  num? amount;
  String? formattedAmount;
  String? status;
  TransferType? transferType;
  String? description;
  By? by;
  String? channel;
  String? transactionNumber;

  TransactionHistory({
    this.id,
    this.date,
    this.formattedDate,
    this.processDate,
    this.formattedProcessDate,
    this.amount,
    this.formattedAmount,
    this.status,
    this.transferType,
    this.description,
    this.by,
    this.channel,
    this.transactionNumber,
  });

  factory TransactionHistory.fromJson(Map<String, dynamic> json) => TransactionHistory(
    id: json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    formattedDate: json["formattedDate"],
    processDate: json["processDate"] == null ? null : DateTime.parse(json["processDate"]),
    formattedProcessDate: json["formattedProcessDate"],
    amount: json["amount"],
    formattedAmount: json["formattedAmount"],
    status: json["status"],
    transferType: json["transferType"] == null ? null : TransferType.fromJson(json["transferType"]),
    description: json["description"],
    by: json["by"] == null ? null : By.fromJson(json["by"]),
    channel: json["channel"],
    transactionNumber: json["transactionNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date?.toIso8601String(),
    "formattedDate": formattedDate,
    "processDate": processDate?.toIso8601String(),
    "formattedProcessDate": formattedProcessDate,
    "amount": amount,
    "formattedAmount": formattedAmount,
    "status": status,
    "transferType": transferType?.toJson(),
    "description": description,
    "by": by?.toJson(),
    "channel": channel,
    "transactionNumber": transactionNumber,
  };
}

class By {
  int? id;
  String? name;
  String? username;
  String? email;

  By({
    this.id,
    this.name,
    this.username,
    this.email,
  });

  factory By.fromJson(Map<String, dynamic> json) => By(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
  };
}

class TransferType {
  int? id;
  String? name;
  From? from;
  From? to;

  TransferType({
    this.id,
    this.name,
    this.from,
    this.to,
  });

  factory TransferType.fromJson(Map<String, dynamic> json) => TransferType(
    id: json["id"],
    name: json["name"],
    from: json["from"] == null ? null : From.fromJson(json["from"]),
    to: json["to"] == null ? null : From.fromJson(json["to"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "from": from?.toJson(),
    "to": to?.toJson(),
  };
}

class From {
  int? id;
  String? name;
  Currency? currency;

  From({
    this.id,
    this.name,
    this.currency,
  });

  factory From.fromJson(Map<String, dynamic> json) => From(
    id: json["id"],
    name: json["name"],
    currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "currency": currency?.toJson(),
  };
}

class Currency {
  int? id;
  String? symbol;
  String? name;
  String? pattern;

  Currency({
    this.id,
    this.symbol,
    this.name,
    this.pattern,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    id: json["id"],
    symbol: json["symbol"],
    name: json["name"],
    pattern: json["pattern"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "symbol": symbol,
    "name": name,
    "pattern": pattern,
  };
}