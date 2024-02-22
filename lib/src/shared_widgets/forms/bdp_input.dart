
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
    this.enabled = true,
    this.labelStyle,
    this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.onTapOutside,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool enabled;
  final TextStyle? labelStyle;
  final String? labelText;
  final Widget? suffixIcon;
  final bool obscureText;
  final void Function(PointerDownEvent)? onTapOutside;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

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
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        enabled: enabled,
        labelText: labelText,
        labelStyle: labelStyle?? TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: AppThemeUtil.fontSize(16),
          color: Colors.grey,
        ),
      ),
    );
  }
}
