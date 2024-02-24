import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/button/button.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../../src/feature/wallet/presentation/screens/top-up_wallet_screen.dart';

class WalletItem extends StatelessWidget {
  const WalletItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(BDPSizes.defaultSpace),
        child: Column(
          children: [
            Column(
              children: [
                const Row(
                  children: [
                    Text(
                      BDPTexts.userName,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      BDPTexts.networkType,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      BDPTexts.number,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                _buildDivider(),
              ],
            ),
            SizedBox(width:139, height:50, child: Buttons(buttonName: BDPTexts.continueButtonText, image: BDPImages.rightArrow, onPressed: () {Get.to;{const TopUpWalletScreen();}}))
          ],
        ),
      ),
    );
  }
}

Widget _buildDivider() {
  return Divider(
    color: Colors.grey[300],
    thickness: 1,
    height: 0,
  );
}