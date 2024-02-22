// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletTransactionModelImpl _$$WalletTransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletTransactionModelImpl(
      externalId: json['externalId'] as String?,
      accountNumber: json['accountNumber'] as String?,
      amount: json['amount'] as num?,
      balanceBefore: json['balanceBefore'] as num?,
      balanceAfter: json['balanceAfter'] as num?,
      fee: json['fee'] as num?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      status: json['status'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$$WalletTransactionModelImplToJson(
        _$WalletTransactionModelImpl instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'accountNumber': instance.accountNumber,
      'amount': instance.amount,
      'balanceBefore': instance.balanceBefore,
      'balanceAfter': instance.balanceAfter,
      'fee': instance.fee,
      'type': instance.type,
      'description': instance.description,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
      'currency': instance.currency,
    };
