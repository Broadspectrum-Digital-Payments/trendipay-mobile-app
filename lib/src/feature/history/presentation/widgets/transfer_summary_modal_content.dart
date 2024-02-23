import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/extensions/string_extension.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/view_models/otp_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/constants/styles.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../../core/utils/app_theme_util.dart';
import '../../../../../core/utils/helper_util.dart';
import '../../../../shared_widgets/base/draggable_bottom_sheet.dart';
import '../../../../shared_widgets/buttons/bdp_primary_button.dart';
import '../../../../shared_widgets/common/v_space.dart';
import '../../../../shared_widgets/modals/draggable_bottom_sheet_content.dart';

class TransferSummaryModalContent extends StatelessWidget {
  const TransferSummaryModalContent({super.key, required this.transferInfo,});

  final Map<String, dynamic> transferInfo;

  @override
  Widget build(BuildContext context) {
    return DraggableBottomSheet(
      initialChildSize: 0.70,
      minChildSize: 0.50,
      builder: (context, scrollController){
        return DraggableBottomSheetContent(
          draggableKey: GlobalKey(),
          scrollController: scrollController,
          title: 'Transaction Summary',
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
                      'GHS ${(transferInfo['amount']?? '0').toString().toCurrencyFormat}',
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
                  const VSpace(height: 20.0),
                  Text(
                    'To',
                    style: kRegularFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(16),
                      color: BDPColors.grey,
                    ),
                  ),
                  Text(
                    transferInfo['accountName']?? '',
                    style: kMediumFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(16),
                      color: BDPColors.grey,
                    ),
                  ),
                  const VSpace(height: 20),
                  Text(
                    'With account number',
                    style: kRegularFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(16),
                      color: BDPColors.grey,
                    ),
                  ),
                  Text(
                    transferInfo['accountNumber']?? '',
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
                    transferInfo['accountIssuer']?? '',
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
                    transferInfo['description']?? '',
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
                          buttonText: BDPTexts.confirm,
                          onPressed: () async{
                            AppNavigator.pop(context);
                            await context.read<OtpViewModel>().sendOtp(
                              context,
                              requestBody: {
                                'action': kPerformTransferAction,
                                "phoneNumber": HelperUtil.getLocalPhoneNumber(context.read<UserViewModel>().getUser.phoneNumber?? ''),
                                "amount": transferInfo['amount']?? '0',
                                "accountNumber": transferInfo['accountNumber'],
                                "accountIssuer": (transferInfo['accountIssuer']?? '').toString().toNetworkCode(),
                                "accountName": transferInfo['accountName'],
                                "description": transferInfo['description'],
                                "type": transferInfo['type']
                              },
                            );
                          }
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
