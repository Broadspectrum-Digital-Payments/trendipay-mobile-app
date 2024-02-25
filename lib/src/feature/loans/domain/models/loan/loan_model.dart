
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'loan_model.freezed.dart';
part 'loan_model.g.dart';


@freezed
class LoanModel with _$LoanModel {
  const LoanModel._();
  const factory LoanModel({
    final String? externalId,
    final num? principal,
    final String? principalInGHS,
    final num? interest,
    final String? interestInGHS,
    final num? interestRate,
    final num? monthlyInstallment,
    final String? monthlyInstallmentInGHS,
    final num? totalRepaymentAmount,
    final String? totalRepaymentAmountInGHS,
    final num? taxes,
    final String? taxesInGHS,
    final num? fees,
    final String? feesInGHS,
    final num? time,
    final String? status,
    final String? createdAt,
    final String? approvedAt,
    final String? disbursedAt,
  }) = _LoanModel;

  String get getInterestRate => '${interestRate?? 0}%';
  String get duration => (time?? 0) == 1? '$time month':'${time?? 0} months';
  String get getDate => (createdAt?? '').isEmpty? '' : DateFormat("d MMM y").format(DateTime.parse(createdAt?? '')).toString();
  String get getTime => (createdAt?? '').isEmpty? '' : DateFormat("jm").format(DateTime.parse(createdAt?? '')).toString();


  factory LoanModel.fromJson(Map<String, dynamic> json) =>
      _$LoanModelFromJson(json);
}


class LoanList {
  LoanList({required this.list});
  final List<LoanModel> list;

  factory LoanList.fromJson(List parsedJson) {
    final list = parsedJson.map((obj) => LoanModel.fromJson(obj) ).toList();
    return LoanList(list: list);
  }

}
