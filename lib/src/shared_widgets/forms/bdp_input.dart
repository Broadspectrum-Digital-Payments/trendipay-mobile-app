
import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/utils/app_theme_util.dart';

class BDPInput extends StatelessWidget {
  const BDPInput({
    super.key,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onTap,
    this.enabled = true,
    this.labelStyle,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.onTapOutside,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.helperText,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool enabled;
  final TextStyle? labelStyle;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      onTapOutside: onTapOutside,
      onTap: onTap,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabled: enabled,
        labelText: labelText,
        helperText: helperText,
        helperStyle: kMediumFontStyle.copyWith(
          fontSize: AppThemeUtil.fontSize(12.0),
          color: BDPColors.brightPurple,
        ),
        labelStyle: labelStyle?? kRegularFontStyle.copyWith(
          fontSize: AppThemeUtil.fontSize(16),
          color: Colors.grey,
        ),
        // enabledBorder: const UnderlineInputBorder(
        //   borderSide: BorderSide(color: BDPColors.grey, width: 0.3),
        // ),
        // focusedBorder: const UnderlineInputBorder(
        //   borderSide: BorderSide(color: BDPColors.primary, width: 0.3),
        // ),
        // disabledBorder: const UnderlineInputBorder(
        //   borderSide: BorderSide(color: BDPColors.grey, width: 0.3),
        // ),
      ),
    );
  }
}
