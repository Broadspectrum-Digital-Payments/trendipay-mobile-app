import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/styles.dart';

class BDPDropdown extends StatelessWidget {
  const BDPDropdown({
    super.key,
    this.value,
    required this.onChanged,
    required this.items,
    required this.labelText,
    this.validator,
  });

  final String? value;
  final void Function(String?)? onChanged;
  final List<String> items;
  final String labelText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      value: value,
      hint: Text(
        labelText,
        style: kRegularFontStyle.copyWith(
          fontSize: AppThemeUtil.fontSize(16),
          color: Colors.grey,
        ),
      ),
      icon: Icon(Icons.arrow_drop_down, size: AppThemeUtil.radius(32.0),),
      style: const TextStyle(
        color: Colors.deepPurple,
      ),
      onChanged: onChanged,
      validator: validator,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: kMediumFontStyle.copyWith(
              fontSize: AppThemeUtil.fontSize(14),
              color: BDPColors.dark90,
            ),
          ),
        );
      }).toList(),
      // decoration: const InputDecoration(
      //   enabledBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(color: BDPColors.grey, width: 0.3),
      //   ),
      //   focusedBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(color: BDPColors.primary, width: 0.3),
      //   ),
      //   disabledBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(color: BDPColors.grey, width: 0.3),
      //   ),
      // ),
    );
  }
}
