import 'dart:async';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/view_models/base_view.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/view_models/otp_view_model.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/widgets/resend_otp_text.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../common/styles/spacing_styles.dart';
import '../../../../../shared_widgets/common/authheaders.dart';
import '../../../../../../core/constants/image_strings.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/constants/text_strings.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  Timer? _timer;
  int start = 150;
  int current = 150;
  final inputOtpCode = ValueNotifier<String>('');

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (current > 0) {
        current--;
      }  else {
        _timer?.cancel();
      }
      setState(() {
      });
    });
  }

  void resetAndAddTime(){
    start+=30;
    current = start;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.otpTitle),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: BDPSpacingStyle.paddingWithAppBarHeight,
          child: Padding(
            padding: EdgeInsets.only(top: AppThemeUtil.height(48.0)),
            child: Form(
              key: formKey,
              child: BaseView<OtpViewModel>(
                builder: (context, otpConsumer, child) {
                  return Column(
                    children: [
                      Center(
                        child: SizedBox(
                          height: AppThemeUtil.height(80),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(20.0)),
                            child: OTPInput(
                              enabled: !otpConsumer.isSubmitted,
                              onCompleted: (code) {
                                print(code);
                                inputOtpCode.value = code;
                              }
                            ),
                          ),
                        ),
                      ),
                      const VSpace(
                        height: BDPSizes.spaceBtwSections,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BDPPrimaryButton(
                            isLoading: otpConsumer.isSubmitted,
                            buttonText: 'Verify OTP',
                            onPressed: () async{
                              if (formKey.currentState!.validate()) {
                                await context.read<OtpViewModel>().verifyOtp(
                                  context,
                                  requestBody: {
                                    "phoneNumber": otpConsumer.getOtpRequestBody['phoneNumber'],
                                    "otp": inputOtpCode.value,
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      const VSpace(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      ResendOTPText(
                        currentTime: current,
                        resendOtp: () async{
                          await context.read<OtpViewModel>().sendOtp(
                            context,
                            resend: true,
                            requestBody: otpConsumer.getOtpRequestBody,
                          );
                          resetAndAddTime();
                        },
                      )
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
