
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_theme_util.dart';

class CachedImageError extends StatelessWidget {
  const CachedImageError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BDPColors.white,
        borderRadius: BorderRadius.circular(AppThemeUtil.radius(10.0)),
      ),
      child: Icon(
        Icons.error,
        color: BDPColors.white,
        size: AppThemeUtil.radius(24.0),
      ),
    );
  }
}
