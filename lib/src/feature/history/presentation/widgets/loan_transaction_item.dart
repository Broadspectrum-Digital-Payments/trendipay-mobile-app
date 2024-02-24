import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/utils/helper_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../domain/models/transaction/transaction_model.dart';
import 'transaction_item_icon.dart';

class LoanTransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const LoanTransactionItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TransactionItemIcon(),
        const HSpace(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transaction.getAmount, style: kBoldFontStyle.copyWith(fontSize: 16, color: Colors.black)),
              Text(transaction.description?? '', style: kRegularFontStyle.copyWith(fontSize: 12, color: BDPColors.grey),),
              Text('${transaction.getDate}, ${transaction.getTime}', style: kMediumFontStyle.copyWith(fontSize: 10,color: Colors.black),),
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
