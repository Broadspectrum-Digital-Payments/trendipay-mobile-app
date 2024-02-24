import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_theme_util.dart';

class NavBarWrapper extends StatelessWidget {
  const NavBarWrapper({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BDPColors.white,
        border: Border.all(color: Colors.transparent)
      ),
      padding: padding?? EdgeInsets.only(
        left: AppThemeUtil.width(kWidthPadding),
        right: AppThemeUtil.width(kWidthPadding),
        bottom: AppThemeUtil.height(32),
        top: AppThemeUtil.height(8),
      ),
      child: child,
    );
  }
}
