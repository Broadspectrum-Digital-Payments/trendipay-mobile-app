// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) {
  return _PaginationModel.fromJson(json);
}

/// @nodoc
mixin _$PaginationModel {
  String? get previousPage => throw _privateConstructorUsedError;
  String? get nextPage => throw _privateConstructorUsedError;
  num? get currentPage => throw _privateConstructorUsedError;
  num? get pageSize => throw _privateConstructorUsedError;
  bool? get onLastPage => throw _privateConstructorUsedError;
  bool? get onFirstPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationModelCopyWith<PaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationModelCopyWith<$Res> {
  factory $PaginationModelCopyWith(
          PaginationModel value, $Res Function(PaginationModel) then) =
      _$PaginationModelCopyWithImpl<$Res, PaginationModel>;
  @useResult
  $Res call(
      {String? previousPage,
      String? nextPage,
      num? currentPage,
      num? pageSize,
      bool? onLastPage,
      bool? onFirstPage});
}

/// @nodoc
class _$PaginationModelCopyWithImpl<$Res, $Val extends PaginationModel>
    implements $PaginationModelCopyWith<$Res> {
  _$PaginationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousPage = freezed,
    Object? nextPage = freezed,
    Object? currentPage = freezed,
    Object? pageSize = freezed,
    Object? onLastPage = freezed,
    Object? onFirstPage = freezed,
  }) {
    return _then(_value.copyWith(
      previousPage: freezed == previousPage
          ? _value.previousPage
          : previousPage // ignore: cast_nullable_to_non_nullable
              as String?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as num?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as num?,
      onLastPage: freezed == onLastPage
          ? _value.onLastPage
          : onLastPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      onFirstPage: freezed == onFirstPage
          ? _value.onFirstPage
          : onFirstPage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationModelImplCopyWith<$Res>
    implements $PaginationModelCopyWith<$Res> {
  factory _$$PaginationModelImplCopyWith(_$PaginationModelImpl value,
          $Res Function(_$PaginationModelImpl) then) =
      __$$PaginationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? previousPage,
      String? nextPage,
      num? currentPage,
      num? pageSize,
      bool? onLastPage,
      bool? onFirstPage});
}

/// @nodoc
class __$$PaginationModelImplCopyWithImpl<$Res>
    extends _$PaginationModelCopyWithImpl<$Res, _$PaginationModelImpl>
    implements _$$PaginationModelImplCopyWith<$Res> {
  __$$PaginationModelImplCopyWithImpl(
      _$PaginationModelImpl _value, $Res Function(_$PaginationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousPage = freezed,
    Object? nextPage = freezed,
    Object? currentPage = freezed,
    Object? pageSize = freezed,
    Object? onLastPage = freezed,
    Object? onFirstPage = freezed,
  }) {
    return _then(_$PaginationModelImpl(
      previousPage: freezed == previousPage
          ? _value.previousPage
          : previousPage // ignore: cast_nullable_to_non_nullable
              as String?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as num?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as num?,
      onLastPage: freezed == onLastPage
          ? _value.onLastPage
          : onLastPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      onFirstPage: freezed == onFirstPage
          ? _value.onFirstPage
          : onFirstPage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationModelImpl implements _PaginationModel {
  const _$PaginationModelImpl(
      {this.previousPage,
      this.nextPage,
      this.currentPage,
      this.pageSize,
      this.onLastPage,
      this.onFirstPage});

  factory _$PaginationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationModelImplFromJson(json);

  @override
  final String? previousPage;
  @override
  final String? nextPage;
  @override
  final num? currentPage;
  @override
  final num? pageSize;
  @override
  final bool? onLastPage;
  @override
  final bool? onFirstPage;

  @override
  String toString() {
    return 'PaginationModel(previousPage: $previousPage, nextPage: $nextPage, currentPage: $currentPage, pageSize: $pageSize, onLastPage: $onLastPage, onFirstPage: $onFirstPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationModelImpl &&
            (identical(other.previousPage, previousPage) ||
                other.previousPage == previousPage) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.onLastPage, onLastPage) ||
                other.onLastPage == onLastPage) &&
            (identical(other.onFirstPage, onFirstPage) ||
                other.onFirstPage == onFirstPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, previousPage, nextPage,
      currentPage, pageSize, onLastPage, onFirstPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationModelImplCopyWith<_$PaginationModelImpl> get copyWith =>
      __$$PaginationModelImplCopyWithImpl<_$PaginationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationModelImplToJson(
      this,
    );
  }
}

abstract class _PaginationModel implements PaginationModel {
  const factory _PaginationModel(
      {final String? previousPage,
      final String? nextPage,
      final num? currentPage,
      final num? pageSize,
      final bool? onLastPage,
      final bool? onFirstPage}) = _$PaginationModelImpl;

  factory _PaginationModel.fromJson(Map<String, dynamic> json) =
      _$PaginationModelImpl.fromJson;

  @override
  String? get previousPage;
  @override
  String? get nextPage;
  @override
  num? get currentPage;
  @override
  num? get pageSize;
  @override
  bool? get onLastPage;
  @override
  bool? get onFirstPage;
  @override
  @JsonKey(ignore: true)
  _$$PaginationModelImplCopyWith<_$PaginationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
