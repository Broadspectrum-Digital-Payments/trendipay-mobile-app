// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoanHistoryModelImpl _$$LoanHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoanHistoryModelImpl(
      stats: json['stats'] == null
          ? null
          : StatsModel.fromJson(json['stats'] as Map<String, dynamic>),
      loans: (json['loans'] as List<dynamic>?)
          ?.map((e) => LoanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : PaginationModel.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoanHistoryModelImplToJson(
        _$LoanHistoryModelImpl instance) =>
    <String, dynamic>{
      'stats': instance.stats,
      'loans': instance.loans,
      'meta': instance.meta,
    };
