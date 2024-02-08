import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

import '../../../controllers/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
    required this.buttonName,
    required this.image,
  });
  final String buttonName;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: BDPSizes.defaultSpace,
      bottom: BDPDeviceUtils.getBottomNavigationBarHeight(),
      child: Button(buttonName: buttonName, image: image),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.buttonName,
    required this.image,
  });

  final String buttonName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => OnBoardingController.instance.nextPage(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: BDPColors.primary,
        padding: const EdgeInsets.all(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            buttonName,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Image.asset(
            image,
            width: 24, // Adjust width as needed
            height: 24, // Adjust height as needed
          ),
        ],
      ),
    );
  }
}
