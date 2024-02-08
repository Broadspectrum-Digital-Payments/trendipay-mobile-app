import 'package:flutter/material.dart';

class ARCheckbox extends StatelessWidget {
  const ARCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Checkbox(value: true, onChanged: (value) {}),
    );
  }
}