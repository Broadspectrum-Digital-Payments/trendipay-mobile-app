
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/feature/loans/presentation/view_models/loan_view_model.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/core/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/styles.dart';
import '../../../../shared_widgets/base/bdp_appbar.dart';
import '../../domain/models/loan/loan_model.dart';


class LoanReviewScreen extends StatefulWidget {
  const LoanReviewScreen({super.key, required this.loan,});

  final LoanModel loan;

  @override
  State<LoanReviewScreen> createState() => _LoanReviewScreenState();
}

class _LoanReviewScreenState extends State<LoanReviewScreen> {

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: BDPAppBar(
          appBar: AppBar(),
          title: 'Loan Application Review',
          hasLeading: false,
        ),
        body: Padding(
            padding: EdgeInsets.only(top: AppThemeUtil.height(24.0)),
            child: Column(
              children: [
                const Spacer(flex: 1),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    BDPImages.loanReview,
                    height: AppThemeUtil.height(291),
                  ),
                ),
                const Spacer(flex: 1),
                Text(
                  'Your loan application is in review.',
                  style: kRegularFontStyle.copyWith(
                    fontSize: AppThemeUtil.fontSize(14.0),
                    color: BDPColors.grey,
                  ),
                ),
                const Spacer(flex: 8),
              ],
            )
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: AppThemeUtil.width(50),
            right: AppThemeUtil.width(50),
            bottom: AppThemeUtil.height(50),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BDPPrimaryButton(
                backgroundColor: BDPColors.white,
                textColor: BDPColors.primary,
                imageIconFile: BDPImages.home,
                buttonText: 'Go to Homepage',
                onPressed: () async{
                  final loanProvider = context.read<LoanViewModel>();
                  await loanProvider.uploadLoanDocument(
                    context,
                    loanExternalId: widget.loan.externalId?? '',
                    requestBody: {
                      'name': loanProvider.getLoanRequestBody['documentName'],
                      'file': loanProvider.getLoanRequestBody['document']
                    },
                  );
                },
              ),
              // const HSpace(width: 20.0),
              // Flexible(
              //   flex: 4,
              //   child: BDPPrimaryButton(
              //     buttonText: 'Wait',
              //     onPressed: (){},
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

