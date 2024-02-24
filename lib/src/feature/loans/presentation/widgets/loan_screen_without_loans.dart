import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/image_strings.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routing/app_navigator.dart';
import '../../../../../core/routing/app_route.dart';
import '../../../../shared_widgets/buttons/bdp_primary_button.dart';


class LoanScreenWithOutLoans extends StatelessWidget {
  const LoanScreenWithOutLoans({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            BDPImages.loanWelcome,
            fit: BoxFit.cover,
          ),
        ),
        const Spacer(flex: 1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(32)),
          child: Text(
            'Easy, fast and accessible loans to help with emergency situations and businesses.',
            style: kMediumFontStyle.copyWith(
              fontSize: AppThemeUtil.fontSize(14.0),
              color: BDPColors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(flex: 5),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BDPPrimaryButton(
              buttonText: 'Apply for loan',
              imageIconFile: BDPImages.loansWhite,
              onPressed: (){
                AppNavigator.pushNamed(context, AppRoute.applyNewLoanScreen);
              },
            ),
          ],
        ),
        const VSpace(height: 10.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BDPPrimaryButton(
              buttonText: 'Check Credit Worthiness',
              backgroundColor: BDPColors.white,
              textColor: BDPColors.brightPurple,
              imageIconFile: BDPImages.creditCard,
              onPressed: (){

              },
            ),
          ],
        ),
        const VSpace(height: 18.0),
      ],
    );
  }
}
