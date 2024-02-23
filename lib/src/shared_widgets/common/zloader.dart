import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class ZLoader extends StatelessWidget {
  const ZLoader({
    super.key,
    this.value,
    this.loaderColor,
    this.size,
  });

  final double? value;
  final Color? loaderColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppThemeUtil.radius(size?? 15.0),
      width: AppThemeUtil.radius(size?? 15.0),
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: loaderColor ?? BDPColors.white,
        value: value,
      ),
    );
  }
}
