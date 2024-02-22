import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class ZLoader extends StatelessWidget {
  const ZLoader({
    super.key,
    this.value,
    this.loaderColor,
    this.height,
    this.width,
  });

  final double? value;
  final Color? loaderColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?? AppThemeUtil.radius(15.0),
      width: width?? AppThemeUtil.radius(15.0),
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
        color: loaderColor ?? BDPColors.white,
        value: value,
      ),
    );
  }
}
