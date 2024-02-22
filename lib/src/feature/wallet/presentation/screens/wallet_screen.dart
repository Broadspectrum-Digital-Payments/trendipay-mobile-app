import 'package:bdp_payment_app/common/widgets/common_widgets.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_states.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_controller/transaction_controller.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/widgets/quick_transaction.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/widgets/transaction_item.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/widgets/wallet_slider.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/widgets/wallet_user.dart';
import 'package:bdp_payment_app/core/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../../features/mainscreens/screens/history/history_widgets/history_widgets.dart';
import '../../../../../features/mainscreens/screens/transfer_screen/transfer.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late TransactionHistoryController historyController;
  @override
  void initState() {
    historyController = TransactionHistoryController(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WalletUser(),
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
                                  ? const Center(
                                      child: Text(
                                          "you have no recent transactions"),
                                    )
                                  : ListView.separated(
                                      itemCount:
                                          state.recentTransactions.length,
                                      itemBuilder: (context, index) {
                                        var item =
                                            state.recentTransactions[index];
                                        return GestureDetector(
                                          onTap: (){
                                            historyController.loadTransactionById(item.id!);
                                            _showHistoryModal();
                                          },
                                          child: TransactionItem(
                                              title:
                                                  item.transferType?.name ?? "",
                                              description: item.description ?? "",
                                              date:
                                                  item.formattedProcessDate ?? "",
                                              time: formatTime(item.processDate),
                                              amount: item.formattedAmount ?? "",
                                              isSuccess:
                                                  item.status == "PROCESSED"),
                                        );
                                      }, separatorBuilder: (BuildContext context, int index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(vertical: 8.0.h),
                                          child: buildDivider(),
                                        );
                          },);
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

  void _showHistoryModal() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return BlocBuilder<TransactionBlocs, TransactionStates>(
              builder: (context, state) {
                return reusableHistoryData(
                    history: state.currentHistory,
                    loading: state.loadingTransactions == true);
              });
        });
  }
}
