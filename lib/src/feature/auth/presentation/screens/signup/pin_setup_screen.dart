
import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/utils/helper_util.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/view_models/otp_view_model.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final pinFocusNode = FocusNode();
  final confirmFocusNode = FocusNode();
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
              Text(BDPTexts.pinSetupText , textAlign: TextAlign.center, style: kMediumFontStyle.copyWith(
                fontSize: AppThemeUtil.fontSize(16.0),
                color: BDPColors.grey,
              ),),

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
                                focusNode: pinFocusNode,
                                validator: (value){
                                  if (value == null || value.isEmpty) {
                                    return "Pin field must not be empty";
                                  }
                                  if(value.length != 6) return 'Pin field must be 6 digits';
                                  return null;
                                },
                                suffixIcon: GestureDetector(
                                  onTap: (){
                                    obscurePin.value = !obscurePin.value;
                                  },
                                  child: Icon(obscurePinValue ? Iconsax.eye_slash : Iconsax.eye),
                                ),
                                obscureText: obscurePinValue,
                                keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                                onTapOutside: (event){
                                  pinFocusNode.unfocus();
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$'))
                                ],
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
                                focusNode: confirmFocusNode,
                                validator: (value){
                                  if (value == null || value.isEmpty) {
                                    return "confirm pin field must not be empty";
                                  }if (confirmPinCtrl.text != pinCtrl.text) {
                                    return "Your inputted pins do not match";
                                  }
                                  if(value.length != 6) return 'Pin field must be 6 digits';
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
                                keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                                onTapOutside: (event){
                                  confirmFocusNode.unfocus();
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$'))
                                ],
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
                              style: kRegularFontStyle.copyWith(fontSize: AppThemeUtil.fontSize(12.0), color: BDPColors.dark90),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              size: 5,
                            ),
                            Text(
                              BDPTexts.pinRequirements2,
                              style: kRegularFontStyle.copyWith(fontSize: AppThemeUtil.fontSize(12.0), color: BDPColors.dark90),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              size: 5,
                            ),
                            Text(
                              BDPTexts.pinRequirements3,
                              style: kRegularFontStyle.copyWith(fontSize: AppThemeUtil.fontSize(12.0), color: BDPColors.dark90),
                            ),
                          ],
                        ),
                        const VSpace(
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
                                        'action': kChangePinAction,
                                        "phoneNumber": HelperUtil.getLocalPhoneNumber(userConsumer.getUser.phoneNumber?? ''),
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
