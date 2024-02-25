import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';


class QuickTransactionContainer extends StatelessWidget {
  const QuickTransactionContainer({
    super.key,
    required this.transactionName,
    required this.image,
    required this.onPressed,
    this.padding,
  });
  final String transactionName;
  final String image;
  final VoidCallback onPressed;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // width: AppThemeUtil.width(110),
        width: double.infinity,
        padding: padding?? EdgeInsets.symmetric(
          horizontal: AppThemeUtil.width(12.5),
          vertical: AppThemeUtil.height(5.0),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: BDPColors.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppThemeUtil.radius(8.0))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.contain,
              height: AppThemeUtil.radius(24.0),
              width: AppThemeUtil.radius(24.0),
            ),
            const VSpace(height: 8),
            RichText(
              text: TextSpan(
                text: transactionName,
                style: kSemiBoldFontStyle.copyWith(
                  fontSize: AppThemeUtil.fontSize(11.0),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}