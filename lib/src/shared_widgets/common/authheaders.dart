import 'package:bdp_payment_app/common/constants/styles.dart';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/extensions/gesture_extension.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_space.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/sizes.dart';


class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.icon,
    required this.title,
    this.showSettings = false,
  });

  final String icon;
  final String title;
  final bool showSettings;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              Image.asset(icon),
              const HSpace(
                width: BDPSizes.spaceBtwItems,
              ),
              Flexible(
                child: Text(
                  title,
                  style: kBoldFontStyle.copyWith(
                    fontSize: AppThemeUtil.fontSize(24),
                    color: BDPColors.dark90,
                  ),
                ),
              ),
            ],
          ),
        ),
        if(showSettings) Icon(
          Icons.settings_outlined,
          size: AppThemeUtil.radius(24.0),
          color: BDPColors.secondary2,
        ).iconPressed((){
          AppNavigator.pushNamed(context, AppRoute.accountSettingsScreen);
        }),
      ],
    );
  }
}