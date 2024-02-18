import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentiation_events.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_states.dart';
import 'package:bdp_payment_app/features/authentication/screens/kyc/kyc_setup.dart';
import 'package:bdp_payment_app/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/button/button.dart';
import '../../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../authentication_blocs/authentication_blocs.dart';
import '../../../controllers/registration_controller.dart';

class PinSetupForm extends StatefulWidget {
  const PinSetupForm({
    super.key,
  });

  @override
  State<PinSetupForm> createState() => _PinSetupFormState();
}

class _PinSetupFormState extends State<PinSetupForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late RegistrationController controller;
  TextEditingController pinCtrl = TextEditingController();
  TextEditingController confirmPinCtrl = TextEditingController();

  bool confirmPassword = true;
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
              const SizedBox(
                height: BDPSizes.spaceBtwItems,
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
                  labelText: BDPTexts.pin,
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
                height: BDPSizes.spaceBtwInputFields,
              ),
              TextFormField(
                controller: confirmPinCtrl,
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return "confirm pin field must not be empty";
                  }if (int.parse(confirmPinCtrl.text) != int.parse(pinCtrl.text)) {
                    return "Your inputted pins do not match";
                  }
                  return null;
                },
                onChanged: (value) {
                  context.read<AuthenticationBloc>().add(ConfirmPinEvent(value: value));
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabled: state.submittingData == false,
                  labelText: BDPTexts.reEnterPin,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: (){
                      setState(() {
                        confirmPassword = !confirmPassword;
                      });
                    },
                      child: Icon(confirmPassword ? Iconsax.eye_slash : Iconsax.eye)),
                ),
                obscureText: confirmPassword,
              ),
              const SizedBox(
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
              SizedBox(
                width: 125,
                height: 50,
                child: Buttons(
                  buttonName: BDPTexts.setPin,
                  image: BDPImages.rightArrow,
                  isLoading: state.submittingData == true,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      controller.registerTheUser();
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
