
import 'package:freezed_annotation/freezed_annotation.dart';

import '../pagination/pagination_model.dart';
import '../transaction/transaction_model.dart';

part 'transaction_history_model.freezed.dart';
part 'transaction_history_model.g.dart';

@freezed
class TransactionHistoryModel with _$TransactionHistoryModel {
  const factory TransactionHistoryModel({
    final List<TransactionModel>? data,
    final PaginationModel? meta,
  }) = _TransactionHistoryModel;

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryModelFromJson(json);
}