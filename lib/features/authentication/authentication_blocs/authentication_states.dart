
import 'dart:io';

import 'package:dio/dio.dart';

class AuthenticationStates {


  final File? profilePic;

  final File? documentFrontPic;

  final File? documentBackPic;

  final String name;
  final String emailAddress;
  final String phoneNumber;
  final String pin;
  final String confirmPin;

  final bool submittingData;

  final bool isMobileMoneyNumber;

  AuthenticationStates(

  {this.profilePic,
      this.documentFrontPic,
      this.documentBackPic,
      this.name = "",
      this.emailAddress = "",
      this.phoneNumber =  "",
      this.pin = "",
      this.confirmPin = "",
      this.submittingData = false,
    this.isMobileMoneyNumber = false,
  });

  AuthenticationStates copyWith({
    File? profilePic,
    File? documentFrontPic,
    File? documentBackPic,
    String? name,
    String? phoneNumber,
    String? emailAddress,
    String? pin,
    String? confirmPin,
    bool? submittingData,
    bool? isMobileMoneyNumber
}) {
    return AuthenticationStates(
      profilePic: profilePic ?? this.profilePic,
      documentBackPic: documentBackPic ?? this.documentBackPic,
      documentFrontPic: documentFrontPic ?? this.documentFrontPic,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      pin: pin ?? this.pin,
      confirmPin: confirmPin ?? this.confirmPin,
      submittingData: submittingData ?? this.submittingData,
      isMobileMoneyNumber: isMobileMoneyNumber ?? this.isMobileMoneyNumber,
    );
}
}