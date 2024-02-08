import 'package:bdp_payment_app/common/widgets/button/button.dart';
import 'package:bdp_payment_app/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../textformfield.dart';


class PersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const kYCTextFields(label: BDPTexts.name,),
          const SizedBox(
            height: BDPSizes.spaceBtwInputFields
          ),
         const kYCTextFields( label:BDPTexts.emailAddress ,),
          const SizedBox(
              height: BDPSizes.spaceBtwInputFields
          ),
          const Text(
            "Picture",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )
          ),
          const SizedBox(
              height: BDPSizes.spaceBtwInputFields
          ),
          Container(
            width: 600, // Adjust width as needed
            height: 200, // Adjust height as needed
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Color of the border
                width: 1, // Width of the border
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.file_upload_outlined), // Icon
                SizedBox(height: 8), // Spacer between icon and text
                Text('Upload a clear selfie of yourself', textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey
                ),)
              ],
            ),
          ),
          const SizedBox(
            height: BDPSizes.spaceBtwSections,
          ),
          Center(child: SizedBox(width:205, height:50 ,child: Buttons(buttonName: BDPTexts.saveAndContinue, image: BDPImages.saveIcon, onPressed: () { Get.to(const NavigationMenu()); },))),
        ],
      
      ),
    );
  }
}

