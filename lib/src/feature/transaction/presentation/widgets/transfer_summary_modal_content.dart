import 'package:flutter/material.dart';

import '../../../../../common/constants/styles.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../../core/utils/app_theme_util.dart';
import '../../../../shared_widgets/buttons/bdp_primary_button.dart';
import '../../../../shared_widgets/common/v_space.dart';

class TransferSummaryModalContent extends StatelessWidget {
  const TransferSummaryModalContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: BDPColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: const Text(
            'Transaction Summary',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: BDPColors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'You are sending an amount of',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const VSpace(
                height:
                BDPSizes.spaceBtwInputFields,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Text(
                    'GHC 0',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
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
                            70.0)), // Adjust the width and height as needed
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: AppThemeUtil.width(8), top: AppThemeUtil.height(8)),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'To',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(16),
                            color: BDPColors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'state.accountName!',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(16),
                            color: BDPColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'With account number',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(16),
                            color: BDPColors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'state.accountNumber!',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(16),
                            color: BDPColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const VSpace(height: 10),
                Column(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Note',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(16),
                            color: BDPColors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'state.description!',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(16),
                            color: BDPColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const VSpace(height: 10),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BDPPrimaryButton(
                // isLoading: state.completingTransfer == true,
                  buttonText: BDPTexts.confirm,
                  onPressed: (){
                    // controller.initiatePtoPTransfer();
                  }
              ),
            ],
          ),
        ),
        const VSpace(height: 10),
      ],
    );
  }
}
