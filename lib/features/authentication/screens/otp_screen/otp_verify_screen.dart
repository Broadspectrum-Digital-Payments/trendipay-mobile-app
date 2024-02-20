import 'dart:async';

import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentiation_events.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_blocs.dart';
import 'package:bdp_payment_app/features/authentication/controllers/registration_controller.dart';
import 'package:bdp_payment_app/features/authentication/screens/otp_screen/widgets/otp_widgets.dart';
import 'package:bdp_payment_app/features/authentication/screens/otp_screen/widgets/resend_otp_text.dart';
import 'package:bdp_payment_app/features/authentication/screens/otp_screen/widgets/verify_otp_button.dart';
import 'package:bdp_payment_app/features/authentication/screens/otp_screen/widgets/verify_otp_textfield.dart';
import 'package:bdp_payment_app/features/authentication/screens/phonenumber_authentication/phone_number_blocs/phone_number_bloc.dart';
import 'package:bdp_payment_app/features/authentication/screens/phonenumber_authentication/phone_number_blocs/phone_number_events.dart';
import 'package:bdp_payment_app/features/authentication/screens/phonenumber_authentication/phone_number_blocs/phone_number_state.dart';
import 'package:bdp_payment_app/features/authentication/screens/phonenumber_authentication/phone_number_controller/phone_number_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  late PhoneNumberController phoneNumberController;
  late RegistrationController registrationController;
  AuthenticationBloc? bloc;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController codeCtrl = TextEditingController();
  StreamSubscription? _streamSubscription;
  StreamController<ErrorAnimationType>? errorController;
  FocusNode focusNode = FocusNode();
  Timer? _timer;
  int start = 150;
  int current = 150;

  @override
  void initState() {
    bloc = context.read<AuthenticationBloc>();
    phoneNumberController = PhoneNumberController(context: context);
    registrationController = RegistrationController(context: context);
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
    return BlocBuilder<PhoneNumberBlocs, PhoneNumberStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.otpTitle),
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
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: reusableOtpWidget(
                              context,
                              controller: codeCtrl,
                              errorAnimationController: errorController,
                              enabled: state.isSubmitting == false,
                              onCompleted: (code) {
                                if(bloc!.state.isPinChange){
                                  bloc!.add(ChangePinOtpEvent(value: code));
                                }else {
                                  context.read<PhoneNumberBlocs>().add(AddOtpEvent(otp: code));
                                }

                                //focusNode.unfocus();
                              }
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: BDPSizes.spaceBtwSections,
                      ),
                      VerifyOTPButton(
                        isLoading: state.isSubmitting == true || bloc!.state.submittingData == true,
                        onTap: (){
                          if (formKey.currentState!.validate()) {
                            if (bloc!.state.isPinChange) {
                              registrationController.confirmPinChange();
                            }else {
                              phoneNumberController.otpVerify();
                            }

                          }
                        },
                      ),
                      const SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      Visibility(
                        visible: bloc!.state.isPinChange == false,
                        child: ResendOTPText(
                          currentTime: current,
                          resendOtp: (){
                            phoneNumberController.generateOtp(resendOtp: true);
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
    );
  }
}
