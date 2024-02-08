import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class ResendOTPText extends StatelessWidget {
  const ResendOTPText({
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
        GestureDetector(
          onTap:() {
          },
          child: const Text(
            "10s Resend OTP",
            style: TextStyle(
              color: BDPColors.primary,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}