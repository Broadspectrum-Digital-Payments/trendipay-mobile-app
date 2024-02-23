import 'package:flutter/material.dart';

import '../../../../../common/constants/styles.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/utils/app_theme_util.dart';
import '../../../../shared_widgets/common/v_space.dart';

class LoanStats extends StatelessWidget {
  const LoanStats({
    super.key,
    this.bgColor,
    this.imageFile,
    required this.text,
  });

  final Color? bgColor;
  final String? imageFile;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppThemeUtil.width(8.0),
        vertical: AppThemeUtil.height(14.0),
      ),
      decoration: BoxDecoration(
          color: bgColor?? BDPColors.brightPurple,
          borderRadius: BorderRadius.circular(AppThemeUtil.radius(16))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: AppThemeUtil.radius(40),
            width: AppThemeUtil.radius(40),
            decoration: const BoxDecoration(
                color: BDPColors.white,
                shape: BoxShape.circle
            ),
            child: Image.asset(
              imageFile?? BDPImages.loanCollected,
              height: AppThemeUtil.radius(24),
              width: AppThemeUtil.radius(24),
            ),
          ),
          const VSpace(height: 10.0),
          Text(
            text,
            style: kMediumFontStyle.copyWith(
              fontSize: AppThemeUtil.fontSize(12.0),
              color: BDPColors.white,
            ),
          ),
          const VSpace(height: 10.0),
          Text(
            'GHS3,000',
            style: kBoldFontStyle.copyWith(
              fontSize: AppThemeUtil.fontSize(14.0),
              color: BDPColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
