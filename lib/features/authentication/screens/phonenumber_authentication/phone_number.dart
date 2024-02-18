import 'package:bdp_payment_app/common/widgets/button/button.dart';
import 'package:bdp_payment_app/features/authentication/screens/phonenumber_authentication/phone_number_blocs/phone_number_bloc.dart';
import 'package:bdp_payment_app/features/authentication/screens/phonenumber_authentication/phone_number_blocs/phone_number_events.dart';
import 'package:bdp_payment_app/features/authentication/screens/phonenumber_authentication/phone_number_blocs/phone_number_state.dart';
import 'package:bdp_payment_app/features/authentication/screens/phonenumber_authentication/phone_number_controller/phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../login/widgets/login_form.dart';
import '../otp_screen/otp_verify_screen.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {

  late PhoneNumberController phoneNumberController;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController phoneCtrl = TextEditingController();



  @override
  void initState() {
    phoneNumberController = PhoneNumberController(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneNumberBlocs, PhoneNumberStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: AuthHeader(
                icon: BDPImages.bdpIcon, title: BDPTexts.phoneNumberTitle),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: BDPSpacingStyle.paddingWithAppBarHeight,
              child: Form(
                key: globalKey,
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

                    const SizedBox(
                      height: BDPSizes.spaceBtwSections,
                    ),
                    TextFormField(
                      controller: phoneCtrl,
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return "Phone number field must not be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        context.read<PhoneNumberBlocs>().add(AddMediumEvent(medium: value));
                      },
                      decoration: InputDecoration(
                        labelText: BDPTexts.phoneNo,
                        enabled: state.isSubmitting == false,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: BDPSizes.spaceBtwSections,
                    ),
                    SizedBox(
                        width: 142,
                        height: 50,
                        child: Buttons(
                          buttonName: BDPTexts.otp,
                          image: BDPImages.rightArrow,
                          isLoading: state.isSubmitting == true,
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {
                              phoneNumberController.generateOtp();
                            }
                          },
                        )),
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
