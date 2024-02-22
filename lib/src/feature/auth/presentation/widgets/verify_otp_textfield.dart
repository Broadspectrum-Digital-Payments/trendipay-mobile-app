import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/constants/colors.dart';

class VerifyOTPTextfield extends StatelessWidget {
  const VerifyOTPTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        4,
            (index) => SizedBox(
          width: 56,
          child: TextField(
            style: const TextStyle(
                color: BDPColors.primary
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number, // Set input type to only numbers
            inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Restrict input to only digits
            decoration: const InputDecoration(
              hintText: "",
              counterText: '', // Set counterText to empty string to remove the counter
            ),
            onChanged: (value) {
              if (value.length == 1) {
                // Focus on the next TextField if a character is entered
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
      ),
    );
  }
}