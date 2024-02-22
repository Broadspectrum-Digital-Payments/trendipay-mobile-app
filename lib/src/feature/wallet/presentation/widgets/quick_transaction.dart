import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../features/mainscreens/screens/transfer_screen/transfer.dart';


class QuickTransactionContainer extends StatelessWidget {
  const QuickTransactionContainer({
    super.key, required this.transactionName, required this.image, required this.onPressed,
  });
  final String transactionName;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 100, // Adjust width as needed
          height: 54, // Adjust height as needed
          decoration: BoxDecoration(
              border: Border.all(
                color: BDPColors.primary, // Color of the border
                width: 1, // Width of the border
              ),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image), // Icon
              const SizedBox(height: 8), // Spacer between icon and text
              Text(transactionName, textAlign: TextAlign.center, style: const TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w600, color: BDPColors.primary
              ),)
            ],
          ),
        ),
      ),
    );
  }
}