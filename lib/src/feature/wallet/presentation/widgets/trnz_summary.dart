import 'package:bdp_payment_app/core/extensions/string_extension.dart';
import 'package:bdp_payment_app/core/services/logger_service.dart';
import 'package:bdp_payment_app/src/shared_widgets/modals/error_modal_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/common.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../../core/utils/app_theme_util.dart';
import '../../../../shared_widgets/base/draggable_bottom_sheet.dart';
import '../../../../shared_widgets/buttons/bdp_primary_button.dart';
import '../../../../shared_widgets/common/v_space.dart';
import '../../../../shared_widgets/modals/draggable_bottom_sheet_content.dart';
import '../../../transaction_history/presentation/view_models/transaction_view_model.dart';

class TrnzSummary extends StatelessWidget {
  const TrnzSummary({super.key, required this.purchaseInfo, required this.transactionType});

  final Map<String, dynamic> purchaseInfo;
  final String transactionType;

  @override
  Widget build(BuildContext context) {
    return DraggableBottomSheet(
      initialChildSize: MediaQuery.of(context).size.height < 550? 0.90 : 0.75,
      minChildSize: 0.50,
      builder: (context, scrollController){
        return DraggableBottomSheetContent(
          draggableKey: GlobalKey(),
          scrollController: scrollController,
          title: 'Purchase Summary',
          content: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VSpace(height: 26.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      'You are sending an amount of',
                      style: kMediumFontStyle.copyWith(
                        fontSize: AppThemeUtil.fontSize(16),
                        color: BDPColors.black,
                      ),
                    ),
                  ),
                  const VSpace(
                    height:
                    BDPSizes.spaceBtwInputFields,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'GHS ${(purchaseInfo['amount']?? '0').toString().toCurrencyFormat}',
                      style: kBoldFontStyle.copyWith(
                        fontSize: AppThemeUtil.fontSize(20),
                        foreground: Paint()
                          ..shader =
                          const LinearGradient(
                            colors: [
                              BDPColors.primary,
                              BDPColors.secondColor,
                            ],
                          ).createShader(const Rect
                              .fromLTWH(
                              0.0,
                              0.0,
                              200.0,
                              70.0),
                          ), // Adjust the width and height as needed
                      ),
                    ),
                  ),
                  // const VSpace(height: 20.0),
                  // Text(
                  //   'To',
                  //   style: kRegularFontStyle.copyWith(
                  //     fontSize: AppThemeUtil.fontSize(16),
                  //     color: BDPColors.grey,
                  //   ),
                  // ),
                  // Text(
                  //   purchaseInfo['accountName']?? '',
                  //   style: kMediumFontStyle.copyWith(
                  //     fontSize: AppThemeUtil.fontSize(16),
                  //     color: BDPColors.grey,
                  //   ),
                  // ),
                  const VSpace(height: 20),
                  Text(
                    'To account number',
                    style: kRegularFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(16),
                      color: BDPColors.grey,
                    ),
                  ),
                  Text(
                    purchaseInfo['accountNumber']?? '',
                    style: kRegularFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(16),
                      color: BDPColors.grey,
                    ),
                  ),
                  const VSpace(height: 20),
                  Text(
                    'With account network',
                    style: kRegularFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(16),
                      color: BDPColors.grey,
                    ),
                  ),
                  Text(
                    purchaseInfo['accountIssuer']?? '',
                    style: kRegularFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(16),
                      color: BDPColors.grey,
                    ),
                  ),
                  const VSpace(height: 20),
                  Text(
                    'Elevy',
                    style: kRegularFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(16),
                      color: BDPColors.grey,
                    ),
                  ),
                  Text(
                    'GHS 0',
                    style: kRegularFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(16),
                      color: BDPColors.grey,
                    ),
                  ),
                  const VSpace(height: 20),
                  Text(
                    'Fees',
                    style: kRegularFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(16),
                      color: BDPColors.grey,
                    ),
                  ),
                  Text(
                    'GHS 0',
                    style: kRegularFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(16),
                      color: BDPColors.grey,
                    ),
                  ),
                  const VSpace(height: 20),
                  Text(
                    'Note',
                    style: kRegularFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(16),
                      color: BDPColors.grey,
                    ),
                  ),
                  Text(
                    purchaseInfo['description']?? '',
                    style: kRegularFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(16),
                      color: BDPColors.grey,
                    ),
                  ),
                  const VSpace(height: 50),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BDPPrimaryButton(
                            buttonText: BDPTexts.continueButtonText,
                            onPressed: () async{
                              ZLoggerService.logOnInfo(transactionType);
                              if (transactionType == 'payments') {
                                await context.read<TransactionViewModel>().makePayment(
                                  context,
                                  requestBody: {
                                    'amount': purchaseInfo['amount'] ?? 0 * 100,
                                    'accountNumber': purchaseInfo['accountNumber'],
                                    'accountIssuer': (purchaseInfo['accountIssuer'] ?? '').toString().toNetworkCode(),
                                    'description': purchaseInfo['description'],
                                  },
                                );
                              } else if (transactionType == 'purchases') {
                                await context.read<TransactionViewModel>().makePurchase(
                                  context,
                                  requestBody: {
                                    'amount': purchaseInfo['amount'] ?? 0 * 100,
                                    'accountNumber': purchaseInfo['accountNumber'],
                                    'accountIssuer': (purchaseInfo['accountIssuer'] ?? '').toString().toNetworkCode(),
                                    'description': purchaseInfo['description'],
                                  },
                                );
                              }
                               const ErrorModalContent(errorMessage: '"no type specified", ');
                            },
                        ),
                      ],
                    ),
                  ),
                  const VSpace(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}