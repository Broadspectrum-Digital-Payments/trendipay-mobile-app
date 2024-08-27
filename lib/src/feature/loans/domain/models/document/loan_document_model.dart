
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan_document_model.freezed.dart';
part 'loan_document_model.g.dart';


@freezed
class LoanDocumentModel with _$LoanDocumentModel {
  const factory LoanDocumentModel({
    final String? externalId,
    final String? url,
    final String? status,
    final String? createdAt,
  }) = _LoanDocumentModel;

  factory LoanDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$LoanDocumentModelFromJson(json);
}
