import 'package:bdp_payment_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/button/button.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../pin_setup/pin_setup_screen.dart';
import 'checkbox.dart';


class AccountRegistrationForm extends StatelessWidget {
  const AccountRegistrationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
        const EdgeInsets.symmetric(vertical: BDPSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: BDPTexts.fullName, labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.grey,
              ),
              ),
            ),
            const SizedBox(
              height: BDPSizes.spaceBtwInputFields,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: BDPTexts.emails, labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.grey,
              ),
              ),
            ),
            const SizedBox(
              height: BDPSizes.spaceBtwInputFields,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: BDPTexts.phoneNo, labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.grey,
              ),
              ),
            ),
            const SizedBox(
              height: BDPSizes.spaceBtwItems,
            ),
            const Row(
              children: [
                ARCheckbox(),

                Text(
                  BDPTexts.mNmM,
                  style: TextStyle(
                    fontSize: 12,
                    color: BDPColors.primary
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: BDPSizes.spaceBtwItems,
            ),
            SizedBox(
              width: 109,
              height: 50,
              child: Buttons(buttonName: BDPTexts.next, image: BDPImages.rightArrow, onPressed: () { Get.to(const PinSetup()); },),
            ),

          ],
        ),
      ),
    );
  }
}
