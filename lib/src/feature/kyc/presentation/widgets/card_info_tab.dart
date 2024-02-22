
import 'dart:io';

import 'package:bdp_payment_app/common/constants/styles.dart';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/utils/media_file_util.dart';
import '../../../../../core/view_models/user_view_model.dart';

class CardInfoTab extends StatefulWidget {
  const CardInfoTab({super.key});

  @override
  State<CardInfoTab> createState() => _CardInfoTabState();
}

class _CardInfoTabState extends State<CardInfoTab> {
  final frontCardFilePath = ValueNotifier<String>('');
  final backCardFilePath = ValueNotifier<String>('');

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
              final croppedFile = await MediaFileUtil.getPickedSourceImage(
                cropped: false,
              );
              if(croppedFile != null){
                frontCardFilePath.value = croppedFile;
                if(!context.mounted) return;
                await context.read<UserViewModel>().uploadKYCFile(
                  context,
                  requestBody: {
                    'ghana-card-front': croppedFile,
                  },
                );
              }
            },
            child: Container(
              width: double.infinity,
              height: AppThemeUtil.height(200),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Color of the border
                    width: 1, // Width of the border
                  ),
                  borderRadius: BorderRadius.circular(AppThemeUtil.radius(12.0))),
              child: ValueListenableBuilder<String>(
                valueListenable: frontCardFilePath,
                builder: (context, fromCardFilePathValue, child) {
                  return fromCardFilePathValue.isEmpty ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.file_upload_outlined), // Icon
                      const VSpace(height: 8), // Spacer between icon and text
                      Text(
                        'Upload a clear image of the front of your card',
                        textAlign: TextAlign.center,
                        style: kRegularFontStyle.copyWith(
                          fontSize: AppThemeUtil.fontSize(16),
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                  :
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppThemeUtil.radius(12)),
                    child: Image.file(
                      File(fromCardFilePathValue),
                      fit: BoxFit.cover,
                    ),
                  );
                }
              ),
            ),
          ),
          const SizedBox(height: BDPSizes.spaceBtwInputFields),
          Text("Back of card",
              style: kRegularFontStyle.copyWith(
                fontSize: AppThemeUtil.fontSize(16),
                color: BDPColors.dark90,
              ),
          ),
          const SizedBox(height: BDPSizes.spaceBtwInputFields),
          GestureDetector(
            onTap: () async {
              final croppedFile = await MediaFileUtil.getPickedSourceImage(
                cropped: false,
              );
              if(croppedFile != null){
                backCardFilePath.value = croppedFile;
                if(!context.mounted) return;
                await context.read<UserViewModel>().uploadKYCFile(
                  context,
                  requestBody: {
                    'ghana-card-back': croppedFile,
                  },
                );
              }
            },
            child: Container(
              width: double.infinity,
              height: AppThemeUtil.height(200),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Color of the border
                    width: 1, // Width of the border
                  ),
                  borderRadius: BorderRadius.circular(AppThemeUtil.radius(12.0))),
              child: ValueListenableBuilder<String>(
                valueListenable: backCardFilePath,
                builder: (context, backCardFilePathValue, child) {
                  return backCardFilePathValue.isEmpty ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.file_upload_outlined), // Icon
                      const VSpace(height: 8),
                      Text(
                        'Upload a clear image of the back of your card',
                        textAlign: TextAlign.center,
                        style: kRegularFontStyle.copyWith(
                          fontSize: AppThemeUtil.fontSize(16),
                          color: Colors.grey,
                        ),
                      )
                    ],
                )
                :
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppThemeUtil.radius(12)),
                  child: Image.file(
                    File(backCardFilePathValue),
                    fit: BoxFit.cover,
                  ),
                );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
