import 'package:bdp_payment_app/common/widgets/button/button.dart';
import 'package:bdp_payment_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../phonenumber_authentication/phone_number.dart';

class BDPLoginForm extends StatelessWidget {
  const BDPLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: BDPTexts.email,
              labelStyle: TextStyle(
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
              labelText: BDPTexts.password,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.grey,
              ),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(
            height: BDPSizes.spaceBtwItems * 2,
          ),
          SizedBox(
            width: 119,
            height: 50,
            child: Buttons(
              buttonName: BDPTexts.login,
              image: BDPImages.rightArrow,
              onPressed: () {
                Get.to(const NavigationMenu());
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  BDPTexts.forgetPassword,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                BDPTexts.hasAccount,
                style: TextStyle(
                  color: Color(0xff332f2e),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const PhoneNumberScreen());
                },
                child: const Text(
                  BDPTexts.signup,
                  style: TextStyle(
                    color: BDPColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
