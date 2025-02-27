import 'dart:async';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/view_models/otp_view_model.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/widgets/resend_otp_text.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/constants/common.dart';
import '../../../../../../core/view_models/base_view.dart';
import '../../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/constants/text_strings.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key, this.otpType,});

  final String? otpType;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  Timer? _timer;
  int start = 150;
  int current = 150;
  final inputOtpCode = ValueNotifier<String>('');  // Tracks OTP input
  final otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startTimer();
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
      setState(() {});
    });
  }

  void resetAndAddTime() {
    start += 30;  // Increase the time by 30 seconds on resend
    current = start;
    startTimer();  // Restart the timer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BDPAppBar(
        appBar: AppBar(),
        title: '${widget.otpType ?? ''} ${BDPTexts.otpTitle}',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
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
                          height: AppThemeUtil.height(MediaQuery.of(context).size.height < 550 ? 100 : 80),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(20.0)),
                            child: OTPInput(
                              controller: otpController,
                              enabled: !otpConsumer.isSubmitted,
                              onCompleted: (code) {
                                inputOtpCode.value = code;
                              },
                            ),
                          ),
                        ),
                      ),
                      const VSpace(height: BDPSizes.spaceBtwSections),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BDPPrimaryButton(
                            isLoading: otpConsumer.isSubmitted,
                            buttonText: 'Verify OTP',
                            onPressed: () async {
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
                      const VSpace(height: BDPSizes.spaceBtwItems),
                      ResendOTPText(
                        currentTime: current,
                        resendOtp: () async {
                          otpController.clear();  // Clear the OTP input field
                          await context.read<OtpViewModel>().sendOtp(
                            context,
                            resend: true,
                            phoneNumber: otpConsumer.getOtpRequestBody['phoneNumber'],
                          );
                          resetAndAddTime();  // Reset the timer for resend
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

