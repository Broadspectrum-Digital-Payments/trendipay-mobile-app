
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/styles.dart';
import '../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../shared_widgets/common/v_space.dart';
import '../../../loans/domain/models/loan/loan_model.dart';


class LoanTransactionDetailScreen extends StatefulWidget {
  const LoanTransactionDetailScreen({super.key, required this.loan, });

  final LoanModel loan;

  @override
  State<LoanTransactionDetailScreen> createState() => _LoanTransactionDetailScreenState();
}

class _LoanTransactionDetailScreenState extends State<LoanTransactionDetailScreen> {

  @override
  Widget build(BuildContext context) {
    final transaction = widget.loan;
    return Scaffold(
      appBar: BDPAppBar(
        appBar: AppBar(),
        title: 'Loan Details',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
          child: Column(
            children: [
              const VSpace(height: 24.0),

              Table(
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          'Purpose of Loan:',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.dark90,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          'Education',
                          style: kMediumFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.brightMain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          'Date of Application:',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.dark90,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          '${transaction.getDate} ${transaction.getTime}',
                          style: kMediumFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.brightMain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          'Loan Amount:',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.dark90,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          transaction.principalInGHS?? '',
                          style: kMediumFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.brightMain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          'Repayment Duration:',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.dark90,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          transaction.duration,
                          style: kMediumFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.brightMain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          'Interest Rate:',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.dark90,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          transaction.getInterestRate,
                          style: kMediumFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.brightMain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          'Monthly Repayment Amount:',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.dark90,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          transaction.monthlyInstallmentInGHS?? '',
                          style: kMediumFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.brightMain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          'Total Repayment Amount:',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.dark90,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          transaction.totalRepaymentAmountInGHS?? '',
                          style: kMediumFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.brightMain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),


              const VSpace(height: 32.0),
            ],
          ),
        ),
      ),


      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppThemeUtil.width(kWidthPadding),
          vertical: AppThemeUtil.height(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BDPPrimaryButton(
              buttonText: 'Pay Back',
              onPressed: (){
              },
            ),
          ],
        ),
      ),
    );
  }
}

