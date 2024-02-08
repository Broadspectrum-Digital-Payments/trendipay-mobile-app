import 'package:bdp_payment_app/common/widgets/custom_appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../wallets/widgets/transaction_item.dart';



class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarTitle: BDPTexts.transactionHistory,),
      body:   SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BDPSizes.defaultSpace),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      const TransactionItem(
                          title: BDPTexts.billPayment,
                          description: 'Payments made for Ghc400 to NedCo',
                          date: BDPTexts.date,
                          time: '4:0pm',
                          amount: BDPTexts.accountBalance,
                          isSuccess: true),
                      const SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      _buildDivider(),
                      const SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      const TransactionItem(
                          title: BDPTexts.mobileMoneyTransfer,
                          description: 'Payments made for Ghc400 to NedCo',
                          date: BDPTexts.date,
                          time: '4:0pm',
                          amount: BDPTexts.accountBalance,
                          isSuccess: true),
                      const SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      _buildDivider(),
                      const SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      const TransactionItem(
                          title: BDPTexts.airtimeOrData,
                          description: 'Payments made for Ghc400 to NedCo',
                          date: BDPTexts.date,
                          time: '4:0pm',
                          amount: BDPTexts.accountBalance,
                          isSuccess: true),
                      const SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      _buildDivider(),
                      const SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      const TransactionItem(
                          title: BDPTexts.airtimeOrData,
                          description: 'Payments made for Ghc400 to NedCo',
                          date: BDPTexts.date,
                          time: '4:0pm',
                          amount: BDPTexts.accountBalance,
                          isSuccess: true),
                      const SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      _buildDivider(),
                      const SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      const TransactionItem(
                          title: BDPTexts.airtimeOrData,
                          description: 'Payments made for Ghc400 to NedCo',
                          date: BDPTexts.date,
                          time: '4:0pm',
                          amount: BDPTexts.accountBalance,
                          isSuccess: true),
                      const SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      _buildDivider(),
                      const SizedBox(
                        height: BDPSizes.spaceBtwItems,
                      ),
                      const TransactionItem(
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

Widget _buildDivider() {
  return Divider(
    color: Colors.grey[300],
    thickness: 1,
    height: 0,
  );
}

