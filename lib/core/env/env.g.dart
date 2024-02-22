// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _Env {
  static const List<int> _enviedkeyliveBaseUrl = <int>[];

  static const List<int> _envieddataliveBaseUrl = <int>[];

  static final String liveBaseUrl = String.fromCharCodes(List<int>.generate(
    _envieddataliveBaseUrl.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataliveBaseUrl[i] ^ _enviedkeyliveBaseUrl[i]));

  static const List<int> _enviedkeystagingBaseUrl = <int>[];

  static const List<int> _envieddatastagingBaseUrl = <int>[];

  static final String stagingBaseUrl = String.fromCharCodes(List<int>.generate(
    _envieddatastagingBaseUrl.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatastagingBaseUrl[i] ^ _enviedkeystagingBaseUrl[i]));

  static const bool production = false;
}
