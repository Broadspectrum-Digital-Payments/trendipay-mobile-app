
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/authheaders.dart';
import 'package:bdp_payment_app/core/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../common/constants/styles.dart';
import '../../../../../core/routing/app_navigator.dart';
import '../../../../shared_widgets/common/v_space.dart';


class LoanTransactionDetailScreen extends StatefulWidget {
  const LoanTransactionDetailScreen({super.key});

  @override
  State<LoanTransactionDetailScreen> createState() => _LoanTransactionDetailScreenState();
}

class _LoanTransactionDetailScreenState extends State<LoanTransactionDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const AuthHeader(
          icon: BDPImages.bdpIcon,
          title: 'Loan Details',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 24),
          onPressed: () => AppNavigator.pop(context),
        ),
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
