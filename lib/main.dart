import 'package:bdp_payment_app/common/constants/global_constants.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalConstants().init();
  runApp(const BDPApp());
}
