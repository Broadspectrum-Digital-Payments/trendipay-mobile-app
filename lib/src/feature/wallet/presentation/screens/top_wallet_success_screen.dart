import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/styles.dart';
import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/routing/app_navigator.dart';
import '../../../../../core/utils/app_theme_util.dart';
import '../../../../shared_widgets/buttons/bdp_primary_button.dart';
import '../../../../shared_widgets/common/authheaders.dart';
import '../../../../shared_widgets/common/nav_bar_wrapper.dart';
import '../../../../shared_widgets/common/v_space.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';


class TopUpWalletSuccessScreen extends StatelessWidget {
  const TopUpWalletSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.topUp),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: BDPSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                const VSpace(height: 70.0),
                Text(
                  BDPTexts.transactionConfirmed,
                  style: kMediumFontStyle.copyWith(
                    fontSize: AppThemeUtil.fontSize(20),
                    color: BDPColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const VSpace(height: 22.0),
                Image.asset(
                  BDPImages.transactionConfirmed,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),

        bottomNavigationBar: NavBarWrapper(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BDPPrimaryButton(
                buttonText: 'Done',
                onPressed: (){
                  AppNavigator.pushNamedAndRemoveUntil(context, AppRoute.homeScreen, (p0) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}