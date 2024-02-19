import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../../common/widgets/button/button.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';


class TransactionConfirmedScreen extends StatelessWidget {
  const TransactionConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.selectWallet),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 24),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: BDPSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Text(
                BDPTexts.transactionConfirmed,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black),
              ),
              const SizedBox(
                height: BDPSizes.spaceBtwItems,
              ),
              Image.asset(BDPImages.transactionConfirmed),
              const SizedBox(
                height: BDPSizes.spaceBtwSections * 5,
              ),
              SizedBox(
                  width: 113,
                  height: 50,
                  child: Buttons(
                      buttonName: BDPTexts.done,
                      image: BDPImages.rightArrow,
                      onPressed: () {
                        Get.offAll(const NavigationMenu());
                      }))
            ],
          ),
        ),
      ),
    );
  }
}