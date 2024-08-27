// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoanDocumentModelImpl _$$LoanDocumentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoanDocumentModelImpl(
      externalId: json['externalId'] as String?,
      url: json['url'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$LoanDocumentModelImplToJson(
        _$LoanDocumentModelImpl instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'url': instance.url,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };
