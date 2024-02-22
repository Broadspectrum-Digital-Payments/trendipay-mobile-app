
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/bdp_input.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';

class PersonalInfoTab extends StatefulWidget {
  const PersonalInfoTab({super.key});

  @override
  State<PersonalInfoTab> createState() => _PersonalInfoTabState();
}

class _PersonalInfoTabState extends State<PersonalInfoTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BDPInput(
            labelText: 'Pius',
            enabled: false,
          ),
          const VSpace(height: BDPSizes.spaceBtwInputFields),
          const BDPInput(
            labelText: 'fiifipius@gmail.com',
            enabled: false,
          ),
          const VSpace(height: BDPSizes.spaceBtwInputFields),
          const Text("Picture",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
          const VSpace(height: BDPSizes.spaceBtwInputFields),
          GestureDetector(
            onTap: () async {

            },
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Color of the border
                    width: 1, // Width of the border
                  ),
                  borderRadius: BorderRadius.circular(AppThemeUtil.radius(12))),
              // child: state.submittingData ?
              // const Center(child: ZLoader(loaderColor: BDPColors.primary),)
              //     : state.profileFile == null ?
              // const Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(Icons.file_upload_outlined), // Icon
              //     SizedBox(height: 8), // Spacer between icon and text
              //     Text(
              //       'Upload a clear selfie of yourself',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w400,
              //           color: Colors.grey),
              //     )
              //   ],
              // ) : ClipRRect(
              //   borderRadius: BorderRadius.circular(12.r),
              //   child: Image.file(state.profileFile!,
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ),
          ),
          const VSpace(
            height: BDPSizes.spaceBtwSections,
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BDPPrimaryButton(
                  // isLoading: state.submittingData == true,
                  buttonText: BDPTexts.saveAndContinue,
                  imageIconFile: BDPImages.saveIcon,
                  onPressed: () {

                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
