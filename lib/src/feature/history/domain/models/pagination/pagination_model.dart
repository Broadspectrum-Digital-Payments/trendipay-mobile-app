
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';


@freezed
class PaginationModel with _$PaginationModel {
  const factory PaginationModel({
    final String? previousPage,
    final String? nextPage,
    final num? currentPage,
    final num? pageSize,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}
