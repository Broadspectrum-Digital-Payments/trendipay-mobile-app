import 'package:bdp_payment_app/common/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../../features/authentication/controllers/onboarding_controller.dart';
import '../../../utils/constants/colors.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.buttonName,
    required this.image,
    required this.onPressed,
    this.isLoading = false

  });
  final String buttonName;
  final String image;

  final bool? isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: BDPColors.primary,
        padding: const EdgeInsets.only(left: 26),
      ),
      child: isLoading! ?
          Center(
            child: loader(),
          )
          : Row(
        children: [
          Text(
            buttonName,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Image.asset(
            image,
            width: 24, // Adjust width as needed
            height: 24, // Adjust height as needed
          ),
        ],
      ),
    );
  }
}
