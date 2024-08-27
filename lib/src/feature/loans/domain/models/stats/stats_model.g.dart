// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatsModelImpl _$$StatsModelImplFromJson(Map<String, dynamic> json) =>
    _$StatsModelImpl(
      paid: json['paid'] as num?,
      submitted: json['submitted'] as num?,
      totalCollected: json['totalCollected'] as num?,
    );

Map<String, dynamic> _$$StatsModelImplToJson(_$StatsModelImpl instance) =>
    <String, dynamic>{
      'paid': instance.paid,
      'submitted': instance.submitted,
      'totalCollected': instance.totalCollected,
    };
