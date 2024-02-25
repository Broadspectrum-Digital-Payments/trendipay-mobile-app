
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/core/constants/image_strings.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_space.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/styles.dart';
import '../../../../../core/routing/app_navigator.dart';
import '../../../../../core/routing/app_route.dart';
import '../../../../shared_widgets/base/bdp_appbar.dart';


class LoanReviewScreen extends StatefulWidget {
  const LoanReviewScreen({super.key});

  @override
  State<LoanReviewScreen> createState() => _LoanReviewScreenState();
}

class _LoanReviewScreenState extends State<LoanReviewScreen> {

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: BDPAppBar(
          appBar: AppBar(),
          title: 'Loan Application Review',
          hasLeading: false,
        ),
        body: Padding(
            padding: EdgeInsets.only(top: AppThemeUtil.height(24.0)),
            child: Column(
              children: [
                const Spacer(flex: 1),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    BDPImages.loanReview,
                    height: AppThemeUtil.height(291),
                  ),
                ),
                const Spacer(flex: 1),
                Text(
                  'Your loan application is in review.',
                  style: kRegularFontStyle.copyWith(
                    fontSize: AppThemeUtil.fontSize(14.0),
                    color: BDPColors.grey,
                  ),
                ),
                const Spacer(flex: 8),
              ],
            )
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: AppThemeUtil.width(50),
            right: AppThemeUtil.width(50),
            bottom: AppThemeUtil.height(50),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 7,
                child: BDPPrimaryButton(
                  backgroundColor: BDPColors.white,
                  textColor: BDPColors.primary,
                  imageIconFile: BDPImages.home,
                  buttonText: 'Go to Homepage',
                  onPressed: (){
                    AppNavigator.pushNamedAndRemoveUntil(context, AppRoute.homeScreen, (p0) => false);
                  },
                ),
              ),
              const HSpace(width: 20.0),
              Flexible(
                flex: 4,
                child: BDPPrimaryButton(
                  buttonText: 'Wait',
                  onPressed: (){},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

