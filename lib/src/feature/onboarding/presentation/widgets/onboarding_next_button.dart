import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/utils/device_utility.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
    required this.buttonName,
    required this.image,
    this.onPressed,
  });
  final String buttonName;
  final String image;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: BDPSizes.defaultSpace,
      bottom: BDPDeviceUtils.getBottomNavigationBarHeight(),
      child:  BDPPrimaryButton(
        buttonText: 'Get Started',
        onPressed: onPressed,
      ),
    );
  }
}
