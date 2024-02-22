
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/bdp_input.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/form_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../src/shared_widgets/buttons/bdp_text_button.dart';
import '../../../../src/shared_widgets/common/authheaders.dart';
import '../../../../core/constants/image_strings.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/text_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.profile),
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
                  const VSpace(
                    height: 5,
                  ),
                  const Text(
                    'Pius',
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
                  const FormLabel(BDPTexts.name),
                  const SizedBox(height: 2),
                  const BDPInput(
                    labelText: 'pius',
                    enabled: false,
                  ),
                  const VSpace(
                    height: BDPSizes.spaceBtwInputFields,
                  ),
                  const FormLabel(BDPTexts.emailAddress),
                  const SizedBox(height: 2),
                  const BDPInput(
                    labelText: 'fiifipius@gmail.com',
                    enabled: false,
                  ),

                  const VSpace(
                    height: BDPSizes.spaceBtwInputFields,
                  ),

                  const FormLabel(BDPTexts.accountPin),
                  const SizedBox(height: 2),
                  const BDPInput(
                    labelText: BDPTexts.userPin,
                    enabled: false,
                  ),

                  BDPTextButton(
                    text: BDPTexts.changePin,
                    onPressed: () {
                      AppNavigator.pushNamed(context, AppRoute.pinSetupScreen, arguments: true);
                    },
                  ),
                ],
              ),
              const VSpace(
                height: BDPSizes.spaceBtwSections * 3,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BDPPrimaryButton(
                    buttonText: BDPTexts.signOut,
                    onPressed: () async{
                      await context.read<UserViewModel>().logout(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
