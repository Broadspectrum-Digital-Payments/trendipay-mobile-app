import 'package:flutter/material.dart';

import '../../../core/utils/app_theme_util.dart';


class VSpace extends StatelessWidget {
  const VSpace({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: AppThemeUtil.height(height));
  }
}
