import 'package:bdp_payment_app/features/mainscreens/screens/bank_transfer/bank_transfer.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/widgets/quick_transaction.dart';
import 'package:bdp_payment_app/navigation_menu.dart';
import 'package:bdp_payment_app/utils/constants/colors.dart';
import 'package:bdp_payment_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../common/widgets/button/button.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../select_card_screen/select_card.dart';
import '../select_wallet_screen/select_wallet.dart';

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.topUp),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 24),
            onPressed: () {
             Get.back();
            },
          ),
        ),
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(BDPSizes.defaultSpace),
            child: Column(
              children: [
                const Text(
                  BDPTexts.topupTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: BDPSizes.spaceBtwItems,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: BDPTexts.enterAmount,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: BDPSizes.spaceBtwSections,
                ),
                const Row(
                  children: [
                    Text(
                      BDPTexts.paymentMethod,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: BDPSizes.spaceBtwItems,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    QuickTransactionContainer(
                      transactionName: BDPTexts.moneyTransfer,
                      image: BDPImages.moneyTransfer, onPressed: () { Get.to(const SelectWalletScreen()); },
                    ),
                    QuickTransactionContainer(
                      transactionName: BDPTexts.creditDebitCard,
                      image: BDPImages.airtimeData, onPressed: () { Get.to(const SelectCardScreen()); },),
                    QuickTransactionContainer(
                      transactionName: BDPTexts.billPayment,
                      image: BDPImages.billPayment, onPressed: () { Get.to(const BankTransferScreen()); },),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}

class TopupConfirmTransaction extends StatelessWidget {
  const TopupConfirmTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: BDPSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            Text(
              BDPTexts.transactionConfirmation,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black),
            ),
            const SizedBox(
              height: BDPSizes.spaceBtwItems,
            ),
            Text(
              BDPTexts.transactionConfirmationSubTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: BDPSizes.spaceBtwSections * 2,
            ),
            SizedBox(
              width: 216,
              height: 50,
              child: Buttons(
                  buttonName: BDPTexts.confirmTransactionButton,
                  image: BDPImages.rightArrow,
                  onPressed: () {
                    Get.to(const TransactionConfirmedScreen());
                  }),
            ),
            const SizedBox(
              height: BDPSizes.spaceBtwItems,
            ),
            Text(
              BDPTexts.noPrompt,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionConfirmedScreen extends StatelessWidget {
  const TransactionConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      Get.to(const NavigationMenu());
                    }))
          ],
        ),
      ),
    );
  }
}

class TopUpWalletDetailsScreen extends StatelessWidget {
  const TopUpWalletDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(BDPSizes.defaultSpace),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  BDPTexts.detailsTitle,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: BDPSizes.spaceBtwSections,
            ),
            TextFormField(
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.grey,
              ),
              decoration: InputDecoration(
                labelText: BDPTexts.enterAmount,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: BDPSizes.spaceBtwSections,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  BDPTexts.paymentMethod,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: BDPSizes.spaceBtwInputFields,
            ),
            const Column(
              children: [
                Row(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      BDPTexts.networkType,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          BDPTexts.changeNetwork,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: BDPColors.primary),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                          color: BDPColors.primary,
                        )
                      ],
                    ),
                  ],
                ),
                Row(
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
              ],
            ),
          ],
        ),
      ),
    );

  }
}

class TopUpCardDetailsScreen extends StatelessWidget {
  const TopUpCardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(BDPSizes.defaultSpace),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  BDPTexts.detailsTitle,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: BDPSizes.spaceBtwSections,
            ),
            TextFormField(
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.grey,
              ),
              decoration: InputDecoration(
                labelText: BDPTexts.enterAmount,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: BDPSizes.spaceBtwSections,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  BDPTexts.paymentMethod,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: BDPSizes.spaceBtwInputFields,
            ),
            const Column(
              children: [
                Row(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      BDPTexts.accountNumber,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          BDPTexts.changeNetwork,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: BDPColors.primary),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                          color: BDPColors.primary,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
