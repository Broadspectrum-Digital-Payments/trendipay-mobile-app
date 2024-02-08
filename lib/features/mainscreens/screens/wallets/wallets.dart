import 'package:bdp_payment_app/features/mainscreens/screens/wallets/widgets/quick_transaction.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/widgets/transaction_item.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/widgets/wallet_slider.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/widgets/wallet_user.dart';
import 'package:bdp_payment_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../transfer_screen/transfer.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const WalletUser(),
        automaticallyImplyLeading: false,
        backgroundColor: BDPColors.white,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BDPSizes.defaultSpace),
          child: Column(
            children: [
              const WalletSlider(),
              const SizedBox(
                height: BDPSizes.spaceBtwItems,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        BDPTexts.quickTransaction,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: BDPColors.primary),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: BDPSizes.spaceBtwInputFields,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      QuickTransactionContainer(
                        transactionName: BDPTexts.moneyTransfer,
                        image: BDPImages.moneyTransfer, onPressed: () { Get.to(const TransferScreen());  },
                      ),
                      QuickTransactionContainer(
                          transactionName: BDPTexts.airtimeData,
                          image: BDPImages.airtimeData, onPressed: () { Get.to(const TransferScreen()); },),
                      QuickTransactionContainer(
                          transactionName: BDPTexts.billPayment,
                          image: BDPImages.billPayment, onPressed: () { Get.to(const TransferScreen()); },),
                    ],
                  ),
                  const SizedBox(
                    height: BDPSizes.spaceBtwSections,
                  ),
                  const Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            BDPTexts.recentTransaction,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: BDPColors.primary),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      TransactionItem(
                          title: BDPTexts.billPayment,
                          description: 'Payments made for Ghc400 to NedCo',
                          date: BDPTexts.date,
                          time: '4:0pm',
                          amount: BDPTexts.accountBalance,
                          isSuccess: true),
                      SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      TransactionItem(
                          title: BDPTexts.mobileMoneyTransfer,
                          description: 'Payments made for Ghc400 to NedCo',
                          date: BDPTexts.date,
                          time: '4:0pm',
                          amount: BDPTexts.accountBalance,
                          isSuccess: true),
                      SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      TransactionItem(
                          title: BDPTexts.airtimeOrData,
                          description: 'Payments made for Ghc400 to NedCo',
                          date: BDPTexts.date,
                          time: '4:0pm',
                          amount: BDPTexts.accountBalance,
                          isSuccess: true),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
