import 'package:bdp_payment_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class ResendOTPText extends StatelessWidget {
  final VoidCallback? resendOtp;
  int? currentTime;
  ResendOTPText({
    this.resendOtp,
    this.currentTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          BDPTexts.noOtp,
          style: TextStyle(
            color: Color(0xff332f2e),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        Row(
          children: [
            Text(
              "$currentTime ",
              style: TextStyle(
                color: BDPColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(width: 3.w,),
            GestureDetector(
              onTap: currentTime == 0 ? resendOtp : null,
              child: Text(
                "Resend OTP",
                style: TextStyle(
                  color: BDPColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}