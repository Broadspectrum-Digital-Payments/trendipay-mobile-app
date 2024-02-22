import 'package:bdp_payment_app/src/shared_widgets/common/authheaders.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallets.dart';
import 'package:bdp_payment_app/core/constants/image_strings.dart';
import 'package:bdp_payment_app/core/constants/sizes.dart';
import 'package:bdp_payment_app/core/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/transfer_options.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes the shadow
        title: AuthHeader(
          icon: BDPImages.bdpIcon,
          title: BDPTexts.transfer,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 24),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(BDPSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              height: BDPSizes.spaceBtwSections,
            ),
            TransferOption(transferType: BDPTexts.p2pTransfer, transferLogo: BDPImages.p2pTransfer,),
            SizedBox(
              height: BDPSizes.spaceBtwItems,
            ),
            TransferOption(transferType: BDPTexts.mobileMoneyTransfer, transferLogo: BDPImages.momoTransfer1)
          ],
        ),
      ),
    );
  }
}

