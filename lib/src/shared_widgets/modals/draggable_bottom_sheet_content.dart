
import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_theme_util.dart';
import '../../../../../../../core/constants/colors.dart';
import 'bottom_modal_title.dart';

class DraggableBottomSheetContent extends StatelessWidget {
  const DraggableBottomSheetContent({
    super.key,
    required this.content,
    this.bottomNavigationBar,
    required this.draggableKey,
    required this.scrollController,
    this.title,
    this.titleTextStyle,
    this.modalHeaderContent,
    this.showTitleWidget = true,
    this.hasBottomBorder = true,
    this.goBack,
  });

  final Widget content;
  final Widget? bottomNavigationBar;
  final GlobalKey draggableKey;
  final ScrollController scrollController;
  final String? title;
  final TextStyle? titleTextStyle;
  final Widget? modalHeaderContent;
  final bool showTitleWidget;
  final bool hasBottomBorder;
  final void Function()? goBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          color: AppThemeUtil.getThemeColor(BDPColors.white, BDPColors.dark90),
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppThemeUtil.radius(16))),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if(showTitleWidget) BottomModalTitle(
              key: draggableKey,
              scrollController: scrollController,
              title: title,
              titleTextStyle: titleTextStyle,
              modalHeaderContent: modalHeaderContent,
              hasBottomBorder: hasBottomBorder,
              goBack: goBack,
            ),

            Expanded(
              child: content,
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

