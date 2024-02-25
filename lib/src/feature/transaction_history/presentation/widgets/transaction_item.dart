import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/extensions/string_extension.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/utils/helper_util.dart';
import 'package:bdp_payment_app/src/feature/transaction_history/presentation/widgets/transaction_item_icon.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../domain/models/transaction/transaction_model.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({
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
              Text((transaction.type?? '').ucWords, style: kBoldFontStyle.copyWith(fontSize: 16, color: Colors.black)),
              Text(transaction.description?? '', style: kRegularFontStyle.copyWith(fontSize: 12, color: BDPColors.grey),),
              Text('${transaction.getDate}, ${transaction.getTime}', style: kMediumFontStyle.copyWith(fontSize: 10,color: Colors.black),),
            ],
          ),
        ),
        const HSpace(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(transaction.getAmount, style: kBoldFontStyle.copyWith(fontSize: AppThemeUtil.fontSize(14), color: Colors.black),),
                Icon(
                  Icons.keyboard_arrow_right,
                  size: AppThemeUtil.radius(14.0),
                  color: Colors.black,
                ),
              ],
            ),
            const VSpace(height: 4),
            Text(
              HelperUtil.getTransactionStatus((transaction.status?? '')).toUpperCase(),
              style: kMediumFontStyle.copyWith(
                fontSize: AppThemeUtil.fontSize(10),
                color: HelperUtil.getTransactionStatusTextColor(HelperUtil.getTransactionStatus((transaction.status?? ''))),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
