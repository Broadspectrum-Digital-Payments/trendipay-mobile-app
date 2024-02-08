import 'package:bdp_payment_app/common/widgets/authHeader/authheaders.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/system_support/widgets/customAppBar.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/system_support/widgets/custom_button.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/system_support/widgets/email_us.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/system_support/widgets/our_website.dart';
import 'package:bdp_payment_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';


class SystemSupportScreen extends StatelessWidget {
  const SystemSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BDPSizes.defaultSpace),
          child: Column(
            children: [
              Image.asset(BDPImages.systemSupportImage),
              const SizedBox(
                height: BDPSizes.spaceBtwItems,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "hello,",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    BDPTexts.userName,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    BDPTexts.systemSupportTitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: BDPSizes.spaceBtwSections,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    BDPTexts.contactUs,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: BDPColors.primary,
                    ),
                  ),
                ],
              ),
              const SendUsAnEmail(),
              const OurWebsite(),
              const SizedBox(
                height: BDPSizes.spaceBtwSections * 2.5,
              ),
              const CustomButton()
            ],
          ),
        ),
      ),
    );
  }
}




