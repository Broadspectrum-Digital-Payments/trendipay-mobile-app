import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../common/constants/styles.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/app_theme_util.dart';
import '../../../../shared_widgets/base/draggable_bottom_sheet.dart';
import '../../../../shared_widgets/common/v_space.dart';
import '../../../../shared_widgets/modals/draggable_bottom_sheet_content.dart';
import '../../../auth/presentation/widgets/checkbox.dart';

class LoanAgreementModalContent extends StatefulWidget {
  const LoanAgreementModalContent({super.key});

  @override
  State<LoanAgreementModalContent> createState() => _LoanAgreementModalContentState();
}

class _LoanAgreementModalContentState extends State<LoanAgreementModalContent> {
  final isAgreed = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return DraggableBottomSheet(
      initialChildSize: 0.80,
      minChildSize: 0.55,
      builder: (context, scrollController){
        return DraggableBottomSheetContent(
          draggableKey: GlobalKey(),
          scrollController: scrollController,
          title: 'Loan Agreement',
          content: ListView(
            shrinkWrap: true,
            controller: scrollController,
            padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
            children: [
              const VSpace(height: 26.0),
              Text(
                'This Loan Agreement  is entered into between [Lender Name], a [legal entity type] organized under the laws of [jurisdiction] ("Lender"), and [Borrower Name], an individual, ("Borrower"), collectively referred to as the "Parties."',
                style: kRegularFontStyle.copyWith(
                  fontSize: AppThemeUtil.fontSize(16),
                  color: BDPColors.grey,
                ),
              ),
              const VSpace(height: 20.0),
              Text(
                'Terms and Conditions',
                style: kMediumFontStyle.copyWith(
                  fontSize: AppThemeUtil.fontSize(16),
                  color: BDPColors.dark90,
                ),
              ),
              const VSpace(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: AppThemeUtil.width(4)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Bullet(
                      number: '1.',
                      copy: 'Loan Purpose: The Borrower agrees to use the loan proceeds solely for the purpose stated in this Agreement.',
                    ),
                    Bullet(
                      number: '2.',
                      copy: 'Interest: The Borrower agrees to repay the loan amount along with the accrued interest as per the agreed-upon terms and conditions.',
                    ),
                    Bullet(
                      number: '3.',
                      copy: 'Repayment: The Borrower agrees to repay the loan in accordance with the specified repayment schedule.',
                    ),
                    Bullet(
                      number: '4.',
                      copy: 'Late Payments: In the event of late payments, the Borrower agrees to pay a late fee as specified in this Agreement.',
                    ),
                    Bullet(
                      number: '5.',
                      copy: 'Default: The Borrower acknowledges that failure to repay the loan amount as per the terms of this Agreement may result in default, and the Lender may take appropriate legal action to recover the outstanding amount.',
                    ),
                    Bullet(
                      number: '6.',
                      copy: 'Security: [Optional: If applicable, include details of any collateral or security provided by the Borrower.]',
                    ),
                    Bullet(
                      number: '7.',
                      copy: 'Governing Law: This Agreement shall be governed by and construed in accordance with the laws of [Jurisdiction], without regard to its conflict of law provisions.',
                    ),
                  ],
                ),
              ),
              const VSpace(height: 20.0),
              Text(
                'Acceptance',
                style: kMediumFontStyle.copyWith(
                  fontSize: AppThemeUtil.fontSize(16),
                  color: BDPColors.dark90,
                ),
              ),
              const VSpace(height: 20.0),
              Text(
                'By clicking "I Accept" or signing below, the Borrower acknowledges that they have read and understood the terms and conditions of this Agreement and agree to be bound by its provisions.',
                style: kRegularFontStyle.copyWith(
                  fontSize: AppThemeUtil.fontSize(16),
                  color: BDPColors.grey,
                ),
              ),

              const VSpace(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: isAgreed,
                    builder: (context, isAgreedValue, child) {
                      return ARCheckbox(
                        value: isAgreedValue,
                        onChanged: (value){
                          isAgreed.value = value?? false;
                        },
                      );
                    },
                  ),
                  const HSpace(width: 4.0),
                  Flexible(
                    child: Text(
                      'I Agree',
                      style: kMediumFontStyle.copyWith(
                          fontSize: AppThemeUtil.fontSize(14),
                          color: BDPColors.primary
                      ),
                    ),
                  ),
                ],
              ),
              const VSpace(height: 20.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BDPPrimaryButton(
                    buttonText: 'Proceed',
                    onPressed: (){
                      AppNavigator.popAndPushNamed(context, AppRoute.loanReviewScreen);
                    },
                  ),
                ],
              ),
              const VSpace(height: 32.0),

            ],
          ),
        );
      },
    );
  }
}


class Bullet extends StatelessWidget {
  const Bullet({super.key, required this.number, required this.copy,});

  final String number;
  final String copy;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: kRegularFontStyle.copyWith(
            fontSize: AppThemeUtil.fontSize(16.0),
            color: BDPColors.grey,
          ),
        ),
        const HSpace(width: 4.0),
        Flexible(
          child: Text(
            copy,
            style: kRegularFontStyle.copyWith(
              fontSize: AppThemeUtil.fontSize(16.0),
              color: BDPColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
