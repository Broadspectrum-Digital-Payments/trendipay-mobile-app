import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/bdp_input.dart';
import 'package:flutter/material.dart';
import '../../../../../common/styles/spacing_styles.dart';
import '../../../../shared_widgets/common/authheaders.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final  formKey = GlobalKey<FormState>();
  final phoneCtrl = TextEditingController();



  @override
  void dispose() {
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AuthHeader(
            icon: BDPImages.bdpIcon, title: 'Phone Number'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: BDPSpacingStyle.paddingWithAppBarHeight,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  BDPTexts.phoneNumberSubTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const VSpace(
                  height: BDPSizes.spaceBtwSections,
                ),
                BDPInput(
                  controller: phoneCtrl,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Phone number field must not be empty";
                    }
                    return null;
                  },
                  // enabled: state.isSubmitting == false,
                  labelText: BDPTexts.phoneNo,
                ),
                const SizedBox(
                  height: BDPSizes.spaceBtwSections,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BDPPrimaryButton(
                      buttonText: BDPTexts.otp,
                      onPressed: () {
                        // if (formKey.currentState!.validate()) {
                          AppNavigator.pushNamed(context, AppRoute.otpVerificationScreen);
                        // }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
