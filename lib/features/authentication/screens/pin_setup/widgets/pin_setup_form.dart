import 'package:bdp_payment_app/features/authentication/screens/kyc/kyc_setup.dart';
import 'package:bdp_payment_app/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/button/button.dart';
import '../../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class PinSetupForm extends StatelessWidget {
  const PinSetupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: BDPSizes.spaceBtwItems,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: BDPTexts.pin,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.grey,
              ),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(
            height: BDPSizes.spaceBtwInputFields,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: BDPTexts.reEnterPin,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.grey,
              ),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(
            height: BDPSizes.spaceBtwItems,
          ),
          const Row(
            children: [
              Icon(
                Icons.check_circle,
                size: 5,
              ), //
              Text(
                BDPTexts.pinRequirements1,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              )
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.check_circle,
                size: 5,
              ),
              Text(
                BDPTexts.pinRequirements2,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              )
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.check_circle,
                size: 5,
              ),
              Text(
                BDPTexts.pinRequirements3,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: BDPSizes.spaceBtwSections,
          ),
          SizedBox(
            width: 125,
            height: 50,
            child: Buttons(
              buttonName: BDPTexts.setPin,
              image: BDPImages.rightArrow,
              onPressed: () {
                Get.to(
                  SuccessScreen(
                      image: BDPImages.successImage,
                      title: BDPTexts.pinSetSuccess,
                      onPressed: () {
                        Get.offAll(const KYCSetup());
                      }, buttonName: BDPTexts.regSuccessful, imageButton: BDPImages.rightArrow,),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
