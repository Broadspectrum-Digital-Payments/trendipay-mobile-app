import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';


class AuthHeader extends StatelessWidget {
  AuthHeader({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon),
        const SizedBox(
          width: BDPSizes.spaceBtwItems,
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}