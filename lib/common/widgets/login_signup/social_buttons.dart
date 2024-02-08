import 'package:flutter/material.dart';


import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';


class BDPSocialButtons extends StatelessWidget {
  const BDPSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 376,
          height: 54,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(24)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  BDPImages.googleIcon,
              ),
              const SizedBox(
                width: BDPSizes.spaceBtwItems,
              ),
              const Text(BDPTexts.googleSignup)
            ],
          ),
        ),
        const SizedBox(
          height: BDPSizes.spaceBtwInputFields,
        ),
        Container(
          width: 376,
          height: 54,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(24)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                BDPImages.mailIcon,
              ),
              const SizedBox(
                width: BDPSizes.spaceBtwItems,
              ),
              const Text(BDPTexts.mailSignup)
            ],
          ),
        ),
        const SizedBox(
          height: BDPSizes.defaultSpace,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                BDPTexts.hasAccount,
              style: TextStyle(
                color: Color(0xff332f2e),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            Text(
                BDPTexts.login,
              style: TextStyle(
                color: BDPColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        )
      ],
    );
  }
}