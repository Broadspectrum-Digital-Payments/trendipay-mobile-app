
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../transaction_history/domain/models/pagination/pagination_model.dart';
import '../loan/loan_model.dart';
import '../stats/stats_model.dart';

part 'loan_history_model.freezed.dart';
part 'loan_history_model.g.dart';


@freezed
class LoanHistoryModel with _$LoanHistoryModel {
  const factory LoanHistoryModel({
    final StatsModel? stats,
    final List<LoanModel>? loans,
    final PaginationModel? meta,
  }) = _LoanHistoryModel;

  factory LoanHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$LoanHistoryModelFromJson(json);
}
