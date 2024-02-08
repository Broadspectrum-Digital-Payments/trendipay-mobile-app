import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../textformfield.dart';


class CardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const kYCTextFields(label: BDPTexts.ghanaCardNumber,),
          const SizedBox(
              height: BDPSizes.spaceBtwInputFields
          ),
          const kYCTextFields( label:BDPTexts.dateOfInsurance ,),
          const SizedBox(
              height: BDPSizes.spaceBtwInputFields
          ),
          const kYCTextFields(label: BDPTexts.dateOfExpiry,),
          const SizedBox(
              height: BDPSizes.spaceBtwInputFields
          ),
          const kYCTextFields(label: BDPTexts.placeOfInsurance,),
          const SizedBox(
              height: BDPSizes.spaceBtwInputFields
          ),
      
          const Text(
              "Front of card",
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
                Text('Upload a clear image of the front of your card', textAlign: TextAlign.center,style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.grey
                ),)
              ],
            ),
          ),
          const SizedBox(
              height: BDPSizes.spaceBtwInputFields
          ),
          const Text(
              "Back of card",
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
                Text('Upload a clear image of the back of your card', textAlign: TextAlign.center, style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,color: Colors.grey
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}