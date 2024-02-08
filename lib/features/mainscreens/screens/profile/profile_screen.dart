import 'package:bdp_payment_app/features/authentication/screens/login/login.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/profile/widgets/profile_textfields.dart';
import 'package:bdp_payment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../common/widgets/button/button.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.profile),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BDPSizes.defaultSpace),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(BDPImages.userProfile,),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(BDPTexts.userName,style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700, color: BDPColors.primary,
                  ),)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileTextFields(textfieldName: BDPTexts.name, labelText: BDPTexts.userName,),
                  const SizedBox(
                    height: BDPSizes.spaceBtwInputFields,
                  ),
                  const ProfileTextFields(textfieldName: BDPTexts.emailAddress, labelText: BDPTexts.userEmail,),
                  const SizedBox(
                    height: BDPSizes.spaceBtwInputFields,
                  ),
                  const ProfileTextFields(textfieldName: BDPTexts.accountPin, labelText: BDPTexts.userPin,),
                  TextButton(
                    onPressed: () {
                      // Code to handle PIN change
                    },
                    child: const Text(
                      BDPTexts.changePin,
                      style: TextStyle(
                        color: BDPColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: BDPSizes.spaceBtwSections*3,
              ),
              SizedBox(width:137, height:40, child: Buttons(buttonName: BDPTexts.signOut, image: BDPImages.signOut, onPressed: () { Get.to(const LoginScreen()); },))
            ],
          ),
        ),
      ),
    );
  }
}

