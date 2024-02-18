import 'package:bdp_payment_app/common/widgets/button/button.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentiation_events.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_blocs.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_states.dart';
import 'package:bdp_payment_app/features/authentication/controllers/kyc_controller.dart';
import 'package:bdp_payment_app/navigation_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../textformfield.dart';

class PersonalInfo extends StatefulWidget {
  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  late KYCController controller;

  @override
  void initState() {
    controller = KYCController(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationStates>(
        builder: (context, state) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kYCTextFields(
              label: controller.name,
              enabled: false,
            ),
            const SizedBox(height: BDPSizes.spaceBtwInputFields),
            kYCTextFields(
              label: controller.email,
              enabled: false,
            ),
            const SizedBox(height: BDPSizes.spaceBtwInputFields),
            const Text("Picture",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(height: BDPSizes.spaceBtwInputFields),
            GestureDetector(
              onTap: () {
                controller.selectAnImage("profile-image").then((value) {
                  context.read<AuthenticationBloc>().add(ProfilePicEvent(file: value));
                });
              },
              child: Container(
                width: 600, // Adjust width as needed
                height: 200, // Adjust height as needed
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Color of the border
                      width: 1, // Width of the border
                    ),
                    borderRadius: BorderRadius.circular(12.r)),
                child: state.profilePic == null ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.file_upload_outlined), // Icon
                    SizedBox(height: 8), // Spacer between icon and text
                    Text(
                      'Upload a clear selfie of yourself',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    )
                  ],
                ) : ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.file(state.profilePic!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: BDPSizes.spaceBtwSections,
            ),
            Center(
                child: SizedBox(
                    width: 220.w,
                    height: 50.h,
                    child: Buttons(
                      isLoading: state.submittingData == true,
                      buttonName: BDPTexts.saveAndContinue,
                      image: BDPImages.saveIcon,
                      onPressed: () {
                        controller.saveAllDocuments();
                      },
                    ))),
          ],
        ),
      );
    });
  }
}
