
import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/zloader.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/image_strings.dart';
import '../common/h_space.dart';

class BDPPrimaryButton extends StatelessWidget {
  const BDPPrimaryButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    required this.buttonText,
    this.imageIconFile,
    this.isLoading = false,
    this.hasIcon = true,
    this.textColor,
    this.borderColor,
  });
  
  final void Function()? onPressed;
  final Color? backgroundColor;
  final String buttonText;
  final String? imageIconFile;
  final bool isLoading;
  final bool hasIcon;
  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppThemeUtil.radius(10.0)),
          side: BorderSide(
            color: borderColor != null? borderColor! : onPressed == null ? Colors.transparent:BDPColors.primary,
          ),
        ),
        backgroundColor: backgroundColor?? BDPColors.primary,
        padding: EdgeInsets.symmetric(
          horizontal: AppThemeUtil.width(24.0),
          vertical: AppThemeUtil.height(9.0),
        ),
      ),
      child:  isLoading ?
      const Center(
        child: ZLoader(),
      )
          :
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            buttonText,
            style: kMediumFontStyle.copyWith(
              fontSize: AppThemeUtil.fontSize(16),
              color: textColor?? Colors.white,
            ),
          ),
          if(hasIcon) ...[
            const HSpace(width: 8),
            Image.asset(
              imageIconFile?? BDPImages.rightArrow,
              width: AppThemeUtil.radius(16),
              height: AppThemeUtil.radius(16),
            ),
          ],
        ],
      ),
    );
  }
}
