import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/bdp_input.dart';
import 'package:flutter/material.dart';
import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../shared_widgets/common/authheaders.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';
import '../widgets/checkbox.dart';


class AccountRegistrationScreen extends StatefulWidget {
  const AccountRegistrationScreen({super.key});

  @override
  State<AccountRegistrationScreen> createState() => _AccountRegistrationScreenState();
}

class _AccountRegistrationScreenState extends State<AccountRegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AuthHeader(icon: BDPImages.bdpIcon, title: 'Account Registration',),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: BDPSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const Text(BDPTexts.accountRegistrationText, textAlign: TextAlign.center,style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),),

              Form(
                key: formKey,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: BDPSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      BDPInput(
                        controller: nameCtrl,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "Username field must not be empty";
                          }
                          return null;
                        },
                        // enabled: state.submittingData == false,
                        labelText: BDPTexts.fullName,
                      ),
                      const VSpace(
                        height: BDPSizes.spaceBtwInputFields,
                      ),
                      BDPInput(
                        controller: emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "Email field must not be empty";
                          }

                          return null;
                        },
                        // enabled: state.submittingData == false,
                        labelText: BDPTexts.emails,
                      ),
                      const VSpace(
                        height: BDPSizes.spaceBtwInputFields,
                      ),
                      BDPInput(
                        controller: phoneCtrl,
                        // enabled: state.submittingData == false,
                        labelText: BDPTexts.phoneNo,
                        keyboardType: TextInputType.phone,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "Phone field must not be empty";
                          }
                          return null;
                        },
                      ),
                      const VSpace(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ARCheckbox(
                            // value: state.isMobileMoneyNumber,
                            value: false,
                            onChanged: (value){
                            },
                          ),
                          const Flexible(
                            child: Text(
                              BDPTexts.mNmM,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: BDPColors.primary
                              ),
                            ),
                          ),
                        ],
                      ),
                      const VSpace(
                        height: BDPSizes.spaceBtwItems,
                      ),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BDPPrimaryButton(
                            buttonText: BDPTexts.next,
                            onPressed: (){
                              // if (formKey.currentState!.validate()) {
                              //
                              // }
                              AppNavigator.pushNamed(context, AppRoute.pinSetupScreen);
                            },
                          ),
                        ],
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
