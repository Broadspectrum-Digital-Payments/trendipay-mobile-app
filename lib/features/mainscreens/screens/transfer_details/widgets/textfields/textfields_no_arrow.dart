import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransferDetailsTextfields extends StatelessWidget {
  const TransferDetailsTextfields({
    super.key,
    required this.label,
    this.controller, this.onChanged, this.validator,
    this.enabled = true,
    this.keyboardType
  });
  final String label;

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabled: enabled,
        labelText: label, labelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        color: Colors.grey,
      ),
      ),
    );
  }
}