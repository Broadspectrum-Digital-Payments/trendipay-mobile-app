// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionHistoryModelImpl _$$TransactionHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionHistoryModelImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : PaginationModel.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionHistoryModelImplToJson(
        _$TransactionHistoryModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };
