
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/extensions/gesture_extension.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/nav_bar_wrapper.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/bdp_input.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/routing/app_route.dart';
import '../../../../../../core/utils/app_dialog_util.dart';
import '../../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/constants/text_strings.dart';
import '../../../../../shared_widgets/buttons/bdp_primary_button.dart';
import '../../../../../shared_widgets/common/v_space.dart';
import '../../widgets/auth_agreement_modal_content.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final phoneCtrl = TextEditingController();
  final pinCtrl = TextEditingController();
  final phoneFocusNode = FocusNode();
  final pinFocusNode = FocusNode();
  final obscurePin = ValueNotifier<bool>(true);

  @override
  void dispose() {
    phoneCtrl.dispose();
    pinCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BDPAppBar(
        appBar: AppBar(),
        title: 'Login',
        hasLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const VSpace(height: 48.0),
                BDPInput(
                  controller: phoneCtrl,
                  focusNode: phoneFocusNode,
                  keyboardType: TextInputType.phone,
                  labelText: BDPTexts.phoneNo,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Phone field must not be empty";
                    }
                    return null;
                  },
                  onTapOutside: (event){
                    phoneFocusNode.unfocus();
                  },
                ),
                const VSpace(height: BDPSizes.spaceBtwInputFields),
                ValueListenableBuilder<bool>(
                    valueListenable: obscurePin,
                    builder: (context, obscurePinValue, child) {
                      return BDPInput(
                        controller: pinCtrl,
                        labelText: BDPTexts.password,
                        focusNode: pinFocusNode,
                        keyboardType: TextInputType.number,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "Pin field must not be empty";
                          }
                          if(value.length != 6) return 'Pin field must be 6 digits';
                          return null;
                        },
                        onTapOutside: (event){
                          pinFocusNode.unfocus();
                        },
                        suffixIcon: GestureDetector(
                          onTap: (){
                            obscurePin.value = !obscurePin.value;
                          },
                          child: Icon(obscurePinValue ? Iconsax.eye_slash : Iconsax.eye),
                        ),
                        obscureText: obscurePinValue,
                      );
                    }
                ),
                const VSpace(
                  height: BDPSizes.spaceBtwItems * 2,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BDPPrimaryButton(
                      buttonText: 'Login',
                      onPressed: () async{
                        if(formKey.currentState!.validate()){
                          await context.read<UserViewModel>().authentication(
                            context,
                            requestBody: {
                              "phoneNumber": phoneCtrl.text,
                              "pin": pinCtrl.text,
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     TextButton(
                //       onPressed: () {
                //
                //       },
                //       child: Text(
                //         BDPTexts.forgetPassword,
                //         style: kRegularFontStyle.copyWith(
                //           fontSize: AppThemeUtil.fontSize(16.0),
                //           color: BDPColors.brightPurple,
                //         ),
                //         textAlign: TextAlign.right,
                //       ),
                //     ),
                //   ],
                // ),
                const VSpace(height: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: kRegularFontStyle.copyWith(
                        color: const Color(0xff332f2e),
                        fontSize: AppThemeUtil.fontSize(16),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        AppNavigator.pushNamed(context, AppRoute.phoneNumberScreen);
                      },
                      child: Text(
                        BDPTexts.signup,
                        style: kMediumFontStyle.copyWith(
                          color: BDPColors.primary,
                          fontSize: AppThemeUtil.fontSize(16.0),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: NavBarWrapper(
        padding: EdgeInsets.only(
          left: AppThemeUtil.width(kWidthPadding),
          right: AppThemeUtil.width(kWidthPadding),
          bottom: AppThemeUtil.height(MediaQuery.of(context).size.height < 500? 32 : 48),
          top: AppThemeUtil.height(AppThemeUtil.height(MediaQuery.of(context).size.height < 500? 4 : 8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                text: 'See ',
                style: kRegularFontStyle.copyWith(
                  fontSize: AppThemeUtil.radius(14.0),
                  color: const Color(0xff332f2e),
                ),
                children: [
                  TextSpan(
                    text: 'Terms and Conditions ',
                    style: kMediumFontStyle.copyWith(
                      fontSize: AppThemeUtil.radius(14.0),
                      color: BDPColors.brightPurple,
                    ),
                  ),
                  TextSpan(
                    text: 'and ',
                    style: kRegularFontStyle.copyWith(
                      fontSize: AppThemeUtil.radius(14.0),
                      color: const Color(0xff332f2e),
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: kMediumFontStyle.copyWith(
                      fontSize: AppThemeUtil.radius(14.0),
                      color: BDPColors.brightPurple,
                    ),
                  ),
                ]
              ),
            ),
          ],
        ).onPressed((){
          AppDialogUtil.showScrollableBottomSheet(
            context: context,
            builder: (context) => const AuthAgreementModalContent(),
          );
        }),
      ),
    );
  }
}
