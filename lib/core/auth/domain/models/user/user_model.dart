import 'package:bdp_payment_app/core/extensions/string_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _UserModel;


  String get greetingName{
    if((name?? '').isEmpty) return '';
    final splitNameList = (name?? '').replaceAll('-', ' ').split(' ');
    return splitNameList.first;
  }

  String get getAvailableBalance => (availableBalance?? '0').toCurrencyFormat;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

}
