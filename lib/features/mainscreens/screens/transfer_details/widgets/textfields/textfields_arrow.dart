import 'package:flutter/material.dart';


class TextFieldWithArrow extends StatelessWidget {
  final String labelText;

  const TextFieldWithArrow({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
