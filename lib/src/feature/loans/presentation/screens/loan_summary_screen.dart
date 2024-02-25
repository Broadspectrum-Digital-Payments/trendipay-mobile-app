
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/feature/loans/presentation/widgets/loan_agreement_modal_content.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/styles.dart';
import '../../../../../core/utils/app_dialog_util.dart';
import '../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../shared_widgets/common/v_space.dart';
import '../../domain/models/amortize/amortize_model.dart';


class LoanSummaryScreen extends StatefulWidget {
  const LoanSummaryScreen({super.key, required this.amortize,});

  final AmortizeModel amortize;

  @override
  State<LoanSummaryScreen> createState() => _LoanSummaryScreenState();
}

class _LoanSummaryScreenState extends State<LoanSummaryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BDPAppBar(
        appBar: AppBar(),
        title: 'Loan Summary',
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
                          '01 Jan 2024 4:30AM',
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
                          'GHS3,000.00',
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
                          '100 Days',
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
                          '4.6%',
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
                          'GHS3,138.00',
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
                          'Total Amount Paid:',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.dark90,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          'GH¢1,938.00',
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
                          'Repayment Balance:',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.dark90,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          'GHS1,200.00',
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
                          'Repayment Date:',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(14.0),
                            color: BDPColors.dark90,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: AppThemeUtil.height(10.0)),
                        child: Text(
                          '16 Mar 2024 5:20PM',
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
              const VSpace(height: 40.0),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BDPPrimaryButton(
                    buttonText: 'Proceed to Agreement',
                    onPressed: (){
                      AppDialogUtil.showScrollableBottomSheet(
                        context: context,
                        builder: (context) => const LoanAgreementModalContent(),
                      );
                    },
                  ),
                ],
              ),
              const VSpace(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}

