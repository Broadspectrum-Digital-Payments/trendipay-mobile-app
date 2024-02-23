// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      externalId: json['externalId'] as String?,
      accountNumber: json['accountNumber'] as String?,
      amount: json['amount'] as num?,
      balanceBefore: json['balanceBefore'] as num?,
      balanceAfter: json['balanceAfter'] as num?,
      fee: json['fee'] as num?,
      feeInMajorUnits: json['feeInMajorUnits'] as String?,
      amountInMajorUnits: json['amountInMajorUnits'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      status: json['status'] as String?,
      currency: json['currency'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'accountNumber': instance.accountNumber,
      'amount': instance.amount,
      'balanceBefore': instance.balanceBefore,
      'balanceAfter': instance.balanceAfter,
      'fee': instance.fee,
      'feeInMajorUnits': instance.feeInMajorUnits,
      'amountInMajorUnits': instance.amountInMajorUnits,
      'type': instance.type,
      'description': instance.description,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
      'currency': instance.currency,
      'createdAt': instance.createdAt,
    };
