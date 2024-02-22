import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_space.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/text_strings.dart';

class ResendOTPText extends StatelessWidget {
  final VoidCallback? resendOtp;
  final int? currentTime;

  const ResendOTPText({
    this.resendOtp,
    this.currentTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          BDPTexts.noOtp,
          style: TextStyle(
            color: const Color(0xff332f2e),
            fontWeight: FontWeight.w400,
            fontSize: AppThemeUtil.fontSize(16),
          ),
        ),
        Row(
          children: [
            Text(
              " $currentTime ",
              style: TextStyle(
                color: BDPColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: AppThemeUtil.fontSize(16),
              ),
            ),
            const HSpace(width: 3,),
            GestureDetector(
              onTap: currentTime == 0 ? resendOtp : null,
              child: Text(
                "Resend OTP",
                style: TextStyle(
                  color: BDPColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: AppThemeUtil.fontSize(16),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}