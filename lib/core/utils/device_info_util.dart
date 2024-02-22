
import 'package:device_info_plus/device_info_plus.dart';

import 'helper_util.dart';

class DeviceInfoUtil{
  static final DeviceInfoUtil _deviceInfoUtil = DeviceInfoUtil._internal();
  factory DeviceInfoUtil() => _deviceInfoUtil;
  DeviceInfoUtil._internal();

  Future<int> getAppSdk() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo android = await deviceInfoPlugin.androidInfo;
    return android.version.sdkInt;
  }

  Future<bool> isAndroid13Family() async {
    if(HelperUtil.isIOS) return false;
    final deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo android = await deviceInfoPlugin.androidInfo;
    return android.version.sdkInt >= 33;
  }

}