
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/sizes.dart';

class CardInfoTab extends StatefulWidget {
  const CardInfoTab({super.key});

  @override
  State<CardInfoTab> createState() => _CardInfoTabState();
}

class _CardInfoTabState extends State<CardInfoTab> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const kYCTextFields(label: BDPTexts.ghanaCardNumber,),
          // const SizedBox(
          //     height: BDPSizes.spaceBtwInputFields
          // ),
          // const kYCTextFields( label:BDPTexts.dateOfInsurance ,),
          // const SizedBox(
          //     height: BDPSizes.spaceBtwInputFields
          // ),
          // const kYCTextFields(label: BDPTexts.dateOfExpiry,),
          // const SizedBox(
          //     height: BDPSizes.spaceBtwInputFields
          // ),
          // const kYCTextFields(label: BDPTexts.placeOfInsurance,),
          // const SizedBox(
          //     height: BDPSizes.spaceBtwInputFields
          // ),
          //
          const Text("Front of card",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
          const SizedBox(height: BDPSizes.spaceBtwInputFields),
          GestureDetector(
            onTap: () async {

            },
            child: Container(
              width: double.infinity,
              height: 200, // Adjust height as needed
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Color of the border
                    width: 1, // Width of the border
                  ),
                  borderRadius: BorderRadius.circular(AppThemeUtil.radius(12.0))),
              // child: state.submittingData
              //     ? const Center(
              //         child: ZLoader(loaderColor: BDPColors.primary),
              //       )
              //     : state.documentFrontFile == null ?
              //     const Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Icon(Icons.file_upload_outlined), // Icon
              //           SizedBox(
              //               height: 8), // Spacer between icon and text
              //           Text(
              //             'Upload a clear image of the front of your card',
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 16,
              //                 color: Colors.grey),
              //           )
              //         ],
              //       )
              //         : ClipRRect(
              //             borderRadius: BorderRadius.circular(12.r),
              //             // child: Image.file(
              //             //   state.documentFrontFile!,
              //             //   fit: BoxFit.cover,
              //             // ),
              //           ),
            ),
          ),
          const SizedBox(height: BDPSizes.spaceBtwInputFields),
          const Text("Back of card",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
          const SizedBox(height: BDPSizes.spaceBtwInputFields),
          GestureDetector(
            onTap: () async {
            },
            child: Container(
              width: double.infinity,
              height: 200, // Adjust height as needed
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Color of the border
                    width: 1, // Width of the border
                  ),
                  borderRadius: BorderRadius.circular(AppThemeUtil.radius(12.0))),
              // child: state.submittingData
              //     ? Center(
              //         child: loader(loaderColor: BDPColors.primary),
              //       )
              //     : state.documentBackFile == null
              //         ? const Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Icon(Icons.file_upload_outlined), // Icon
              //               SizedBox(
              //                   height: 8), // Spacer between icon and text
              //               Text(
              //                 'Upload a clear image of the back of your card',
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.w400,
              //                     fontSize: 16,
              //                     color: Colors.grey),
              //               )
              //             ],
              //           )
              //         : ClipRRect(
              //             borderRadius: BorderRadius.circular(12.r),
              //             child: Image.file(
              //               state.documentBackFile!,
              //               fit: BoxFit.cover,
              //             ),
              //           ),
            ),
          ),
        ],
      ),
    );
  }
}
