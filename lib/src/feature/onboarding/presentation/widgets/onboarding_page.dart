import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/sizes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
  });

  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          const VSpace(
            height: BDPSizes.onboardingSpace,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.radius(BDPSizes.defaultSpace)),
            child: Text(
              title,
              style: kMediumFontStyle.copyWith(
                fontSize: AppThemeUtil.fontSize(20),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ]);
  }
}
