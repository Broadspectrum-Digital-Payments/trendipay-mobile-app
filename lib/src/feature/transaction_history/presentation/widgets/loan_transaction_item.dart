import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/utils/helper_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../loans/domain/models/loan/loan_model.dart';
import 'transaction_item_icon.dart';

class LoanTransactionItem extends StatelessWidget {
  final LoanModel transaction;

  const LoanTransactionItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TransactionItemIcon(),
              const HSpace(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(transaction.principalInGHS?? '', style: kBoldFontStyle.copyWith(fontSize: 16, color: Colors.black)),
                  RichText(
                    text: TextSpan(
                        text: 'Interest Rate: ',
                        style: kRegularFontStyle.copyWith(
                          fontSize: AppThemeUtil.fontSize(10),
                          color: BDPColors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: transaction.getInterestRate,
                            style: kMediumFontStyle.copyWith(
                              fontSize: AppThemeUtil.fontSize(10),
                              color: BDPColors.brightMain,
                            ),
                          ),
                        ]
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Repayment Duration: ',
                        style: kRegularFontStyle.copyWith(
                          fontSize: AppThemeUtil.fontSize(10),
                          color: BDPColors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: transaction.duration,
                            style: kMediumFontStyle.copyWith(
                              fontSize: AppThemeUtil.fontSize(10),
                              color: BDPColors.brightMain,
                            ),
                          ),
                        ]
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Date of Application: ',
                        style: kRegularFontStyle.copyWith(
                          fontSize: AppThemeUtil.fontSize(10),
                          color: BDPColors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: transaction.getDate,
                            style: kMediumFontStyle.copyWith(
                              fontSize: AppThemeUtil.fontSize(10),
                              color: BDPColors.brightMain,
                            ),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const HSpace(width: 16),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              Icons.keyboard_arrow_right,
              size: AppThemeUtil.radius(14.0),
              color: Colors.black,
            ),
            const VSpace(height: 4),
            Text(
              HelperUtil.getLoanTransactionStatus((transaction.status?? '')).toUpperCase(),
              style: kMediumFontStyle.copyWith(
                fontSize: AppThemeUtil.fontSize(10),
                color: HelperUtil.getLoanTransactionStatusTextColor(HelperUtil.getLoanTransactionStatus((transaction.status?? ''))),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
