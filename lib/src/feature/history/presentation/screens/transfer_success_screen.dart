import 'package:bdp_payment_app/common/constants/styles.dart';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/view_models/otp_view_model.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../common/styles/spacing_styles.dart';
import '../../../../../../core/constants/image_strings.dart';

class TransferSuccessScreen extends StatelessWidget {
  const TransferSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: BDPSpacingStyle.paddingWithAppBarHeight,
            child: Padding(
              padding: EdgeInsets.only(top: AppThemeUtil.height(24.0)),
              child: Column(
                children: [
                  Text('Your payment was successful!',
                    style: kMediumFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(20.0),
                      color: BDPColors.primary,
                    ),
                  ),

                  Image.asset(
                    BDPImages.transferSuccess,
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
                  context.read<OtpViewModel>().clearRequestBody();
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
