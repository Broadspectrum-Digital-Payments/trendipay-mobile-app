import 'package:bdp_payment_app/features/mainscreens/screens/settings/widgets/setting_items.dart';
import 'package:bdp_payment_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../common/widgets/custom_appbar/custom_appbar.dart';
import '../system_support/system_support.dart';



class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarTitle: BDPTexts.settings,),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BDPSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SettingsItem(settingType: BDPTexts.generalSettings, settingsOption: BDPTexts.kycSettings, image: BDPImages.kycImage,),
              const SettingsItem(settingType: BDPTexts.privacySettings, settingsOption: BDPTexts.kycSettings, image: BDPImages.kycImage,),
              const SettingsItem(settingType: BDPTexts.notificationSettings, settingsOption: BDPTexts.kycSettings, image: BDPImages.kycImage,),
              const SettingsItem(settingType: BDPTexts.securitySettings, settingsOption: BDPTexts.kycSettings, image: BDPImages.kycImage,),
              const SettingsItem(settingType: BDPTexts.accountSettings, settingsOption: BDPTexts.kycSettings, image: BDPImages.kycImage,),
              Padding(
                padding: const EdgeInsets.only(left:28.0),
                child: GestureDetector(
                  onTap: () {Get.to(const SystemSupportScreen());},
                  child: Row(
                    children: [
                      Image.asset(BDPImages.systemSupport),
                      const Text(BDPTexts.systemSupport),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



