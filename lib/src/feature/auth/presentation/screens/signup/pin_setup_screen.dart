
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/view_models/otp_view_model.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../../../../common/styles/spacing_styles.dart';
import '../../../../../../core/view_models/base_view2.dart';
import '../../../../../shared_widgets/common/authheaders.dart';
import '../../../../../../core/constants/image_strings.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/constants/text_strings.dart';
import '../../../../../shared_widgets/forms/bdp_input.dart';


class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({super.key, this.pinChange,});

  final bool? pinChange;

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  final formKey = GlobalKey<FormState>();
  final pinCtrl = TextEditingController();
  final confirmPinCtrl = TextEditingController();
  final obscurePin = ValueNotifier<bool>(true);
  final obscureConfirmPin = ValueNotifier<bool>(true);

  @override
  void dispose() {
    pinCtrl.dispose();
    confirmPinCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AuthHeader(icon: BDPImages.bdpIcon, title: widget.pinChange == true ? BDPTexts.pinChangeTitle : BDPTexts.pinSetupTitle,),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: BDPSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const Text(BDPTexts.pinSetupText , textAlign: TextAlign.center,),

              Form(
                key: formKey,
                child: BaseView2<UserViewModel, OtpViewModel>(
                  builder: (context, userConsumer, otpConsumer, child) {
                    return Column(
                      children: [
                        Visibility(
                          visible: widget.pinChange == true,
                          child: const SizedBox(
                            height: BDPSizes.spaceBtwInputFields,
                          ),
                        ),
                        ValueListenableBuilder<bool>(
                            valueListenable: obscurePin,
                            builder: (context, obscurePinValue, child) {
                              return BDPInput(
                                enabled: !userConsumer.isSubmitted && !otpConsumer.isSubmitted,
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
                                keyboardType: TextInputType.number,
                              );
                            }
                        ),

                        const VSpace(
                          height: BDPSizes.spaceBtwInputFields,
                        ),

                        ValueListenableBuilder<bool>(
                            valueListenable: obscureConfirmPin,
                            builder: (context, obscureConfirmPinValue, child) {
                              return BDPInput(
                                enabled: !userConsumer.isSubmitted && !otpConsumer.isSubmitted,
                                controller: confirmPinCtrl,
                                validator: (value){
                                  if (value == null || value.isEmpty) {
                                    return "confirm pin field must not be empty";
                                  }if (confirmPinCtrl.text != pinCtrl.text) {
                                    return "Your inputted pins do not match";
                                  }
                                  return null;
                                },
                                labelText: widget.pinChange == true ? BDPTexts.newPinConfirm : BDPTexts.reEnterPin,
                                suffixIcon: GestureDetector(
                                  onTap: (){
                                    obscureConfirmPin.value = !obscureConfirmPin.value;
                                  },
                                  child: Icon(obscureConfirmPinValue ? Iconsax.eye_slash : Iconsax.eye),
                                ),
                                obscureText: obscureConfirmPinValue,
                                keyboardType: TextInputType.number,
                              );
                            }
                        ),
                        const VSpace(
                          height: BDPSizes.spaceBtwItems,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: AppThemeUtil.radius(5.0),
                            ), //
                            Text(
                              BDPTexts.pinRequirements1,
                              style: TextStyle(fontSize: AppThemeUtil.fontSize(12.0), fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 5,
                            ),
                            Text(
                              BDPTexts.pinRequirements2,
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 5,
                            ),
                            Text(
                              BDPTexts.pinRequirements3,
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: BDPSizes.spaceBtwSections,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BDPPrimaryButton(
                              buttonText: widget.pinChange == true ? BDPTexts.changePinBtn : BDPTexts.setPin,
                              isLoading: userConsumer.isSubmitted || otpConsumer.isSubmitted,
                              onPressed: () async{
                                if (formKey.currentState!.validate()) {
                                  if(widget.pinChange == true){
                                    await context.read<OtpViewModel>().sendOtp(
                                      context,
                                      requestBody: {
                                        'action': kChangePin,
                                        "phoneNumber": userConsumer.getUser.phoneNumber,
                                        "pin": pinCtrl.text,
                                        "pinConfirmation": confirmPinCtrl.text
                                      }
                                    );
                                    return;
                                  }

                                  await context.read<UserViewModel>().authentication(
                                    context,
                                    type: 'sign-up',
                                    requestBody: {
                                      ...userConsumer.getSignupRequestBody,
                                      "pin": pinCtrl.text,
                                      "pinConfirmation": confirmPinCtrl.text,
                                    },
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
