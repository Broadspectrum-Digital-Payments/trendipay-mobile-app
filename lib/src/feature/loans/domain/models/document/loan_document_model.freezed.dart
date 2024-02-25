// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoanDocumentModel _$LoanDocumentModelFromJson(Map<String, dynamic> json) {
  return _LoanDocumentModel.fromJson(json);
}

/// @nodoc
mixin _$LoanDocumentModel {
  String? get externalId => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoanDocumentModelCopyWith<LoanDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanDocumentModelCopyWith<$Res> {
  factory $LoanDocumentModelCopyWith(
          LoanDocumentModel value, $Res Function(LoanDocumentModel) then) =
      _$LoanDocumentModelCopyWithImpl<$Res, LoanDocumentModel>;
  @useResult
  $Res call(
      {String? externalId, String? url, String? status, String? createdAt});
}

/// @nodoc
class _$LoanDocumentModelCopyWithImpl<$Res, $Val extends LoanDocumentModel>
    implements $LoanDocumentModelCopyWith<$Res> {
  _$LoanDocumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? externalId = freezed,
    Object? url = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoanDocumentModelImplCopyWith<$Res>
    implements $LoanDocumentModelCopyWith<$Res> {
  factory _$$LoanDocumentModelImplCopyWith(_$LoanDocumentModelImpl value,
          $Res Function(_$LoanDocumentModelImpl) then) =
      __$$LoanDocumentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? externalId, String? url, String? status, String? createdAt});
}

/// @nodoc
class __$$LoanDocumentModelImplCopyWithImpl<$Res>
    extends _$LoanDocumentModelCopyWithImpl<$Res, _$LoanDocumentModelImpl>
    implements _$$LoanDocumentModelImplCopyWith<$Res> {
  __$$LoanDocumentModelImplCopyWithImpl(_$LoanDocumentModelImpl _value,
      $Res Function(_$LoanDocumentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? externalId = freezed,
    Object? url = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$LoanDocumentModelImpl(
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoanDocumentModelImpl implements _LoanDocumentModel {
  const _$LoanDocumentModelImpl(
      {this.externalId, this.url, this.status, this.createdAt});

  factory _$LoanDocumentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoanDocumentModelImplFromJson(json);

  @override
  final String? externalId;
  @override
  final String? url;
  @override
  final String? status;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'LoanDocumentModel(externalId: $externalId, url: $url, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanDocumentModelImpl &&
            (identical(other.externalId, externalId) ||
                other.externalId == externalId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, externalId, url, status, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoanDocumentModelImplCopyWith<_$LoanDocumentModelImpl> get copyWith =>
      __$$LoanDocumentModelImplCopyWithImpl<_$LoanDocumentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoanDocumentModelImplToJson(
      this,
    );
  }
}

abstract class _LoanDocumentModel implements LoanDocumentModel {
  const factory _LoanDocumentModel(
      {final String? externalId,
      final String? url,
      final String? status,
      final String? createdAt}) = _$LoanDocumentModelImpl;

  factory _LoanDocumentModel.fromJson(Map<String, dynamic> json) =
      _$LoanDocumentModelImpl.fromJson;

  @override
  String? get externalId;
  @override
  String? get url;
  @override
  String? get status;
  @override
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$LoanDocumentModelImplCopyWith<_$LoanDocumentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
