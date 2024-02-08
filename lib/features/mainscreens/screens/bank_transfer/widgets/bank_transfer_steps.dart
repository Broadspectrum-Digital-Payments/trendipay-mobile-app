import 'package:flutter/material.dart';

class BankTransferSteps extends StatelessWidget {
  const BankTransferSteps({
    super.key, required this.step,
  });
  final String step;
  @override
  Widget build(BuildContext context) {
    return  Text(step,style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),);
  }
}