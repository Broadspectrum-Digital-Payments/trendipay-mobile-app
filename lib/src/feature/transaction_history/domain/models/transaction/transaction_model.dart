import 'dart:convert';

import 'package:bdp_payment_app/core/extensions/string_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';


@freezed
class TransactionModel with _$TransactionModel {
  const TransactionModel._();
  const factory TransactionModel({
    final String? externalId,
    final String? accountName,
    final String? accountNumber,
    final num? amount,
    final num? balanceBefore,
    final num? balanceAfter,
    final num? fee,
    final String? feeInMajorUnits,
    final String? amountInMajorUnits,
    final String? type,
    final String? description,
    final String? status,
    final String? currency,
    final String? createdAt,
  }) = _TransactionModel;

  String get getAmount => '$currency ${(amountInMajorUnits?? '0').toString().toCurrencyFormat}';
  String get getDate => (createdAt?? '').isEmpty? '' : DateFormat("d MMM y").format(DateTime.parse(createdAt?? '')).toString();
  String get getTime => (createdAt?? '').isEmpty? '' : DateFormat("jm").format(DateTime.parse(createdAt?? '')).toString();

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);


  static String encode(List<TransactionModel> objects) => json.encode(
    objects.map<Map<String, dynamic>>((obj) => obj.toJson()).toList(),
  );

  static List<TransactionModel> decode(String objects) => objects.isEmpty ? [] :
  (json.decode(objects) as List<dynamic>)
      .map<TransactionModel>((obj) => TransactionModel.fromJson(obj)).toList();
}



class TransactionList {
  TransactionList({required this.list});
  final List<TransactionModel> list;

  factory TransactionList.fromJson(List parsedJson) {
    final list = parsedJson.map((obj) => TransactionModel.fromJson(obj) ).toList();
    return TransactionList(list: list);
  }

}