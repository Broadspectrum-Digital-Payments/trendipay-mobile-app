import 'package:bdp_payment_app/common/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../login/widgets/login_form.dart';
import '../otp_screen/otp_verify_screen.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AuthHeader(
            icon: BDPImages.bdpIcon, title: BDPTexts.phoneNumberTitle),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: BDPSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const Text(
                BDPTexts.phoneNumberSubTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(
                height: BDPSizes.spaceBtwSections,
              ),

              /// FORM
              TextFormField(
                decoration: const InputDecoration(
                  labelText: BDPTexts.phoneNo,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: BDPSizes.spaceBtwSections,
              ),
              SizedBox(
                  width: 142,
                  height: 50,
                  child: Buttons(
                    buttonName: BDPTexts.otp,
                    image: BDPImages.rightArrow,
                    onPressed: () {
                      Get.to(const VerifyOTP());
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
