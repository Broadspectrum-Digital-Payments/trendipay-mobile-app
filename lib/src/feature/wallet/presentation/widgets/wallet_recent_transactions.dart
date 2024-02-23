import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_divider.dart';
import 'package:flutter/material.dart';

import '../../../transaction/domain/models/transaction/wallet_transaction_model.dart';
import 'transaction_item.dart';

class WalletRecentTransactions extends StatelessWidget {
  const WalletRecentTransactions({
    super.key,
    required this.transactions,
    this.primary,
  });

  final List<WalletTransactionModel> transactions;
  final bool? primary;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: primary,
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return GestureDetector(
          onTap: (){

          },
          child: TransactionItem(
              title: "",
              description: transaction.description ?? "",
              date: '',
              time: '',
              amount: transaction.getAmount,
              isSuccess: transaction.status?.toLowerCase() == kProcessedStatus),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: AppThemeUtil.height(8.0)),
          child: const HDivider(),
        );
      },
    );
  }
}
