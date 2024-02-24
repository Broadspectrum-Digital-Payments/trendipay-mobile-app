import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/image_strings.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/feature/loans/presentation/widgets/loan_stats.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';


class LoanScreenWithLoans extends StatelessWidget {
  const LoanScreenWithLoans({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VSpace(height: 12),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: LoanStats(
                text: 'Total Loan\nCollected',
              ),
            ),
            HSpace(width: 12),
            Flexible(
              child: LoanStats(
                bgColor: BDPColors.brightMain,
                imageFile: BDPImages.loanRepaid,
                text: 'Total Loan\nRepayed',
              ),
            ),
            HSpace(width: 12),
            Flexible(
              child: LoanStats(
                bgColor: BDPColors.dark90,
                imageFile: BDPImages.loanPending,
                text: 'Total Pending\nRepayment',
              ),
            ),
          ]
        ),
        const VSpace(height: 24),
        Text(
          'Loan History',
          style: kMediumFontStyle.copyWith(
            fontSize: AppThemeUtil.fontSize(16.0),
            color: BDPColors.brightPurple,
          ),
        ),
        const VSpace(height: 24),

      ],
    );
  }
}
