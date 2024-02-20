

import 'dart:io';

import 'package:dio/dio.dart';

abstract class AuthenticationEvents {
  AuthenticationEvents();
}
//multipart file data

class ProfilePicEvent extends AuthenticationEvents {
  final MultipartFile file;
  ProfilePicEvent({required this.file});
}

class DocumentFrontEvent extends AuthenticationEvents {
  final MultipartFile file;
  DocumentFrontEvent({required this.file});
}

class DocumentBackEvent extends AuthenticationEvents {
  final MultipartFile file;
  DocumentBackEvent({required this.file});
}

class ProfileFileEvent extends AuthenticationEvents {
  final File file;
  ProfileFileEvent({required this.file});
}

class DocumentFrontFileEvent extends AuthenticationEvents {
  final File file;
  DocumentFrontFileEvent({required this.file});
}

class DocumentBackFileEvent extends AuthenticationEvents {
  final File file;
  DocumentBackFileEvent({required this.file});
}

class NameEvent extends AuthenticationEvents {
  final String value;
  NameEvent({required this. value});
}

class PhoneEvent extends AuthenticationEvents {
  final String value;
  PhoneEvent({required this. value});
}

class EmailEvent extends AuthenticationEvents {
  final String value;
  EmailEvent({required this. value});
}

class PinEvent extends AuthenticationEvents {
  final String value;
  PinEvent({required this. value});
}

class OldPinEvent extends AuthenticationEvents {
  final String value;
  OldPinEvent({required this. value});
}

class ChangePinOtpEvent extends AuthenticationEvents {
  final String value;
  ChangePinOtpEvent({required this. value});
}
class ConfirmPinEvent extends AuthenticationEvents {
  final String value;
  ConfirmPinEvent({required this. value});
}


class SubmittingDataEvent extends AuthenticationEvents {
  final bool value;
  SubmittingDataEvent({required this. value});
}

class MobileMoneyEvent extends AuthenticationEvents {
  final bool value;
  MobileMoneyEvent({required this.value});
}

class PinChangeEvent extends AuthenticationEvents {
  final bool value;
  PinChangeEvent({required this.value});
}

class ResetAuthenticationData extends AuthenticationEvents {
  ResetAuthenticationData();
}