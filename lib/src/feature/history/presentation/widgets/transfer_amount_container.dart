import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/extensions/string_extension.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';


class TransferAmountContainer extends StatelessWidget {
  const TransferAmountContainer({
    super.key,
    required this.amount,
  });

  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppThemeUtil.height(140.0),
      decoration:  BoxDecoration(
        color: BDPColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppThemeUtil.radius(24)),
          bottomRight: Radius.circular(AppThemeUtil.radius(24)),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter Amount',
            style: kMediumFontStyle.copyWith(
                fontSize: AppThemeUtil.fontSize(20),
                color: BDPColors.white,
            ),
          ),
          const VSpace(
            height: BDPSizes.spaceBtwItems,
          ),
          Text(
            (amount.isEmpty? '0.0' :amount).toCurrencyFormat,
            style: kMediumFontStyle.copyWith(
              fontSize: AppThemeUtil.fontSize(20),
              color: BDPColors.white,
            ),
          ),
        ],
      ),
    );
  }
}