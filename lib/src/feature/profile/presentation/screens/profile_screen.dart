
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
import '../../../../../core/utils/app_theme_util.dart';
import '../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../shared_widgets/buttons/bdp_text_button.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserViewModel>().getUser;
    return Scaffold(
      appBar: BDPAppBar(
        appBar: AppBar(),
        title: BDPTexts.profile,
        hasLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppThemeUtil.radius(BDPSizes.defaultSpace)),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    BDPImages.userProfile,
                    height: AppThemeUtil.radius(64),
                    width: AppThemeUtil.radius(64),
                  ),
                  const VSpace(
                    height: 5,
                  ),
                  Text(
                    user.name?? '',
                    style: const TextStyle(
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
                  const VSpace(height: 2),
                  BDPInput(
                    labelText: user.name,
                    enabled: false,
                  ),
                  const VSpace(
                    height: BDPSizes.spaceBtwInputFields,
                  ),
                  const FormLabel('Phone number'),
                  const VSpace(height: 2),
                  BDPInput(
                    labelText: user.phoneNumber?? '',
                    enabled: false,
                  ),

                  const VSpace(
                    height: BDPSizes.spaceBtwInputFields,
                  ),

                  const FormLabel('Registered at'),
                  const SizedBox(height: 2),
                  BDPInput(
                    labelText: user.joinedAt,
                    enabled: false,
                  ),

                  BDPTextButton(
                    text: BDPTexts.changePin,
                    onPressed: () {
                      AppNavigator.pushNamed(context, AppRoute.phoneNumberScreen, arguments: {'pinChange': true},);
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
                      await context.read<UserViewModel>().logout();
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
