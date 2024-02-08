import 'package:flutter/material.dart';


class AddCardTextfields extends StatelessWidget {
  const AddCardTextfields({
    super.key, required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}