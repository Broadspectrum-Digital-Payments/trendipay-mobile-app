import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/button/button.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../top_up/top-up.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

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
                      BDPTexts.accountNumber,
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
            SizedBox(width:139, height:50, child: Buttons(buttonName: BDPTexts.continueButtonText, image: BDPImages.rightArrow, onPressed: () {Get.to;{const TopUpScreen();}}))
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