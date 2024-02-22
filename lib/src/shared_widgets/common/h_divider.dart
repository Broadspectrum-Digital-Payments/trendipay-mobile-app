import 'package:flutter/material.dart';

class HDivider extends StatelessWidget {
  const HDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey[300],
      thickness: 1,
      height: 0,
    );
  }
}
