
import 'dart:convert';
import 'dart:developer';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class MediaFileUtil{
  static Future<String?> cropImage(String path, {
    String title = 'Crop Photo',
    bool hideBottomControls = true,
  }) async {
    CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: title,
          toolbarColor: BDPColors.black70,
          toolbarWidgetColor: BDPColors.white,
          hideBottomControls: hideBottomControls,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: title,
          aspectRatioLockEnabled: false,
          hidesNavigationBar: hideBottomControls,
        ),
      ],

    ).onError((error, stackTrace){
      log(error.toString());
      return null;
    });

    return cropped?.path;
  }


  static Future<XFile?> pickImageFrom(ImageSource imageSource, {
    int imageQuality = 50,
    bool cameraFront = false,
  }) async {
    try{
      final XFile? file = await ImagePicker().pickImage(
        source: imageSource,
        imageQuality: imageQuality,
        preferredCameraDevice: cameraFront ? CameraDevice.front : CameraDevice.rear
      );
      return file;
    }catch(e){
      log(e.toString());
      return null;
    }
  }

  static Future<String> convertFileToBase64(String filePath) async{
    try{
      XFile imageFile = XFile(filePath);
      final bytes = await imageFile.readAsBytes();
      return base64Encode(bytes);
    }catch(e){
      return '';
    }
  }

  static Future<String?> getPickedSourceImage({bool camera = true, bool cropped = true, bool cameraFront = false}) async {
    try{
      final selectedFile = await pickImageFrom(camera? ImageSource.camera : ImageSource.gallery, cameraFront: cameraFront);
      if (selectedFile != null) {
        if(cropped) return cropSelectedImage(selectedFile);

        return selectedFile.path;
      }
    }catch(e){
      log(e.toString());
    }
    return null;
  }

  static Future<String?> cropSelectedImage(XFile source) async {
    String? cropped = await cropImage(
        source.path,
        hideBottomControls: false
    );
    return cropped;
  }

  static Future<MultipartFile?>? getMultipartFile(String filePath)async{
    try{
      return filePath.isEmpty? null : await MultipartFile.fromFile(filePath, filename: p.basename(filePath));
    }catch(e){
      return null;
    }
  }

  static Future<String?> pickFile({bool allowMultiple = false, String title='Select a File'}) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        dialogTitle: title,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'pdf'],
        withReadStream: true,
        allowMultiple: allowMultiple,
      );
      return result?.files.single.path;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

}