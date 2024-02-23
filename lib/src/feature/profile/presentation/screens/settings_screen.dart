import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/feature/profile/presentation/widgets/setting_items.dart';
import 'package:bdp_payment_app/core/constants/image_strings.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../shared_widgets/common/authheaders.dart';



class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AuthHeader(
          icon: BDPImages.bdpIcon,
          title: BDPTexts.settings,
        ),
        automaticallyImplyLeading: false,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
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
                  onTap: () {},
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



