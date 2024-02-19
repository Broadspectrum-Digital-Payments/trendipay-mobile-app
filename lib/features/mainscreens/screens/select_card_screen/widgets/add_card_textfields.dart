import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AddCardTextfields extends StatelessWidget {
  const AddCardTextfields({
    super.key,
    required this.label,
    this.controller, this.enabled = true,
    this.validator, this.onChanged,
    this.keyboardType


  });
  final String label;
  final TextEditingController? controller;
  final bool? enabled;
  final String? Function(String?)? validator;

  final TextInputType? keyboardType;

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: Colors.grey,
        ),
      ),
    );
  }
}