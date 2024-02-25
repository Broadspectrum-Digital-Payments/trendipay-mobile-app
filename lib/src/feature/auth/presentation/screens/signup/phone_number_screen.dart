
import 'package:bdp_payment_app/core/view_models/base_view.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/view_models/otp_view_model.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/bdp_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/constants/text_strings.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final  formKey = GlobalKey<FormState>();
  final phoneCtrl = TextEditingController();
  final phoneFocusNode = FocusNode();



  @override
  void dispose() {
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BDPAppBar(
        appBar: AppBar(),
        title: 'Phone Number',
      ),
      body: SingleChildScrollView(
        child: Padding(
          // padding: BDPSpacingStyle.paddingWithAppBarHeight,
          padding: EdgeInsets.zero,
          child: BaseView<OtpViewModel>(
            builder: (context, otpConsumer, child) {
              return Form(
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
                      focusNode: phoneFocusNode,
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return "Phone number field must not be empty";
                        }
                        if(value.length != 10 || !value.startsWith('0')){
                          return "Phone number is invalid";
                        }
                        return null;
                      },
                      enabled: !otpConsumer.isSubmitted,
                      labelText: BDPTexts.phoneNo,
                      keyboardType: TextInputType.phone,
                      onTapOutside: (event){
                        phoneFocusNode.unfocus();
                      },
                    ),
                    const VSpace(
                      height: BDPSizes.spaceBtwSections,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BDPPrimaryButton(
                          buttonText: BDPTexts.otp,
                          isLoading: otpConsumer.isSubmitted,
                          onPressed: () async{
                            if (formKey.currentState!.validate()) {
                              await context.read<OtpViewModel>().sendOtp(
                                context,
                                requestBody: {
                                  "phoneNumber": phoneCtrl.text,
                                  'action':'sign-up',
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
