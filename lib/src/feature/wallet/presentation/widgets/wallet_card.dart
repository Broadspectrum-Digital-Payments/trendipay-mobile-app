import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/extensions/gesture_extension.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/text_strings.dart';
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
          borderRadius: BorderRadius.circular(AppThemeUtil.radius(24.0)),
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
              Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                    text: accountNumber,
                    style: kBoldFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(12.0),
                      color: BDPColors.white,
                    ),
                    children: [
                      TextSpan(
                        text: '\n$date',
                        style: kMediumFontStyle.copyWith(
                          fontSize: AppThemeUtil.fontSize(12.0),
                          color: BDPColors.white,
                        ),
                      ),
                    ]
                  ),
                  textAlign: TextAlign.end,
                ),
              ),

              const VSpace(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userConsumer.hideCardBalance? '******':'GHS ${userConsumer.getUser.getAvailableBalance}',
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
                  const HSpace(width: 16.0),
                  Icon(
                    userConsumer.hideCardBalance? Iconsax.eye_slash : Iconsax.eye,
                    color: BDPColors.white,
                    size: AppThemeUtil.radius(24),
                  ).onPressed((){
                    context.read<UserViewModel>().toggleHideCardBalance();
                  }), 
                ],
            ),
              const VSpace(height: 42.0),
            ],
          );
        }
      ),
    );
  }
}