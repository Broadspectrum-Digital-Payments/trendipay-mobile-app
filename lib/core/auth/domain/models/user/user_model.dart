import 'package:bdp_payment_app/core/extensions/string_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../file/file_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';


@freezed
class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    final String? externalId,
    final String? name,
    final String? ghanaCardNumber,
    final String? phoneNumber,
    final String? type,
    final String? status,
    final String? kycStatus,
    final String? actualBalance,
    final String? availableBalance,
    final List<FileModel>? files,
    final String? createdAt,
  }) = _UserModel;


  String get greetingName{
    if((name?? '').isEmpty) return '';
    final splitNameList = (name?? '').replaceAll('-', ' ').split(' ');
    return splitNameList.first;
  }
  String get getAvailableBalance => (availableBalance?? '0').toCurrencyFormat;
  String get getKycStatus => (kycStatus?? '').toLowerCase();
  bool get selfieUploaded => (files?? []).any((obj) => (obj.name?? '').toLowerCase() == 'selfie');
  FileModel get selfieFile => (files?? []).firstWhere((obj) => (obj.name?? '').toLowerCase() == 'selfie', orElse: () => const FileModel());

  bool get idCardFrontUploaded => (files?? []).any((obj) => (obj.name?? '').toLowerCase() == 'ghana-card-front');
  FileModel get idCardFrontFile => (files?? []).firstWhere((obj) => (obj.name?? '').toLowerCase() == 'ghana-card-front', orElse: () => const FileModel());

  bool get idCardBackUploaded => (files?? []).any((obj) => (obj.name?? '').toLowerCase() == 'ghana-card-back');
  FileModel get idCardBackFile => (files?? []).firstWhere((obj) => (obj.name?? '').toLowerCase() == 'ghana-card-back', orElse: () => const FileModel());

  String get joinedAt => (createdAt?? '').isEmpty? '' : DateFormat("d MMMM y").format(DateTime.parse(createdAt?? '')).toString();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

}
