// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletTransactionModel _$WalletTransactionModelFromJson(
    Map<String, dynamic> json) {
  return _WalletTransactionModel.fromJson(json);
}

/// @nodoc
mixin _$WalletTransactionModel {
  String? get externalId => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletTransactionModelCopyWith<WalletTransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTransactionModelCopyWith<$Res> {
  factory $WalletTransactionModelCopyWith(WalletTransactionModel value,
          $Res Function(WalletTransactionModel) then) =
      _$WalletTransactionModelCopyWithImpl<$Res, WalletTransactionModel>;
  @useResult
  $Res call(
      {String? externalId,
      String? amount,
      String? description,
      String? date,
      String? time,
      String? status});
}

/// @nodoc
class _$WalletTransactionModelCopyWithImpl<$Res,
        $Val extends WalletTransactionModel>
    implements $WalletTransactionModelCopyWith<$Res> {
  _$WalletTransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? externalId = freezed,
    Object? amount = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletTransactionModelImplCopyWith<$Res>
    implements $WalletTransactionModelCopyWith<$Res> {
  factory _$$WalletTransactionModelImplCopyWith(
          _$WalletTransactionModelImpl value,
          $Res Function(_$WalletTransactionModelImpl) then) =
      __$$WalletTransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? externalId,
      String? amount,
      String? description,
      String? date,
      String? time,
      String? status});
}

/// @nodoc
class __$$WalletTransactionModelImplCopyWithImpl<$Res>
    extends _$WalletTransactionModelCopyWithImpl<$Res,
        _$WalletTransactionModelImpl>
    implements _$$WalletTransactionModelImplCopyWith<$Res> {
  __$$WalletTransactionModelImplCopyWithImpl(
      _$WalletTransactionModelImpl _value,
      $Res Function(_$WalletTransactionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? externalId = freezed,
    Object? amount = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? status = freezed,
  }) {
    return _then(_$WalletTransactionModelImpl(
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletTransactionModelImpl extends _WalletTransactionModel {
  const _$WalletTransactionModelImpl(
      {this.externalId,
      this.amount,
      this.description,
      this.date,
      this.time,
      this.status})
      : super._();

  factory _$WalletTransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletTransactionModelImplFromJson(json);

  @override
  final String? externalId;
  @override
  final String? amount;
  @override
  final String? description;
  @override
  final String? date;
  @override
  final String? time;
  @override
  final String? status;

  @override
  String toString() {
    return 'WalletTransactionModel(externalId: $externalId, amount: $amount, description: $description, date: $date, time: $time, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTransactionModelImpl &&
            (identical(other.externalId, externalId) ||
                other.externalId == externalId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, externalId, amount, description, date, time, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletTransactionModelImplCopyWith<_$WalletTransactionModelImpl>
      get copyWith => __$$WalletTransactionModelImplCopyWithImpl<
          _$WalletTransactionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletTransactionModelImplToJson(
      this,
    );
  }
}

abstract class _WalletTransactionModel extends WalletTransactionModel {
  const factory _WalletTransactionModel(
      {final String? externalId,
      final String? amount,
      final String? description,
      final String? date,
      final String? time,
      final String? status}) = _$WalletTransactionModelImpl;
  const _WalletTransactionModel._() : super._();

  factory _WalletTransactionModel.fromJson(Map<String, dynamic> json) =
      _$WalletTransactionModelImpl.fromJson;

  @override
  String? get externalId;
  @override
  String? get amount;
  @override
  String? get description;
  @override
  String? get date;
  @override
  String? get time;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$WalletTransactionModelImplCopyWith<_$WalletTransactionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
