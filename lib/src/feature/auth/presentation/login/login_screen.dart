
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/bdp_input.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../core/routing/app_route.dart';
import '../../../../shared_widgets/common/authheaders.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../shared_widgets/buttons/bdp_primary_button.dart';
import '../../../../shared_widgets/common/v_space.dart';


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
      appBar: AppBar(
        title:  const AuthHeader(icon: BDPImages.bdpIcon, title: 'Login'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: BDPSpacingStyle.paddingWithAppBarHeight,
          child: Form(
            key: formKey,
            child: Column(
              children: [
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
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return "Pin field must not be empty";
                        }
                        return null;
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
                const SizedBox(
                  height: BDPSizes.spaceBtwItems * 2,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BDPPrimaryButton(
                      buttonText: 'Login',
                      onPressed: (){
                        if (formKey.currentState!.validate()) {

                        }
                      },
                    ),
                  ],
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
                      'Don\'t have an account? ',
                      style: TextStyle(
                        color: Color(0xff332f2e),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        AppNavigator.pushNamed(context, AppRoute.phoneNumberScreen);
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
          ),
        ),
      ),
    );
  }
}
