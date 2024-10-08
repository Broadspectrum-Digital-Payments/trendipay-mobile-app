
import 'dart:io';

import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/extensions/gesture_extension.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/utils/permission_util.dart';
import 'package:bdp_payment_app/core/view_models/base_view.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/network_image_view.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../../core/utils/media_file_util.dart';

class PersonalInfoTab extends StatefulWidget {
  const PersonalInfoTab({super.key});

  @override
  State<PersonalInfoTab> createState() => _PersonalInfoTabState();
}

class _PersonalInfoTabState extends State<PersonalInfoTab> {
  final selfieFilePath = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(BDPSizes.defaultSpace)),
        child: BaseView<UserViewModel>(
          builder: (context, userConsumer, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const BDPInput(
                //   labelText: 'Pius',
                //   enabled: false,
                // ),
                // const VSpace(height: BDPSizes.spaceBtwInputFields),
                // const BDPInput(
                //   labelText: 'fiifipius@gmail.com',
                //   enabled: false,
                // ),
                // const VSpace(height: BDPSizes.spaceBtwInputFields),
                Text("Picture",
                    style: kRegularFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(16),
                      color: BDPColors.dark90
                    )),
                const VSpace(height: BDPSizes.spaceBtwInputFields),
                Container(
                  width: double.infinity,
                  height: AppThemeUtil.height(200.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(AppThemeUtil.radius(12)),
                  ),
                  child: userConsumer.getUser.selfieUploaded?
                   NetworkImageView(
                     imageUrl: userConsumer.getUser.selfieFile.url?? '',
                     radius: 12.0,
                   )
                  :
                  ValueListenableBuilder<String>(
                    valueListenable: selfieFilePath,
                    builder: (context, selfieFilePathValue, child) {
                      return selfieFilePathValue.isEmpty?
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.file_upload_outlined,
                            color: Colors.grey,
                          ), // Icon
                          const VSpace(height: 8),
                          Text(
                            'Upload a clear selfie of yourself',
                            textAlign: TextAlign.center,
                            style: kRegularFontStyle.copyWith(
                                fontSize: AppThemeUtil.fontSize(16.0),
                                color: Colors.grey,
                            ),
                          )
                        ],
                      )
                          :
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppThemeUtil.radius(12)),
                        child: Image.file(File(selfieFilePathValue),
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                  ),
                ).onPressed(userConsumer.getUser.selfieUploaded? (){} : () async{
                  if(await PermissionUtil.getStoragePermission()){
                    final croppedFile = await MediaFileUtil.getPickedSourceImage(
                      cameraFront: true,
                      cropped: false,
                    );
                    if(croppedFile != null){
                      selfieFilePath.value = croppedFile;
                    }
                  }
                }),
                const VSpace(
                  height: BDPSizes.spaceBtwSections,
                ),

                if(!userConsumer.getUser.selfieUploaded) Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BDPPrimaryButton(
                        buttonText: BDPTexts.saveAndContinue,
                        imageIconFile: BDPImages.saveIcon,
                        onPressed: () async{
                          await context.read<UserViewModel>().uploadKYCFile(
                            context,
                            requestBody: {
                              'selfie': selfieFilePath.value,
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
