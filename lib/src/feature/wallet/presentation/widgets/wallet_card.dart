import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../../core/routing/app_route.dart';
import '../../../../../core/view_models/base_view.dart';
import '../../../../../core/view_models/user_view_model.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
    required this.accountNumber,
    required this.date, required this.accountBalance, required this.gradients,
  });

  final String accountNumber;
  final String date;
  final String accountBalance;
  final List<Color> gradients;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppThemeUtil.width(16.0),
        vertical: AppThemeUtil.height(24.0),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(color: Colors.grey, width: 1.0),
          gradient:  LinearGradient(
            colors:gradients,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
      ),
      child: BaseView<UserViewModel>(
          builder: (context, userConsumer, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 14.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: BDPColors.white,
                    ),
                    child: Image.asset(BDPImages.visa),
                  ),
                  const HSpace(width: 16.0),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        accountNumber,
                        style: kBoldFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(12.0),
                            color: BDPColors.white,
                        ),
                      ),
                      Text(
                        date,
                        style: kMediumFontStyle.copyWith(
                          fontSize: AppThemeUtil.fontSize(12.0),
                          color: BDPColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const VSpace(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GHS ${userConsumer.getUser.getAvailableBalance}',
                        style: kMediumFontStyle.copyWith(
                          fontSize: AppThemeUtil.fontSize(30.0),
                          color: BDPColors.white,
                        ),
                      ),
                      Text(
                        BDPTexts.accountBalanceText,
                        style: kRegularFontStyle.copyWith(
                          fontSize: AppThemeUtil.fontSize(12.0),
                          color: BDPColors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  const Icon(
                    Icons.remove_red_eye_outlined,
                    color: BDPColors.white,
                    size: 24,
                  ), // Example icon, replace with your icon
                ],
            ),
              const VSpace(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: AppThemeUtil.width(66),
                    height: AppThemeUtil.height(26),
                    child: Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          AppNavigator.pushNamed(context, AppRoute.selectWalletScreen);
                        },
                        style: ElevatedButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          backgroundColor: BDPColors.white,
                          padding: EdgeInsets.only(left: AppThemeUtil.width(8)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              BDPTexts.topUpButton,
                              style: kMediumFontStyle.copyWith(
                                fontSize: AppThemeUtil.fontSize(10.5),
                                color: BDPColors.primary,
                              ),
                            ),
                            const HSpace(
                              width: 4,
                            ),
                            Image.asset(
                              BDPImages.rightArrow,
                              width: AppThemeUtil.width(8.75),
                              height: AppThemeUtil.height(7),
                              color: BDPColors.primary,// Adjust height as needed
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        }
      ),
    );
  }
}