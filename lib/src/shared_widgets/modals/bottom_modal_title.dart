
import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/extensions/gesture_extension.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:flutter/material.dart';

import '../base/custom_scroll_behaviour.dart';

class BottomModalTitle extends StatelessWidget {
  const BottomModalTitle({
    super.key,
    required this.scrollController,
    this.title,
    this.titleTextStyle,
    this.modalHeaderContent,
    this.hasBottomBorder = true,
    this.goBack,
  });

  final ScrollController scrollController;
  final String? title;
  final TextStyle? titleTextStyle;
  final Widget? modalHeaderContent;
  final bool hasBottomBorder;
  final void Function()? goBack;

  @override
  Widget build(BuildContext context) {
    return CustomScrollBehaviour(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        controller: scrollController,
        child: Container(
          height: AppThemeUtil.height(84.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: BDPColors.brightPurple,
            borderRadius: BorderRadius.vertical(top: Radius.circular(AppThemeUtil.radius(16))),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(goBack != null) ...[
                const Spacer(flex: 1),
                Padding(
                  padding: EdgeInsets.only(right: AppThemeUtil.width(20)),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.close,
                      color: BDPColors.white,
                      size: AppThemeUtil.radius(20.0),
                    ).onPressed(goBack?? (){}),
                  ),
                ),
              ],
              (modalHeaderContent != null)?
              modalHeaderContent!
                  :
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppThemeUtil.width(kWidthPadding),
                    right: AppThemeUtil.width(kWidthPadding),
                    bottom: goBack == null? 0 : AppThemeUtil.height(10)
                  ),
                  child: Text(
                    title?? '',
                    style: kMediumFontStyle.copyWith(
                      fontSize: AppThemeUtil.fontSize(20.0),
                      color: BDPColors.white,
                    ),
                  ),
                ),
              ),
              if(goBack != null) const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
