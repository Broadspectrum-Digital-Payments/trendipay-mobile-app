import 'package:bdp_payment_app/core/extensions/gesture_extension.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_divider.dart';
import 'package:flutter/material.dart';

import '../../../loans/domain/models/loan/loan_model.dart';
import 'loan_transaction_item.dart';

class LoanTransactionListView extends StatelessWidget {
  const LoanTransactionListView({
    super.key,
    required this.transactions,
    this.primary,
    this.padding,
  });

  final List<LoanModel> transactions;
  final bool? primary;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      primary: primary,
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return LoanTransactionItem(transaction: transaction).onPressed((){
          AppNavigator.pushNamed(context, AppRoute.loanTransactionDetailScreen, arguments: transaction);
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
