import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class BankTransferTextfield extends StatelessWidget {
  const BankTransferTextfield({
    super.key, required this.number,
  });
  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 42,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey, // Color of the border
            width: 1, // Width of the border
          ),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              number,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: BDPColors.primary,
              ),
              child: const Text(
                BDPTexts.copy,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
