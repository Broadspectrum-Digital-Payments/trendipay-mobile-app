import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';


class TransferAmoutContainer extends StatelessWidget {
  const TransferAmoutContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: const BoxDecoration(
        color: BDPColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter Amount',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: BDPColors.white),
          ),
          SizedBox(
            height: BDPSizes.spaceBtwItems,
          ),
          Text(
            '0.00',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: BDPColors.white),
          ),
        ],
      ),
    );
  }
}