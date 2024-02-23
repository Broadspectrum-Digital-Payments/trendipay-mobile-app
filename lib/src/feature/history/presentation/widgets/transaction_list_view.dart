import 'package:bdp_payment_app/core/extensions/gesture_extension.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_divider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_dialog_util.dart';
import '../domain/models/transaction/transaction_model.dart';
import 'transaction_item.dart';
import 'transaction_summary_modal_content.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({
    super.key,
    required this.transactions,
    this.primary,
  });

  final List<TransactionModel> transactions;
  final bool? primary;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: primary,
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return TransactionItem(transaction: transaction).onPressed((){
          AppDialogUtil.showScrollableBottomSheet(
            context: context,
            builder: (context) => TransactionSummaryModalContent(transaction: transaction),
          );
        });
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: AppThemeUtil.height(10.0)),
          child: const HDivider(),
        );
      },
    );
  }
}
