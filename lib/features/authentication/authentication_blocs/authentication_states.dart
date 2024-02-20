import 'dart:io';

import 'package:dio/dio.dart';

class AuthenticationStates {
  final MultipartFile? profilePic;

  final MultipartFile? documentFrontPic;

  final MultipartFile? documentBackPic;

  final File? profileFile;
  final File? documentFrontFile;
  final File? documentBackFile;

  final String name;
  final String emailAddress;
  final String phoneNumber;
  final String pin;
  final String oldPin;
  final String confirmPin;
  final String otp;

  final bool submittingData;

  final bool isMobileMoneyNumber;

  final bool isPinChange;

  AuthenticationStates({
    this.profilePic,
    this.documentFrontPic,
    this.documentBackPic,
    this.profileFile,
    this.documentFrontFile,
    this.documentBackFile,
    this.name = "",
    this.otp = "",
    this.emailAddress = "",
    this.phoneNumber = "",
    this.oldPin = "",
    this.pin = "",
    this.confirmPin = "",
    this.submittingData = false,
    this.isPinChange = false,
    this.isMobileMoneyNumber = false,

  });

  AuthenticationStates copyWith(
      {File? profileFile,
      File? documentFrontFile,
      File? documentBackFile,
      MultipartFile? profilePic,
      MultipartFile? documentFrontPic,
      MultipartFile? documentBackPic,
      String? name,
      String? phoneNumber,
      String? emailAddress,
        String? oldPin,
        String? otp,
      String? pin,
      String? confirmPin,
      bool? submittingData,
        bool? isPinChange,
      bool? isMobileMoneyNumber}) {
    return AuthenticationStates(
      profilePic: profilePic ?? this.profilePic,
      documentBackPic: documentBackPic ?? this.documentBackPic,
      documentFrontPic: documentFrontPic ?? this.documentFrontPic,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      oldPin: oldPin ?? this.oldPin,
      pin: pin ?? this.pin,
      confirmPin: confirmPin ?? this.confirmPin,
      submittingData: submittingData ?? this.submittingData,
      isMobileMoneyNumber: isMobileMoneyNumber ?? this.isMobileMoneyNumber,
      profileFile: profileFile ?? this.profileFile,
      documentFrontFile: documentFrontFile ?? this.documentFrontFile,
      documentBackFile: documentBackFile ?? this.documentBackFile,
      isPinChange: isPinChange ?? this.isPinChange,
      otp: otp ?? this.otp

    );
  }
}
