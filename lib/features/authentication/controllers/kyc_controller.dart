

import 'dart:io';

import 'package:bdp_payment_app/common/constants/general_repository.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_blocs.dart';
import 'package:bdp_payment_app/features/authentication/authentication_repository/authentication_repository.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path_provider/path_provider.dart';

import '../../../common/constants/global_constants.dart';
import '../../../common/models/exception_handler.dart';
import '../../../navigation_menu.dart';
import '../authentication_blocs/authentiation_events.dart';

class KYCController {


  final BuildContext context;

  KYCController({required this.context});

  final _apis = AuthenticationRepository();

  String name = GlobalConstants.storageService.getString(GeneralRepository.name);

  String email = GlobalConstants.storageService.getString(GeneralRepository.email);


  saveAllDocuments() async {
    var bloc = context.read<AuthenticationBloc>();
    var state = bloc.state;
    if (state.profilePic == null) {
      GeneralRepository.showSnackBar("Profile Pic Error", "Profile picture must not be empty" );
      return;
    }
    if (state.documentFrontPic == null) {
      GeneralRepository.showSnackBar("Document Error", "Front picture of card must not be empty" );
      return;
    }
    if (state.documentBackPic == null) {
      GeneralRepository.showSnackBar("Document Error", "Back picture of card must not be empty" );
      return;
    }
    try {
      bloc.add(SubmittingDataEvent(value: true));
      Future.wait([
        _apis.uploadKycDocuments(file: state.profilePic, category: "KYC_DOC_ONE", description: "Selfie"),
        _apis.uploadKycDocuments(file: state.documentFrontPic, category: "KYC_DOC_TWO", description: "Document"),
        _apis.uploadKycDocuments(file: state.documentBackPic, category: "KYC_DOC_THREE", description: "Document"),
      ]).then((apiResponses) async {
        bloc.add(SubmittingDataEvent(value: false));
        // bool anyFail = apiResponses.any((apiResponse) => apiResponse.failedStatus!);
        // if (anyFail) {
        //   GeneralRepository.showSnackBar("Error", "Something went wrong during submission, please try again");
        // }else {
          Get.offAll(()=> const NavigationMenu());
          GeneralRepository.showSnackBar("Success", "your Documents have been saved successfully");
          await GlobalConstants.storageService.setString(GeneralRepository.documentSubmitted, "Yes");
        //}
      })
          .onError((error, stackTrace) {
        bloc.add(SubmittingDataEvent(value: false));
        GeneralRepository.showSnackBar("Error", error.toString());
      });
    } on dio.DioException catch(e) {
      bloc.add(SubmittingDataEvent(value: false));
      GeneralRepository.showSnackBar("Error", DioExceptionHandler.getMessage(e));
    }
  }

  //select the image
  Future<File> selectAnImage(String? imageCategory) async {
    var bloc = context.read<AuthenticationBloc>();
    var state = bloc.state;
    var newFile;
    bloc.add(SubmittingDataEvent(value: true));
    var pickedImage = await _apis.selectAnImage();
    if (pickedImage != null) {
      var file = File(pickedImage!.path);
      var directory = await getTemporaryDirectory();
      var path = directory.path;
      newFile = await file.copy("$path$imageCategory.jpg");
    } else {
      GeneralRepository.showSnackBar("Error", "Error picking image... Please try again.");
    }
    bloc.add(SubmittingDataEvent(value: false));
   return newFile;
  }
}