
import 'package:freezed_annotation/freezed_annotation.dart';

part 'amortize_model.freezed.dart';
part 'amortize_model.g.dart';


@freezed
class AmortizeModel with _$AmortizeModel {
  const factory AmortizeModel({
    final num? principal,
    final String? principalInGHS,
    final num? loadRepaymentAmount,
    final String? loadRepaymentAmountInGHS,
    final num? time,
    final num? processingFee,
    final String? processingFeeInGHS,
    final num? eLevy,
    final String? eLevyInGHS,
    final String? interestRate,
    final num? interest,
    final String? interestInGHS,
    final num? monthlyInstallment,
    final String? monthlyInstallmentInGHS,
  }) = _AmortizeModel;

  factory AmortizeModel.fromJson(Map<String, dynamic> json) =>
      _$AmortizeModelFromJson(json);
}
