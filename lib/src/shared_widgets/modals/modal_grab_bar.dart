

import 'package:flutter/material.dart';

import '../../../core/utils/app_theme_util.dart';
import '../../../core/constants/colors.dart';

class ModalGrabBar extends StatelessWidget {
  const ModalGrabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppThemeUtil.width(49),
      height: AppThemeUtil.height(5),
      // decoration: BoxDecoration(
      //   color: AppThemeUtil.getThemeColor(kGrey500),
      //   borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      // ),
    );
  }
}
