
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_model.freezed.dart';
part 'stats_model.g.dart';


@freezed
class StatsModel with _$StatsModel {
  const factory StatsModel({
    final num? paid,
    final num? submitted,
    final num? totalCollected,
  }) = _StatsModel;

  factory StatsModel.fromJson(Map<String, dynamic> json) =>
      _$StatsModelFromJson(json);
}
