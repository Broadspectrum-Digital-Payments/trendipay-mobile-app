import 'dart:io';

import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentiation_events.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_blocs.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../controllers/kyc_controller.dart';
import '../textformfield.dart';

class CardInfo extends StatefulWidget {
  @override
  State<CardInfo> createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {

  late KYCController controller;

  AuthenticationBloc? bloc;
  File? backDocumentImage;

  File? fromDocumentImage;
  @override
  void initState() {
    bloc = context.read<AuthenticationBloc>();
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
                var image = await controller.selectAnImage("document-front-image");
                bloc!.add(DocumentFrontFileEvent(file: image));
                var multipartImg = await controller.getMultiPartFile(image);
                bloc!.add(DocumentFrontEvent(file: multipartImg));
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
                child: state.documentFrontFile == null
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.file_upload_outlined), // Icon
                          SizedBox(height: 8), // Spacer between icon and text
                          Text(
                            'Upload a clear image of the front of your card',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.grey),
                          )
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.file(
                          state.documentFrontFile!,
                          fit: BoxFit.cover,
                        ),
                      ),
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
              onTap: () async{
                var image = await controller.selectAnImage("document-back-image");
                bloc!.add(DocumentBackFileEvent(file: image));
                var multipartImg = await controller.getMultiPartFile(image);
                bloc!.add(DocumentBackEvent(file: multipartImg));
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
                child: state.documentBackFile == null
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.file_upload_outlined), // Icon
                          SizedBox(height: 8), // Spacer between icon and text
                          Text(
                            'Upload a clear image of the back of your card',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.grey),
                          )
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.file(
                          state.documentBackFile!,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
