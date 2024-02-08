import 'package:bdp_payment_app/features/authentication/screens/otp_screen/widgets/resend_otp_text.dart';
import 'package:bdp_payment_app/features/authentication/screens/otp_screen/widgets/verify_otp_button.dart';
import 'package:bdp_payment_app/features/authentication/screens/otp_screen/widgets/verify_otp_textfield.dart';
import 'package:flutter/material.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyOTP extends StatelessWidget {
  const VerifyOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.otpTitle),
        automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: BDPSpacingStyle.paddingWithAppBarHeight,
          child: Padding(
            padding: EdgeInsets.only(top: 48.0),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 80,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: VerifyOTPTextfield(),
                    ),
                  ),
                ),
                SizedBox(
                  height: BDPSizes.spaceBtwSections,
                ),
                VerifyOTPButton(),
                SizedBox(
                  height: BDPSizes.spaceBtwItems,
                ),
                ResendOTPText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
