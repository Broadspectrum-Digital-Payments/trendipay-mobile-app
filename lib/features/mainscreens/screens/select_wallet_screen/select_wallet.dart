import 'package:bdp_payment_app/common/widgets/button/button.dart';
import 'package:bdp_payment_app/features/authentication/screens/account_registration/widgets/checkbox.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/top_up/top-up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../select_card_screen/select_card.dart';
import '../select_card_screen/widgets/add_card_textfields.dart';

class SelectWalletScreen extends StatelessWidget {
  const SelectWalletScreen({super.key});

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
            padding: const EdgeInsets.all(BDPSizes.defaultSpace),
            child: Column(
              children: [
                Image.asset(BDPImages.addWallet),
                const SizedBox(height: BDPSizes.spaceBtwItems),
                const Text(
                  textAlign: TextAlign.center,
                  BDPTexts.selectWalletTitle,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: BDPSizes.spaceBtwSections * 5,
                ),
                SizedBox(
                  width: 162,
                  height: 40,
                  child: Buttons(
                      buttonName: BDPTexts.addWallet,
                      image: BDPImages.add,
                      onPressed: () {
                        _showAddWalletModal();
                      }),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

void _showAddWalletModal() {
  showModalBottomSheet(
    isScrollControlled: true,
    context: Get.context!,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: BDPColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: const Text(
                  BDPTexts.addWallet,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: BDPColors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(BDPSizes.defaultSpace),
                child: Column(
                  children: [
                    const AddCardTextfields(
                      label: BDPTexts.walletName,
                    ),
                    const AddCardTextfields(
                      label: BDPTexts.mobileNetwork,
                    ),
                    const AddCardTextfields(
                      label: BDPTexts.phoneNo,
                    ),
                    const SizedBox(
                      height: BDPSizes.spaceBtwSections,
                    ),
                    const Row(
                      children: [
                        ARCheckbox(),
                        Text(
                          BDPTexts.allowWallets,
                          style:
                              TextStyle(fontSize: 12, color: BDPColors.primary),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: BDPSizes.spaceBtwItems,
                    ),
                    SizedBox(
                        width: 155,
                        height: 50,
                        child: Buttons(
                          buttonName: BDPTexts.saveWallet,
                          image: BDPImages.saveIcon,
                          onPressed: () {},
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}








