import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/extensions/string_extension.dart';
import 'package:bdp_payment_app/core/utils/helper_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/app_theme_util.dart';
import '../../../../shared_widgets/base/draggable_bottom_sheet.dart';
import '../../../../shared_widgets/modals/draggable_bottom_sheet_content.dart';
import '../../domain/models/transaction/transaction_model.dart';

class TransactionSummaryModalContent extends StatelessWidget {
  const TransactionSummaryModalContent({super.key, required this.transaction,});

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return DraggableBottomSheet(
      initialChildSize: 0.70,
      minChildSize: 0.50,
      builder: (context, scrollController){
        return DraggableBottomSheetContent(
          draggableKey: GlobalKey(),
          scrollController: scrollController,
          title: 'Transaction Details',
          content: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VSpace(height: 26.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TransactionSummaryItem(
                          title: 'Date of transaction',
                          data: '${transaction.getDate} ${transaction.getTime}'
                      ),
                    ),
                    const VSpace(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TransactionSummaryItem(
                          title: 'Amount',
                          data: transaction.getAmount,
                      ),
                    ),
                    const VSpace(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TransactionSummaryItem(
                          title: 'Elevy',
                          data: transaction.elevy,
                      ),
                    ),
                    const VSpace(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TransactionSummaryItem(
                        title: 'Fees',
                        data: transaction.feeInMajorUnits?? '0',
                      ),
                    ),
                    const VSpace(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TransactionSummaryItem(
                        title: 'Receiver',
                        data: transaction.accountName?? '',
                      ),
                    ),
                    const VSpace(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TransactionSummaryItem(
                        title: 'Account number',
                        data: transaction.accountNumber?? '',
                      ),
                    ),
                    const VSpace(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TransactionSummaryItem(
                        title: 'Transaction type',
                        data: (transaction.type?? '').ucWords,
                      ),
                    ),
                    const VSpace(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TransactionSummaryItem(
                        title: 'Note',
                        data: transaction.description?? '',
                      ),
                    ),
                    const VSpace(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TransactionSummaryItem(
                        title: 'Status',
                        data: HelperUtil.getTransactionStatus(transaction.status?? '').toUpperCase(),
                        isStatus: true,
                      ),
                    ),
                  ],
              ),
            ),
          ),
        );
      },
    );
  }
}


class TransactionSummaryItem extends StatelessWidget {
  const TransactionSummaryItem({super.key, required this.title, required this.data, this.isStatus = false,});

  final String title;
  final String data;
  final bool isStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kRegularFontStyle.copyWith(
            fontSize: AppThemeUtil.fontSize(16),
            color: BDPColors.grey,
          ),
        ),
        const VSpace(height: 6.0),
        Text(
          data,
          style: kBoldFontStyle.copyWith(
            fontSize: AppThemeUtil.fontSize(16),
            color: isStatus? HelperUtil.getTransactionStatusTextColor(data) : BDPColors.grey,
          ),
        )
      ],
    );
  }
}
