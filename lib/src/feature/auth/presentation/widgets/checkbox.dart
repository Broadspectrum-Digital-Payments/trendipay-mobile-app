import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:flutter/material.dart';

class ARCheckbox extends StatelessWidget {
  final bool? value;
  final Function(bool?)? onChanged;
  const ARCheckbox({
    this.value,
    this.onChanged,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppThemeUtil.radius(24),
      height: AppThemeUtil.radius(24),
      child: Checkbox(value: value, onChanged: onChanged),
    );
  }
}