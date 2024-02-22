
import 'package:permission_handler/permission_handler.dart';

import 'device_info_util.dart';

class PermissionUtil{

  static Future<bool> getContactPermission() async {
    final permission = await Permission.contacts.request();
    if(permission.isDenied) return false;

    if(permission.isPermanentlyDenied){
      await openAppSettings();
      return false;
    }

    return permission.isGranted;
  }

  static Future<bool> getCameraPermissions() async {
    final permission = await Permission.camera.request();
    if(permission.isDenied) return false;

    if(permission.isPermanentlyDenied){
      await openAppSettings();
      return false;
    }

    return permission.isGranted;
  }


  static Future<bool> getPhotosPermission() async {
    final permission = await Permission.photos.request();
    if(permission.isDenied) return false;

    if(permission.isPermanentlyDenied){
      await openAppSettings();
      return false;
    }

    return permission.isGranted || permission.isLimited;
  }


  static Future<bool> getStoragePermission() async {
    final permission = await Permission.storage.request();
    if(await DeviceInfoUtil().isAndroid13Family()) return true;
    if(permission.isDenied) return false;

    if(permission.isPermanentlyDenied){
      await openAppSettings();
      return false;
    }

    return permission.isGranted || permission.isLimited;
  }

  static Future<bool> getMediaLibraryPermission() async {
    final permission = await Permission.mediaLibrary.request();
    if(permission.isDenied) return false;

    if(permission.isPermanentlyDenied){
      await openAppSettings();
      return false;
    }

    return permission.isGranted;
  }


}