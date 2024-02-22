import 'package:bdp_payment_app/common/constants/styles.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';


class QuickTransactionContainer extends StatelessWidget {
  const QuickTransactionContainer({
    super.key, required this.transactionName, required this.image, required this.onPressed,
  });
  final String transactionName;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppThemeUtil.radius(2.0)),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: AppThemeUtil.width(100), // Adjust width as needed
          height: AppThemeUtil.height(54), // Adjust height as needed
          decoration: BoxDecoration(
              border: Border.all(
                color: BDPColors.primary, // Color of the border
                width: 1, // Width of the border
              ),
              borderRadius: BorderRadius.circular(AppThemeUtil.radius(8.0))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
              ),
              const VSpace(height: 8),
              Text(
                transactionName,
                textAlign: TextAlign.center,
                style: kSemiBoldFontStyle.copyWith(
                  fontSize: AppThemeUtil.fontSize(11.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}