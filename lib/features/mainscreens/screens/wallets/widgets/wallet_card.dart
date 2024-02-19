import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../top_up/top-up.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key, required this.accountNumber, required this.date, required this.accountBalance, required this.gradients,
  });

  final String accountNumber;
  final String date;
  final String accountBalance;
  final List<Color> gradients;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(color: Colors.grey, width: 1.0),
          gradient:  LinearGradient(
            colors:gradients,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 14.13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: BDPColors.white,
                ),
                child: Image.asset(BDPImages.visa),
              ),
              const SizedBox(width: 16.0),
               Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    accountNumber,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: BDPColors.white),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: BDPColors.white),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    accountBalance,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: BDPColors.white),
                  ),
                  const Text(
                    BDPTexts.accountBalanceText,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: BDPColors.white),
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
              const Icon(
                Icons.remove_red_eye_outlined,
                color: BDPColors.white,
                size: 24,
              ), // Example icon, replace with your icon
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 66,
                height: 26,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    backgroundColor: BDPColors.white,
                    padding: const EdgeInsets.only(left: 9),
                  ),
                  child: GestureDetector(
                    onTap: () {Get.to(()=> const TopUpScreen());},
                    child: Row(
                      children: [
                        const Text(
                          BDPTexts.topUpButton,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: BDPColors.primary,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          BDPImages.rightArrow,
                          width: 8.75, // Adjust width as needed
                          height: 7,
                          color: BDPColors.primary,// Adjust height as needed
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}