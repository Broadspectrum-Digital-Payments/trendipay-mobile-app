// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationModelImpl _$$PaginationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationModelImpl(
      previousPage: json['previousPage'] as String?,
      nextPage: json['nextPage'] as String?,
      currentPage: json['currentPage'] as num?,
      pageSize: json['pageSize'] as num?,
      onLastPage: json['onLastPage'] as bool?,
      onFirstPage: json['onFirstPage'] as bool?,
    );

Map<String, dynamic> _$$PaginationModelImplToJson(
        _$PaginationModelImpl instance) =>
    <String, dynamic>{
      'previousPage': instance.previousPage,
      'nextPage': instance.nextPage,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'onLastPage': instance.onLastPage,
      'onFirstPage': instance.onFirstPage,
    };
