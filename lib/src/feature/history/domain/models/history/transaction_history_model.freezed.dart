// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionHistoryModel _$TransactionHistoryModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionHistoryModel {
  List<TransactionModel>? get data => throw _privateConstructorUsedError;
  PaginationModel? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionHistoryModelCopyWith<TransactionHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryModelCopyWith<$Res> {
  factory $TransactionHistoryModelCopyWith(TransactionHistoryModel value,
          $Res Function(TransactionHistoryModel) then) =
      _$TransactionHistoryModelCopyWithImpl<$Res, TransactionHistoryModel>;
  @useResult
  $Res call({List<TransactionModel>? data, PaginationModel? meta});

  $PaginationModelCopyWith<$Res>? get meta;
}

/// @nodoc
class _$TransactionHistoryModelCopyWithImpl<$Res,
        $Val extends TransactionHistoryModel>
    implements $TransactionHistoryModelCopyWith<$Res> {
  _$TransactionHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
    ) as $Val);
  }

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
abstract class _$$TransactionHistoryModelImplCopyWith<$Res>
    implements $TransactionHistoryModelCopyWith<$Res> {
  factory _$$TransactionHistoryModelImplCopyWith(
          _$TransactionHistoryModelImpl value,
          $Res Function(_$TransactionHistoryModelImpl) then) =
      __$$TransactionHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TransactionModel>? data, PaginationModel? meta});

  @override
  $PaginationModelCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$TransactionHistoryModelImplCopyWithImpl<$Res>
    extends _$TransactionHistoryModelCopyWithImpl<$Res,
        _$TransactionHistoryModelImpl>
    implements _$$TransactionHistoryModelImplCopyWith<$Res> {
  __$$TransactionHistoryModelImplCopyWithImpl(
      _$TransactionHistoryModelImpl _value,
      $Res Function(_$TransactionHistoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$TransactionHistoryModelImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionHistoryModelImpl implements _TransactionHistoryModel {
  const _$TransactionHistoryModelImpl(
      {final List<TransactionModel>? data, this.meta})
      : _data = data;

  factory _$TransactionHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionHistoryModelImplFromJson(json);

  final List<TransactionModel>? _data;
  @override
  List<TransactionModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PaginationModel? meta;

  @override
  String toString() {
    return 'TransactionHistoryModel(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionHistoryModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionHistoryModelImplCopyWith<_$TransactionHistoryModelImpl>
      get copyWith => __$$TransactionHistoryModelImplCopyWithImpl<
          _$TransactionHistoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionHistoryModel implements TransactionHistoryModel {
  const factory _TransactionHistoryModel(
      {final List<TransactionModel>? data,
      final PaginationModel? meta}) = _$TransactionHistoryModelImpl;

  factory _TransactionHistoryModel.fromJson(Map<String, dynamic> json) =
      _$TransactionHistoryModelImpl.fromJson;

  @override
  List<TransactionModel>? get data;
  @override
  PaginationModel? get meta;
  @override
  @JsonKey(ignore: true)
  _$$TransactionHistoryModelImplCopyWith<_$TransactionHistoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
