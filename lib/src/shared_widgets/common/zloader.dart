import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class ZLoader extends StatelessWidget {
  const ZLoader({
    super.key,
    this.value,
    this.loaderColor,
  });

  final double? value;
  final Color? loaderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppThemeUtil.radius(15.0),
      width: AppThemeUtil.radius(15.0),
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
        color: loaderColor ?? BDPColors.white,
        value: value,
      ),
    );
  }
}
