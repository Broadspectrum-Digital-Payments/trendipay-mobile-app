// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletTransactionModelImpl _$$WalletTransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletTransactionModelImpl(
      externalId: json['externalId'] as String?,
      amount: json['amount'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$WalletTransactionModelImplToJson(
        _$WalletTransactionModelImpl instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'amount': instance.amount,
      'description': instance.description,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
    };
