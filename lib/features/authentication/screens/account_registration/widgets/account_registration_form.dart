import 'package:bdp_payment_app/common/constants/global_constants.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentiation_events.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_blocs.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_states.dart';
import 'package:bdp_payment_app/features/authentication/controllers/registration_controller.dart';
import 'package:bdp_payment_app/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/button/button.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../pin_setup/pin_setup_screen.dart';
import 'checkbox.dart';


class AccountRegistrationForm extends StatefulWidget {
  const AccountRegistrationForm({
    super.key,
  });

  @override
  State<AccountRegistrationForm> createState() => _AccountRegistrationFormState();
}

class _AccountRegistrationFormState extends State<AccountRegistrationForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late RegistrationController controller;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+$");
  RegExp phoneRegExp = RegExp(r"^(\+\d{1,3})?[\s.-]?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}(?:\s?(?:ext|x)\d{1,5})?$");

  @override
  void initState() {
    controller = RegistrationController(context: context);
    phoneCtrl.text = controller.phone;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationStates>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: BDPSizes.spaceBtwSections),
            child: Column(
              children: [
                TextFormField(
                  controller: nameCtrl,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Username field must not be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    context.read<AuthenticationBloc>().add(NameEvent(value: value));
                  },
                  decoration: InputDecoration(
                    enabled: state.submittingData == false,
                    labelText: BDPTexts.fullName, labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                  ),
                ),
                const SizedBox(
                  height: BDPSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Email field must not be empty";
                    }
                    // else if(!emailRegExp.hasMatch(value)) {
                    //   return "Input value is not a valid email address";
                    // }
                    return null;
                  },
                  onChanged: (value) {
                    context.read<AuthenticationBloc>().add(EmailEvent(value: value));
                  },
                  decoration: InputDecoration(
                    enabled: state.submittingData == false,
                    labelText: BDPTexts.emails, labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                  ),
                ),
                const SizedBox(
                  height: BDPSizes.spaceBtwInputFields,
                ),
                TextFormField(
                    controller: phoneCtrl,
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return "Phone field must not be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      context.read<AuthenticationBloc>().add(PhoneEvent(value: value));
                    },
                  decoration: InputDecoration(
                    enabled: state.isMobileMoneyNumber == false,
                    labelText: BDPTexts.phoneNo, labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                  ),
                ),
                const SizedBox(
                  height: BDPSizes.spaceBtwItems,
                ),
                Row(
                  children: [
                    ARCheckbox(
                      value: state.isMobileMoneyNumber,
                      onChanged: (value){
                        context.read<AuthenticationBloc>().add(MobileMoneyEvent(value: value!));
                      },
                    ),
                    const Text(
                      BDPTexts.mNmM,
                      style: TextStyle(
                        fontSize: 12,
                        color: BDPColors.primary
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: BDPSizes.spaceBtwItems,
                ),
                SizedBox(
                  width: 109,
                  height: 50,
                  child: Buttons(buttonName: BDPTexts.next, image: BDPImages.rightArrow, onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Get.to(()=> const PinSetup());
                    }
                  },),
                ),

              ],
            ),
          ),
        );
      }
    );
  }
}
