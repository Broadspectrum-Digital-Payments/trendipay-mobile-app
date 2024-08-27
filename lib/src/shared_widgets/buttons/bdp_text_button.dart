import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class BDPTextButton extends StatelessWidget {
  const BDPTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.style,
  });

  final String text;
  final void Function()? onPressed;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: style?? TextStyle(
            color: BDPColors.primary,
            fontSize: AppThemeUtil.fontSize(14.0),
            fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
