import 'package:flutter/material.dart';

class TransferDetailsTextfields extends StatelessWidget {
  const TransferDetailsTextfields({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
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