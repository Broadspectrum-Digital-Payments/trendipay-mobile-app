
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/routing/app_navigator.dart';
import '../../../core/utils/app_theme_util.dart';
import '../base/popup_modal_body.dart';
import '../common/v_space.dart';

class ErrorModalContent extends StatelessWidget {
  const ErrorModalContent({
    super.key,
    this.errorTitle = '',
    required this.errorMessage,
    this.onButtonPressed,
    this.showIcon = true,
  });

  final String errorTitle;
  final String errorMessage;
  final void Function()? onButtonPressed;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return PopupModalBody(
      title: Column(
        children: [
          if(errorTitle.isNotEmpty) ...[
            const VSpace(height: 16.0),
            Text(
              errorTitle,
              style: TextStyle(
                fontSize: AppThemeUtil.fontSize(12.0),
                fontWeight: FontWeight.w500,
                color: BDPColors.dark90,
              ),
              textAlign: TextAlign.center,
            ),
          ]
        ],
      ),
      actions: [
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BDPPrimaryButton(
                onPressed: onButtonPressed?? (){
                  AppNavigator.pop(context);
                },
                buttonText: 'Okay',
                hasIcon: false,
              ),
            ],
          ),
        )
      ],
      child: Text(
        errorMessage,
        style: TextStyle(
          fontSize: AppThemeUtil.fontSize(16.0),
          fontWeight: FontWeight.w400,
          color: BDPColors.dark90
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
