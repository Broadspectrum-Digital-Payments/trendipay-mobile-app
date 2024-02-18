import 'dart:async';

import 'package:bdp_payment_app/common/widgets/success_screen/success_screen.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_events.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_states.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_controller/transfer_controller.dart';
import 'package:bdp_payment_app/navigation_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../common/widgets/button/button.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../authentication/screens/otp_screen/widgets/otp_widgets.dart';

class TransactionVerifyOTP extends StatefulWidget {
  const TransactionVerifyOTP({super.key});

  @override
  State<TransactionVerifyOTP> createState() => _TransactionVerifyOTPState();
}

class _TransactionVerifyOTPState extends State<TransactionVerifyOTP> {
  late TransFerController controller;
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
    controller = TransFerController(context: context);
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
    return BlocBuilder<TransferBloc, TransferStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0, // Removes the shadow
            automaticallyImplyLeading: false,
            title: AuthHeader(
              icon: BDPImages.bdpIcon,
              title: BDPTexts.transactionOTP,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: BDPSpacingStyle.paddingWithAppBarHeight,
              child: Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: BDPSizes.spaceBtwSections,
                    ),
                    /// FORM
                    Form(
                      key: formKey,
                      child: Center(
                        child: SizedBox(
                          height: 80,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: reusableOtpWidget(
                                context,
                                controller: codeCtrl,
                                errorAnimationController: errorController,
                                enabled: state.completingTransfer == false,
                                onCompleted: (code) {
                                  context.read<TransferBloc>().add(OtpEvent(otp: code));
                                }
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: BDPSizes.spaceBtwSections,
                    ),
                    SizedBox(
                      width: 149,
                      height: 50,
                      child: Buttons(
                        isLoading: state.completingTransfer == true,
                        buttonName: BDPTexts.verifyOtp,
                        image: BDPImages.rightArrow,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.otpVerify();
                          }
                        },
                      ),
                    ),

                    const SizedBox(
                      height: BDPSizes.spaceBtwItems,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          BDPTexts.noOtp,
                          style: TextStyle(
                            color: Color(0xff332f2e),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "$current ",
                              style: TextStyle(
                                color: BDPColors.primary,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(width: 3.w,),
                            GestureDetector(
                              onTap: current == 0 ? () {
                                controller.sendOtp(resendOtp: true);
                                resetAndAddTime();
                              } : null,
                              child: Text(
                                "Resend OTP",
                                style: TextStyle(
                                  color: BDPColors.primary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
