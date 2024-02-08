import 'package:bdp_payment_app/common/widgets/button/button.dart';
import 'package:bdp_payment_app/features/authentication/screens/account_registration/widgets/checkbox.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/select_card_screen/widgets/add_card_textfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../top_up/top-up.dart';

class SelectCardScreen extends StatelessWidget {
  const SelectCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.selectCard),
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
              const SizedBox(
                height: BDPSizes.spaceBtwSections,
              ),
              Image.asset(BDPImages.addCard),
              const SizedBox(height: BDPSizes.spaceBtwItems),
              const Text(
                textAlign: TextAlign.center,
                BDPTexts.selectCardTitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: BDPSizes.spaceBtwSections * 7,
              ),
              SizedBox(
                width: 162,
                height: 40,
                child: Buttons(
                    buttonName: BDPTexts.addCard,
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
                    const AddCardTextfields(label: BDPTexts.cardNumber,),
                    const AddCardTextfields(label: BDPTexts.cardName,),
                   const Row(
                      children: [
                        SizedBox(width: 150, child: AddCardTextfields(label: BDPTexts.expiryDate,)),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(width: 150, child: AddCardTextfields(label: BDPTexts.cvv,)),
                      ],
                    ),
                    const SizedBox(
                      height: BDPSizes.spaceBtwSections,
                    ),
                    const Row(
                      children: [
                        ARCheckbox(),
                        Text(
                          BDPTexts.allowWallets,
                          style: TextStyle(
                              fontSize: 12,
                              color: BDPColors.primary
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: BDPSizes.spaceBtwItems,
                    ),
                    SizedBox(width:155, height:50,child: Buttons(buttonName: BDPTexts.saveCard, image: BDPImages.saveIcon, onPressed: (){},))
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



