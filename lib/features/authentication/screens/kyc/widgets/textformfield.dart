import 'package:flutter/material.dart';

class kYCTextFields extends StatelessWidget {
  const kYCTextFields({

    super.key,
    required this.label,
    this.enabled = true,
  });
  final String label;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      decoration:  InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}