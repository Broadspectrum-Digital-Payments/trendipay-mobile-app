import 'package:bdp_payment_app/common/widgets/common_widgets.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_states.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/widgets/quick_transaction.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/widgets/transaction_item.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/widgets/wallet_slider.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/widgets/wallet_user.dart';
import 'package:bdp_payment_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../authentication/screens/navigation_menu/navigation_menu_controller/navigation_controller.dart';
import '../transfer_screen/transfer.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  late NavigationMenuController controller;
  @override
  void initState() {
    controller = NavigationMenuController(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WalletUser(controller: controller,),
        automaticallyImplyLeading: false,
        backgroundColor: BDPColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(BDPSizes.defaultSpace),
        child: Column(
          children: [
            const WalletSlider(),
            const SizedBox(
              height: BDPSizes.spaceBtwItems,
            ),
            Expanded(
              child: Column(
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
                        image: BDPImages.moneyTransfer,
                        onPressed: () {
                          Get.to(const TransferScreen());
                        },
                      ),
                      QuickTransactionContainer(
                        transactionName: BDPTexts.airtimeData,
                        image: BDPImages.airtimeData,
                        onPressed: () {
                          Get.to(const TransferScreen());
                        },
                      ),
                      QuickTransactionContainer(
                        transactionName: BDPTexts.billPayment,
                        image: BDPImages.billPayment,
                        onPressed: () {
                          Get.to(const TransferScreen());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: BDPSizes.spaceBtwSections,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Row(
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
                        const SizedBox(
                          height: BDPSizes.spaceBtwItems,
                        ),
                        Expanded(child:
                            BlocBuilder<TransactionBlocs, TransactionStates>(
                                builder: (context, state) {
                          return state.loadingTransactions
                              ? Center(
                                  child: loader(loaderColor: BDPColors.primary),
                                )
                              : state.recentTransactions.isEmpty
                                  ? Center(
                            child: Text(
                              "you have no recent transactions"
                            ),
                          )
                                  : ListView.builder(
                                      itemCount: state.recentTransactions.length,
                                      itemBuilder: (context, index) {
                                        var item = state.recentTransactions[index];
                                        return TransactionItem(
                                            title: item.transferType?.name ?? "",
                                            description: item.description ?? "",
                                            date: item.formattedProcessDate ?? "",
                                            time: formatTime(item.processDate),
                                            amount: item.formattedAmount ?? "",
                                            isSuccess: item.status == "PROCESSED");
                                      });
                        })),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
