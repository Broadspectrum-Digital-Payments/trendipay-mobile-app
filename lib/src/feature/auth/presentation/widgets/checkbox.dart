import 'package:flutter/material.dart';

class ARCheckbox extends StatelessWidget {
  bool? value;
  final Function(bool?)? onChanged;
  ARCheckbox({
    this.value,
    this.onChanged,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Checkbox(value: value, onChanged: onChanged),
    );
  }
}