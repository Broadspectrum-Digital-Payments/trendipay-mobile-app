import 'package:bdp_payment_app/src/feature/wallet/presentation/widgets/wallet_card.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';

class WalletSlider extends StatelessWidget {
  const WalletSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            // WalletCard(
            //   accountNumber: BDPTexts.accountNumber,
            //   date: BDPTexts.date,
            //   accountBalance: BDPTexts.accountBalance,
            //   gradients: [BDPColors.primary2, BDPColors.secondary2],
            // ),
          ],
          options: CarouselOptions(
            viewportFraction: 1,
          ),
        ),
        const VSpace(
          height: BDPSizes.spaceBtwItems,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     for (int i = 0; i < 2; i++)
        //       CircularNavigator(
        //         width: 10,
        //         height: 10,
        //         backgroundColor: controller.carouselCurrentIndex.value == i
        //             ? BDPColors.primary
        //             : BDPColors.grey,
        //       ),
        //   ],
        // ),
      ],
    );
  }
}
