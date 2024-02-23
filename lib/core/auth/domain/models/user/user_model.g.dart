// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      externalId: json['externalId'] as String?,
      name: json['name'] as String?,
      ghanaCardNumber: json['ghanaCardNumber'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      kycStatus: json['kycStatus'] as String?,
      actualBalance: json['actualBalance'] as String?,
      availableBalance: json['availableBalance'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => FileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'name': instance.name,
      'ghanaCardNumber': instance.ghanaCardNumber,
      'phoneNumber': instance.phoneNumber,
      'type': instance.type,
      'status': instance.status,
      'kycStatus': instance.kycStatus,
      'actualBalance': instance.actualBalance,
      'availableBalance': instance.availableBalance,
      'files': instance.files,
    };
