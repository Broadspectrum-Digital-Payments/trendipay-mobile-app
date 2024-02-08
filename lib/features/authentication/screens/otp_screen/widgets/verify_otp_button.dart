import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/button/button.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../account_registration/account_registration_screen.dart';

class VerifyOTPButton extends StatelessWidget {
  const VerifyOTPButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 149,
        height: 50,
        child: Buttons(buttonName: BDPTexts.verifyOtp, image: BDPImages.rightArrow, onPressed: () { Get.off(const AccountRegistration()); },)
    );
  }
}