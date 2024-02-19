import 'dart:developer';
import 'dart:io';

import 'package:bdp_payment_app/common/constants/api_constants.dart';
import 'package:bdp_payment_app/common/constants/http_service.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

import '../../../common/models/api_response.dart';

class AuthenticationRepository {
  HttpService httpService = HttpService();
  ImagePicker imagePicker = ImagePicker();

  //registration
  userRegistration(Map<String, dynamic> body) async {
    var response =
        await httpService.postWithNoAuth(ApiConstants.registration, body);
    return response;
  }

  userLogin(String username, String password) async {
    var body = {"authType": "SESSION"};
    var response = await httpService.postWithBasicAuth(
        ApiConstants.login, body, username, password);
    return response;
  }

  //this saves the documents
  Future<ApiResponse> uploadKycDocuments(
      {MultipartFile? file, String? description, String? category}) async {
    var body = FormData.fromMap({
      "file": file,
      "category": category,
      "description": description,
    });
    log("category is $category");
    var response =
        await httpService.postWithAuth(ApiConstants.submitDocuments, body);
    log("response of $category is ${response.toString()}");
    var apiResponse = ApiResponse.parse(response);
    return apiResponse;
  }

  //selectImage
  selectAnImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    return pickedImage;
  }
}
