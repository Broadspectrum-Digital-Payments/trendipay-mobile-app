
import 'package:bdp_payment_app/common/constants/styles.dart';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/image_strings.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/routing/app_navigator.dart';
import '../../../core/utils/app_theme_util.dart';
import '../base/popup_modal_body.dart';
import '../common/app_lottie.dart';
import '../common/v_space.dart';

class SuccessModalContent extends StatelessWidget {
  const SuccessModalContent({
    super.key,
    this.title = '',
    required this.message,
    this.onButtonPressed,
    this.verticalPadding,
    this.buttonText,
  });

  final String title;
  final String message;
  final void Function()? onButtonPressed;
  final double? verticalPadding;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return PopupModalBody(
      verticalPadding: verticalPadding?? 16.0,
      title: Column(
        children: [
          const VSpace(height: 32.0),
          AppLottie(
            filePath: BDPImages.check,
            repeat: false,
            width: AppThemeUtil.radius(120.0),
            height: AppThemeUtil.radius(120.0),
          ),
          if(title.isNotEmpty) ...[
            const VSpace(height: 16.0),
            Text(
              title,
              style: kBoldFontStyle.copyWith(
                fontSize: AppThemeUtil.fontSize(20),
                color: BDPColors.dark90,
              ),
            ),
          ]
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BDPPrimaryButton(
              onPressed: onButtonPressed?? (){
                AppNavigator.pop(context);
              },
              buttonText: buttonText?? 'Okay',
            ),
          ],
        )
      ],
      child: message.isEmpty? const SizedBox.shrink() :  Text(
        title,
        style: kRegularFontStyle.copyWith(
          fontSize: AppThemeUtil.fontSize(16),
          color: BDPColors.dark90,
        ),
      ),
    );
  }
}
