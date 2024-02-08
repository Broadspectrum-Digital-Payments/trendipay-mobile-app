import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.currentPageIndex,
  });

  final String image, title;
  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(BDPSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
            ),
            const SizedBox(
              height: BDPSizes.onboardingSpace,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: BDPColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ]);
  }
}
