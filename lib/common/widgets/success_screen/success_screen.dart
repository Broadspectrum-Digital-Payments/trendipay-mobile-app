import 'package:bdp_payment_app/common/widgets/common_widgets.dart';
import 'package:bdp_payment_app/utils/constants/colors.dart';
import 'package:bdp_payment_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../styles/spacing_styles.dart';
import '../button/button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.onPressed,
        required this.buttonName,
         this.isLoading = false,
        required this.imageButton, });

  final String image, title,buttonName, imageButton;
  final bool? isLoading;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: BDPSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: BDPColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: BDPSizes.spaceBtwSections,
              ),
              Image(
                image: AssetImage(image),
                width: 390,
                height: 291 ,
              ),
              const SizedBox(
                height: BDPSizes.spaceBtwItems*9,
              ),
              SizedBox(
                width: 193,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: BDPColors.primary,
                    padding: const EdgeInsets.only(left: 26),
                  ),
                  child: isLoading!
                      ? Center(
                    child: loader(),
                  )
                      : Row(
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
                        imageButton,
                        width: 24, // Adjust width as needed
                        height: 24, // Adjust height as needed
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
