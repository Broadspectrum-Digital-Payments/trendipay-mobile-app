
import 'dart:io';

import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
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
import '../../../../../core/utils/permission_util.dart';

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
        padding: const EdgeInsets.all(BDPSizes.defaultSpace),
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
                const Text("Picture",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
                const VSpace(height: BDPSizes.spaceBtwInputFields),
                GestureDetector(
                  onTap: userConsumer.getUser.selfieUploaded? null : () async {
                    if(await PermissionUtil.getStoragePermission()){
                      final croppedFile = await MediaFileUtil.getPickedSourceImage(
                        cameraFront: true,
                        cropped: false,
                      );
                      if(croppedFile != null){
                        selfieFilePath.value = croppedFile;
                      }
                    }
                  },
                  child: Container(
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
                  ),
                ),
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
