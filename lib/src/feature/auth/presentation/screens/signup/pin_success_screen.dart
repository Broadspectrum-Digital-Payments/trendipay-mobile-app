import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/view_models/otp_view_model.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/nav_bar_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/constants/styles.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/image_strings.dart';

class PinSuccessScreen extends StatefulWidget {
  const PinSuccessScreen({super.key});

  @override
  State<PinSuccessScreen> createState() => _PinSuccessScreenState();
}

class _PinSuccessScreenState extends State<PinSuccessScreen> {

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: AppThemeUtil.height(24.0)),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Text('Your pin has been successfully \nchanged!',
                style: kMediumFontStyle.copyWith(
                  fontSize: AppThemeUtil.fontSize(20.0),
                  color: BDPColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 2),

              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  BDPImages.pinSuccess,
                  height: AppThemeUtil.height(291),
                ),
              ),
              const Spacer(flex: 5),
            ],
          )
        ),
        bottomNavigationBar: NavBarWrapper(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
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
