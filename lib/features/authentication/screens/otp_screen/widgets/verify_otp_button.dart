import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/button/button.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../account_registration/account_registration_screen.dart';

class VerifyOTPButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool? isLoading;
  const VerifyOTPButton({
    super.key,
    this.onTap,
    this.isLoading = false
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 149,
        height: 50,
        child: Buttons(
          buttonName: BDPTexts.verifyOtp,
          image: BDPImages.rightArrow,
          isLoading: isLoading,
          onPressed: onTap!)
    );
  }
}