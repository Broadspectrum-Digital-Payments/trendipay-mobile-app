import 'package:bdp_payment_app/core/extensions/string_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_transaction_model.freezed.dart';
part 'wallet_transaction_model.g.dart';


@freezed
class WalletTransactionModel with _$WalletTransactionModel {
  const WalletTransactionModel._();
  const factory WalletTransactionModel({
    final String? externalId,
    final String? amount,
    final String? description,
    final String? date,
    final String? time,
    final String? status,
  }) = _WalletTransactionModel;

  String get getAmount => (amount?? '0').toCurrencyFormat;

  factory WalletTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionModelFromJson(json);
}
