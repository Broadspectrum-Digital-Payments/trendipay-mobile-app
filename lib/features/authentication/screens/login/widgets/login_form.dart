import 'package:bdp_payment_app/common/widgets/button/button.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_blocs.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_states.dart';
import 'package:bdp_payment_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../authentication_blocs/authentiation_events.dart';
import '../../../controllers/registration_controller.dart';
import '../../phonenumber_authentication/phone_number.dart';

class BDPLoginForm extends StatefulWidget {
  const BDPLoginForm({
    super.key,
  });

  @override
  State<BDPLoginForm> createState() => _BDPLoginFormState();
}

class _BDPLoginFormState extends State<BDPLoginForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late RegistrationController controller;
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController pinCtrl = TextEditingController();

  bool password = true;

  @override
  void initState() {
    controller = RegistrationController(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationStates>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: phoneCtrl,
                keyboardType: TextInputType.phone,
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
                  enabled: state.submittingData == false,
                  labelText: BDPTexts.phoneNo, labelStyle: TextStyle(
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
                controller: pinCtrl,
                keyboardType: TextInputType.number,
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return "Pin field must not be empty";
                  }
                  return null;
                },
                onChanged: (value) {
                  context.read<AuthenticationBloc>().add(PinEvent(value: value));
                },
                decoration: InputDecoration(
                  enabled: state.submittingData == false,
                  labelText: BDPTexts.password,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                  suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          password = !password;
                        });
                      },
                      child: Icon(password ? Iconsax.eye_slash : Iconsax.eye)),
                ),
                obscureText: password,
              ),
              const SizedBox(
                height: BDPSizes.spaceBtwItems * 2,
              ),
              SizedBox(
                width: 119,
                height: 50,
                child: Buttons(
                  buttonName: BDPTexts.login,
                  isLoading: state.submittingData == true,
                  image: BDPImages.rightArrow,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      controller.loginUser();
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      BDPTexts.forgetPassword,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    BDPTexts.hasAccount,
                    style: TextStyle(
                      color: Color(0xff332f2e),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const PhoneNumberScreen());
                    },
                    child: const Text(
                      BDPTexts.signup,
                      style: TextStyle(
                        color: BDPColors.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }
    );
  }
}
