

import 'package:bdp_payment_app/common/constants/storage_service.dart';

class GlobalConstants {
  static StorageService storageService = StorageService();

  init() async {
    await storageService.init();
  }
}