// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amortize_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AmortizeModelImpl _$$AmortizeModelImplFromJson(Map<String, dynamic> json) =>
    _$AmortizeModelImpl(
      principal: json['principal'] as num?,
      principalInGHS: json['principalInGHS'] as String?,
      loadRepaymentAmount: json['loadRepaymentAmount'] as num?,
      loadRepaymentAmountInGHS: json['loadRepaymentAmountInGHS'] as String?,
      time: json['time'] as num?,
      processingFee: json['processingFee'] as num?,
      processingFeeInGHS: json['processingFeeInGHS'] as String?,
      eLevy: json['eLevy'] as num?,
      eLevyInGHS: json['eLevyInGHS'] as String?,
      interestRate: json['interestRate'] as String?,
      interest: json['interest'] as num?,
      interestInGHS: json['interestInGHS'] as String?,
      monthlyInstallment: json['monthlyInstallment'] as num?,
      monthlyInstallmentInGHS: json['monthlyInstallmentInGHS'] as String?,
    );

Map<String, dynamic> _$$AmortizeModelImplToJson(_$AmortizeModelImpl instance) =>
    <String, dynamic>{
      'principal': instance.principal,
      'principalInGHS': instance.principalInGHS,
      'loadRepaymentAmount': instance.loadRepaymentAmount,
      'loadRepaymentAmountInGHS': instance.loadRepaymentAmountInGHS,
      'time': instance.time,
      'processingFee': instance.processingFee,
      'processingFeeInGHS': instance.processingFeeInGHS,
      'eLevy': instance.eLevy,
      'eLevyInGHS': instance.eLevyInGHS,
      'interestRate': instance.interestRate,
      'interest': instance.interest,
      'interestInGHS': instance.interestInGHS,
      'monthlyInstallment': instance.monthlyInstallment,
      'monthlyInstallmentInGHS': instance.monthlyInstallmentInGHS,
    };
