
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/feature/loans/presentation/widgets/loan_agreement_modal_content.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/styles.dart';
import '../../../../../core/utils/app_dialog_util.dart';
import '../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../shared_widgets/common/v_space.dart';
import '../../domain/models/amortize/amortize_model.dart';
import '../view_models/loan_view_model.dart';


class LoanSummaryScreen extends StatefulWidget {
  const LoanSummaryScreen({super.key, required this.amortize,});

  final AmortizeModel amortize;

  @override
  State<LoanSummaryScreen> createState() => _LoanSummaryScreenState();
}

class _LoanSummaryScreenState extends State<LoanSummaryScreen> {
  String dateOfLoan = DateFormat('d MMM y').add_jm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final amortize = widget.amortize;
    final request = context.read<LoanViewModel>().getLoanRequestBody;
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
                          request['purpose']?? '',
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
                          dateOfLoan,
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
                          amortize.principalInGHS?? '',
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
                          '${amortize.time} Days',
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
                          amortize.interestRate?? '',
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
                          amortize.monthlyInstallmentInGHS?? '',
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
                          amortize.loadRepaymentAmountInGHS?? '',
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

