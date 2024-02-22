
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base/custom_scroll_behaviour.dart';
import 'modal_grab_bar.dart';

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
          // decoration: BoxDecoration(
          //   border: hasBottomBorder? Border(
          //     bottom: BorderSide(width: 1, color: AppThemeUtil.getThemeColor(kGrey200)),
          //   ) : null,
          // ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _HeaderPill(),
                ],
              ),

              // (modalHeaderContent != null)?
              // modalHeaderContent!
              //     :
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     (goBack != null)?
              //     Row(
              //       children: [
              //         Icon(
              //           CupertinoIcons.arrow_left,
              //           size: AppThemeUtil.radius(24.0),
              //           color: AppThemeUtil.getThemeColor(Colors.black),
              //         ).onPressed(goBack!),
              //         Text(
              //           title?? '',
              //         ).extraBold().fontSize(16.0).color(Colors.black).overflowText(TextOverflow.ellipsis).paddingOnly(left: 16.0).flexible(),
              //       ],
              //     ).paddingOnly(right: 8.0).flexible()
              //     :
              //     Text(
              //       title?? '',
              //     ).extraBold().fontSize(16.0).color(kPrimaryBlack).overflowText(TextOverflow.ellipsis).paddingOnly(right: 8.0).flexible(),
              //     Icon(
              //       Icons.close,
              //       size: AppThemeUtil.radius(24.0),
              //       color: kGrey1200,
              //     ).onPressed(() => AppNavigator.pop(context),),
              //   ],
              // ).paddingOnly(left: kWidthPadding, right: kWidthPadding, bottom: 18.0),
            ],
          ),
        ),
      ),
    );
  }
}



class _HeaderPill extends StatelessWidget {
  const _HeaderPill();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 16.0, bottom: 32.0),
      child: ModalGrabBar(),
    );
  }
}
