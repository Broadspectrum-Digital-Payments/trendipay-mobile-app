import 'package:bdp_payment_app/features/mainscreens/controllers/wallet_controllers.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/widgets/wallet_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/circular_navigation/circular_shape.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';

class WalletSlider extends StatelessWidget {
  const WalletSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WalletController());
    return Column(
      children: [
        CarouselSlider(
          items: const [
            WalletCard(
              accountNumber: BDPTexts.accountNumber,
              date: BDPTexts.date,
              accountBalance: BDPTexts.accountBalance,
              gradients: [BDPColors.primary, BDPColors.secondary],
            ),
            WalletCard(
              accountNumber: BDPTexts.accountNumber,
              date: BDPTexts.date,
              accountBalance: BDPTexts.accountBalance,
              gradients: [BDPColors.primary2, BDPColors.secondary2],
            ),
          ],
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(
          height: BDPSizes.spaceBtwItems,
        ),
        Obx(
    () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 2; i++)
                CircularNavigator(
                  width: 10,
                  height: 10,
                  backgroundColor: controller.carouselCurrentIndex.value == i
                      ? BDPColors.primary
                      : BDPColors.grey,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
