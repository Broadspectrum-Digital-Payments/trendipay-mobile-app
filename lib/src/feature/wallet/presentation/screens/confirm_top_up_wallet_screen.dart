import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/sizes.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';
import '../../../../../core/routing/app_route.dart';
import '../../../../shared_widgets/buttons/bdp_primary_button.dart';
import '../../../../shared_widgets/common/authheaders.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';


class ConfirmTopUpWalletScreen extends StatefulWidget {
  const ConfirmTopUpWalletScreen({super.key});

  @override
  State<ConfirmTopUpWalletScreen> createState() => _ConfirmTopUpWalletScreenState();
}

class _ConfirmTopUpWalletScreenState extends State<ConfirmTopUpWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.topUp),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 24),
          onPressed: () => AppNavigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppThemeUtil.radius(BDPSizes.defaultSpace)),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                const VSpace(height: 70.0),
                Text(
                  'Transaction Confirmation',
                  style: kMediumFontStyle.copyWith(
                    fontSize: AppThemeUtil.fontSize(20),
                    color: BDPColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const VSpace(height: 20.0),
                Text(
                  'Your transaction is currently being\nprocessed. Please wait for the prompt to authorize\nthe transaction',
                  style: kRegularFontStyle.copyWith(
                    fontSize: AppThemeUtil.fontSize(14),
                    color: BDPColors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const VSpace(height: 60.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BDPPrimaryButton(
                      buttonText: 'Confirm Transaction',
                      onPressed: (){
                        AppNavigator.pushNamed(context, AppRoute.topUpWalletSuccessScreen);
                      },
                    ),
                  ],
                ),
                const VSpace(height: 10.0),
                // Text(
                //   'Prompt not received? 10s',
                //   style: kRegularFontStyle.copyWith(
                //     fontSize: AppThemeUtil.fontSize(14),
                //     color: BDPColors.grey,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
