import 'dart:convert';

import 'package:bdp_payment_app/core/extensions/string_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_transaction_model.freezed.dart';
part 'wallet_transaction_model.g.dart';


@freezed
class WalletTransactionModel with _$WalletTransactionModel {
  const WalletTransactionModel._();
  const factory WalletTransactionModel({
    final String? externalId,
    final String? accountNumber,
    final num? amount,
    final num? balanceBefore,
    final num? balanceAfter,
    final num? fee,
    final String? type,
    final String? description,
    final String? date,
    final String? time,
    final String? status,
    final String? currency,
  }) = _WalletTransactionModel;

  String get getAmount => (amount?? 0).toString().toCurrencyFormat;

  factory WalletTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionModelFromJson(json);


  static String encode(List<WalletTransactionModel> objects) => json.encode(
    objects.map<Map<String, dynamic>>((obj) => obj.toJson()).toList(),
  );

  static List<WalletTransactionModel> decode(String objects) => objects.isEmpty ? [] :
  (json.decode(objects) as List<dynamic>)
      .map<WalletTransactionModel>((obj) => WalletTransactionModel.fromJson(obj)).toList();
}



class WalletTransactionList {
  WalletTransactionList({required this.list});
  final List<WalletTransactionModel> list;

  factory WalletTransactionList.fromJson(List parsedJson) {
    final list = parsedJson.map((obj) => WalletTransactionModel.fromJson(obj) ).toList();
    return WalletTransactionList(list: list);
  }

}