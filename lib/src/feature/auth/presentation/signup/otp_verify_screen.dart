import 'dart:async';

import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/widgets/resend_otp_text.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../common/styles/spacing_styles.dart';
import '../../../../shared_widgets/common/authheaders.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key, this.otpCode,});

  final String? otpCode;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final formKey = GlobalKey<FormState>();
  StreamSubscription? _streamSubscription;
  StreamController<ErrorAnimationType>? errorController;
  final focusNode = FocusNode();
  Timer? _timer;
  int start = 150;
  int current = 150;

  @override
  void initState() {
    _streamSubscription = errorController?.stream.listen((event) {
      errorController!.add(ErrorAnimationType.shake);
    });
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    errorController?.close();
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
            padding: EdgeInsets.only(top: 48.0.h),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(20.0)),
                        child: OTPInput(
                          errorAnimationController: errorController,
                          // enabled: state.isSubmitting == false,
                          onCompleted: (code) {
                            print(code);

                            //focusNode.unfocus();
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
                        // isLoading: state.isSubmitting == true || bloc!.state.submittingData == true,
                        buttonText: 'Verify OTP',
                        onPressed: (){
                          AppNavigator.pushReplacementNamed(context, AppRoute.accountRegistrationScreen);
                          // if (formKey.currentState!.validate()) {
                          //
                          // }
                        },
                      ),
                    ],
                  ),
                  const VSpace(
                    height: BDPSizes.spaceBtwItems,
                  ),
                  Visibility(
                    // visible: bloc!.state.isPinChange == false,
                    child: ResendOTPText(
                      currentTime: current,
                      resendOtp: (){
                        resetAndAddTime();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
