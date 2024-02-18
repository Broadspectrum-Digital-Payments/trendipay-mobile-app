import 'package:bdp_payment_app/common/constants/general_repository.dart';
import 'package:bdp_payment_app/common/constants/global_constants.dart';
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
import '../../../authentication/screens/navigation_menu/navigation_menu_controller/navigation_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late NavigationMenuController controller;
  @override
  void initState() {
    controller = NavigationMenuController(context: context);
    super.initState();
  }

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
                  Image.asset(
                    BDPImages.userProfile,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    controller.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: BDPColors.primary,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileTextFields(
                    textfieldName: BDPTexts.name,
                    labelText: controller.name,
                  ),
                  const SizedBox(
                    height: BDPSizes.spaceBtwInputFields,
                  ),
                  ProfileTextFields(
                    textfieldName: BDPTexts.emailAddress,
                    labelText: controller.email,
                  ),
                  const SizedBox(
                    height: BDPSizes.spaceBtwInputFields,
                  ),
                  const ProfileTextFields(
                    textfieldName: BDPTexts.accountPin,
                    labelText: BDPTexts.userPin,
                  ),
                  TextButton(
                    onPressed: () {
                      // Code to handle PIN change
                    },
                    child: const Text(
                      BDPTexts.changePin,
                      style: TextStyle(
                          color: BDPColors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: BDPSizes.spaceBtwSections * 3,
              ),
              SizedBox(
                  width: 137,
                  height: 40,
                  child: Buttons(
                    buttonName: BDPTexts.signOut,
                    image: BDPImages.signOut,
                    onPressed: () {
                      GlobalConstants.storageService.removeKey(GeneralRepository.sessionKey);
                      Get.offAll(() => const LoginScreen());
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
