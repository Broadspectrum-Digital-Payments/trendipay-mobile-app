// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoanModelImpl _$$LoanModelImplFromJson(Map<String, dynamic> json) =>
    _$LoanModelImpl(
      externalId: json['externalId'] as String?,
      principal: json['principal'] as num?,
      principalInGHS: json['principalInGHS'] as String?,
      interest: json['interest'] as num?,
      interestInGHS: json['interestInGHS'] as String?,
      interestRate: json['interestRate'] as num?,
      monthlyInstallment: json['monthlyInstallment'] as num?,
      monthlyInstallmentInGHS: json['monthlyInstallmentInGHS'] as String?,
      totalRepaymentAmount: json['totalRepaymentAmount'] as num?,
      totalRepaymentAmountInGHS: json['totalRepaymentAmountInGHS'] as String?,
      taxes: json['taxes'] as num?,
      taxesInGHS: json['taxesInGHS'] as String?,
      fees: json['fees'] as num?,
      feesInGHS: json['feesInGHS'] as String?,
      time: json['time'] as num?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      approvedAt: json['approvedAt'] as String?,
      disbursedAt: json['disbursedAt'] as String?,
    );

Map<String, dynamic> _$$LoanModelImplToJson(_$LoanModelImpl instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'principal': instance.principal,
      'principalInGHS': instance.principalInGHS,
      'interest': instance.interest,
      'interestInGHS': instance.interestInGHS,
      'interestRate': instance.interestRate,
      'monthlyInstallment': instance.monthlyInstallment,
      'monthlyInstallmentInGHS': instance.monthlyInstallmentInGHS,
      'totalRepaymentAmount': instance.totalRepaymentAmount,
      'totalRepaymentAmountInGHS': instance.totalRepaymentAmountInGHS,
      'taxes': instance.taxes,
      'taxesInGHS': instance.taxesInGHS,
      'fees': instance.fees,
      'feesInGHS': instance.feesInGHS,
      'time': instance.time,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'approvedAt': instance.approvedAt,
      'disbursedAt': instance.disbursedAt,
    };
