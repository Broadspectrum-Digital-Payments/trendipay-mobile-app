
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/styles/spacing_styles.dart';
import '../../../../shared_widgets/common/authheaders.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../shared_widgets/forms/bdp_input.dart';


class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({super.key, this.pinChange,});

  final bool? pinChange;

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  final formKey = GlobalKey<FormState>();
  final oldCtrl = TextEditingController();
  final pinCtrl = TextEditingController();
  final confirmPinCtrl = TextEditingController();
  final obscurePin = ValueNotifier<bool>(true);
  final obscureConfirmPin = ValueNotifier<bool>(true);

  @override
  void dispose() {
    oldCtrl.dispose();
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
                child: Column(
                  children: [
                    Visibility(
                      visible: widget.pinChange == true,
                      child: const SizedBox(
                        height: BDPSizes.spaceBtwInputFields,
                      ),
                    ),
                    Visibility(
                      visible: widget.pinChange == true,
                      child: ValueListenableBuilder<bool>(
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
                    ),
                    const VSpace(
                      height: BDPSizes.spaceBtwInputFields,
                    ),
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

                    const VSpace(
                      height: BDPSizes.spaceBtwInputFields,
                    ),

                    ValueListenableBuilder<bool>(
                        valueListenable: obscureConfirmPin,
                        builder: (context, obscureConfirmPinValue, child) {
                          return BDPInput(
                            controller: confirmPinCtrl,
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return "confirm pin field must not be empty";
                              }if (int.parse(confirmPinCtrl.text) != int.parse(pinCtrl.text)) {
                                return "Your inputted pins do not match";
                              }
                              return null;
                            },
                            // enabled: state.submittingData == false,
                            labelText: widget.pinChange == true ? BDPTexts.newPinConfirm : BDPTexts.reEnterPin,
                            suffixIcon: GestureDetector(
                              onTap: (){
                                obscureConfirmPin.value = !obscureConfirmPin.value;
                              },
                              child: Icon(obscureConfirmPinValue ? Iconsax.eye_slash : Iconsax.eye),
                            ),
                            obscureText: obscureConfirmPinValue,
                          );
                        }
                    ),
                    const VSpace(
                      height: BDPSizes.spaceBtwItems,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 5,
                        ), //
                        Text(
                          BDPTexts.pinRequirements1,
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
                          // isLoading: state.submittingData == true,
                          onPressed: () {
                            // if (formKey.currentState!.validate()) {
                            // }
                            AppNavigator.pushNamedAndRemoveUntil(context, AppRoute.homeScreen, (p0) => false);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
