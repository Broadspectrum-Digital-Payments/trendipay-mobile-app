

import 'package:flutter/material.dart';

import '../../../core/utils/app_theme_util.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/common.dart';

class PopupModalBody extends StatelessWidget {
  const PopupModalBody({
    super.key,
    required this.child,
    this.title,
    this.verticalPadding,
    this.horizontalPadding,
    this.actions,
    this.insetPadding,
  });

  final Widget child;
  final Widget? title;
  final List<Widget>? actions;
  final double? verticalPadding;
  final double? horizontalPadding;
  final EdgeInsets? insetPadding;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0.0,
      insetPadding: insetPadding?? EdgeInsets.symmetric(horizontal: AppThemeUtil.width(32.0)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      backgroundColor: AppThemeUtil.getThemeColor(BDPColors.white),
      title: title,
      content: Builder(builder: (context) {
        return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: AppThemeUtil.width(horizontalPadding?? kWidthPadding),
              vertical: AppThemeUtil.height(verticalPadding?? 16.0),
            ),
            child: child,
          );
        },
      ),
      actions: actions,
    );
  }
}
