import 'package:flutter/material.dart';

import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/utils/app_theme_util.dart';

class TransactionItemIcon extends StatelessWidget {
  const TransactionItemIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppThemeUtil.radius(40),
      height: AppThemeUtil.radius(40.0),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppThemeUtil.radius(12)),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 6.40,
            offset: Offset(0.80, 1.60),
            spreadRadius: 0,
          )
        ],
      ),
      child: Image.asset(
        BDPImages.momoTransfer,
        height: AppThemeUtil.radius(16.0),
        width: AppThemeUtil.radius(16.0),
      ),
    );
  }
}
