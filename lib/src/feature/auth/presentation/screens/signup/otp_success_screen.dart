import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:flutter/material.dart';
import '../../../../../../common/styles/spacing_styles.dart';
import '../../../../../shared_widgets/common/authheaders.dart';
import '../../../../../../core/constants/image_strings.dart';
import '../../../../../../core/constants/text_strings.dart';

class OtpSuccessScreen extends StatefulWidget {
  const OtpSuccessScreen({super.key});

  @override
  State<OtpSuccessScreen> createState() => _OtpSuccessScreenState();
}

class _OtpSuccessScreenState extends State<OtpSuccessScreen> {

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.otpTitle),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: BDPSpacingStyle.paddingWithAppBarHeight,
            child: Padding(
              padding: EdgeInsets.only(top: AppThemeUtil.height(24.0)),
              child: Column(
                children: [
                  Text('Your pin has been successfully created!',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: AppThemeUtil.fontSize(20.0),
                    ),
                  ),

                  Image.asset(
                    BDPImages.otpSuccess,
                    height: AppThemeUtil.height(291),
                  ),
                ],
              )
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppThemeUtil.width(kWidthPadding),
            vertical: AppThemeUtil.height(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BDPPrimaryButton(
                buttonText: 'Go to Homepage',
                onPressed: (){

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
