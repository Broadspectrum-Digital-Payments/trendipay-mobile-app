
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/app_theme_util.dart';

extension ShimmerLoadingEffect on Widget{

  Widget applyShimmer(
      {bool enable = true, Color? baseColor, Color? highlightColor}) {
    if (enable) {
      return Shimmer.fromColors(
        baseColor: baseColor??  AppThemeUtil.getThemeColor(Colors.grey.shade100),
        highlightColor: highlightColor??  AppThemeUtil.getThemeColor(Colors.grey.withOpacity(0.1)),
        child: this,
      );
    } else {
      return this;
    }
  }

}