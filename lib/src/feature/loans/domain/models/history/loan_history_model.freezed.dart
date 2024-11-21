// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoanHistoryModel _$LoanHistoryModelFromJson(Map<String, dynamic> json) {
  return _LoanHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$LoanHistoryModel {
  StatsModel? get stats => throw _privateConstructorUsedError;
  List<LoanModel>? get loans => throw _privateConstructorUsedError;
  PaginationModel? get meta => throw _privateConstructorUsedError;

  /// Serializes this LoanHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoanHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoanHistoryModelCopyWith<LoanHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanHistoryModelCopyWith<$Res> {
  factory $LoanHistoryModelCopyWith(
          LoanHistoryModel value, $Res Function(LoanHistoryModel) then) =
      _$LoanHistoryModelCopyWithImpl<$Res, LoanHistoryModel>;
  @useResult
  $Res call({StatsModel? stats, List<LoanModel>? loans, PaginationModel? meta});

  $StatsModelCopyWith<$Res>? get stats;
  $PaginationModelCopyWith<$Res>? get meta;
}

/// @nodoc
class _$LoanHistoryModelCopyWithImpl<$Res, $Val extends LoanHistoryModel>
    implements $LoanHistoryModelCopyWith<$Res> {
  _$LoanHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoanHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = freezed,
    Object? loans = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as StatsModel?,
      loans: freezed == loans
          ? _value.loans
          : loans // ignore: cast_nullable_to_non_nullable
              as List<LoanModel>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
    ) as $Val);
  }

  /// Create a copy of LoanHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatsModelCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $StatsModelCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  /// Create a copy of LoanHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationModelCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $PaginationModelCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoanHistoryModelImplCopyWith<$Res>
    implements $LoanHistoryModelCopyWith<$Res> {
  factory _$$LoanHistoryModelImplCopyWith(_$LoanHistoryModelImpl value,
          $Res Function(_$LoanHistoryModelImpl) then) =
      __$$LoanHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StatsModel? stats, List<LoanModel>? loans, PaginationModel? meta});

  @override
  $StatsModelCopyWith<$Res>? get stats;
  @override
  $PaginationModelCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$LoanHistoryModelImplCopyWithImpl<$Res>
    extends _$LoanHistoryModelCopyWithImpl<$Res, _$LoanHistoryModelImpl>
    implements _$$LoanHistoryModelImplCopyWith<$Res> {
  __$$LoanHistoryModelImplCopyWithImpl(_$LoanHistoryModelImpl _value,
      $Res Function(_$LoanHistoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoanHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = freezed,
    Object? loans = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$LoanHistoryModelImpl(
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as StatsModel?,
      loans: freezed == loans
          ? _value._loans
          : loans // ignore: cast_nullable_to_non_nullable
              as List<LoanModel>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoanHistoryModelImpl implements _LoanHistoryModel {
  const _$LoanHistoryModelImpl(
      {this.stats, final List<LoanModel>? loans, this.meta})
      : _loans = loans;

  factory _$LoanHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoanHistoryModelImplFromJson(json);

  @override
  final StatsModel? stats;
  final List<LoanModel>? _loans;
  @override
  List<LoanModel>? get loans {
    final value = _loans;
    if (value == null) return null;
    if (_loans is EqualUnmodifiableListView) return _loans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PaginationModel? meta;

  @override
  String toString() {
    return 'LoanHistoryModel(stats: $stats, loans: $loans, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanHistoryModelImpl &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality().equals(other._loans, _loans) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, stats, const DeepCollectionEquality().hash(_loans), meta);

  /// Create a copy of LoanHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoanHistoryModelImplCopyWith<_$LoanHistoryModelImpl> get copyWith =>
      __$$LoanHistoryModelImplCopyWithImpl<_$LoanHistoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoanHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _LoanHistoryModel implements LoanHistoryModel {
  const factory _LoanHistoryModel(
      {final StatsModel? stats,
      final List<LoanModel>? loans,
      final PaginationModel? meta}) = _$LoanHistoryModelImpl;

  factory _LoanHistoryModel.fromJson(Map<String, dynamic> json) =
      _$LoanHistoryModelImpl.fromJson;

  @override
  StatsModel? get stats;
  @override
  List<LoanModel>? get loans;
  @override
  PaginationModel? get meta;

  /// Create a copy of LoanHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoanHistoryModelImplCopyWith<_$LoanHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
