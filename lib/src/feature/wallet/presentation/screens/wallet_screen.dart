import 'package:bdp_payment_app/common/constants/styles.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/view_models/base_view.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_states.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_controller/transaction_controller.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/view_models/wallet_view_model.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/widgets/quick_transaction.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/widgets/wallet_recent_transactions.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/widgets/wallet_slider.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/widgets/wallet_user.dart';
import 'package:bdp_payment_app/core/constants/sizes.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            const VSpace(
              height: BDPSizes.spaceBtwItems,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        BDPTexts.quickTransaction,
                        style: kBoldFontStyle.copyWith(
                          fontSize: AppThemeUtil.fontSize(16),
                        ),
                      ),
                    ],
                  ),
                  const VSpace(
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
                  const VSpace(
                    height: BDPSizes.spaceBtwSections,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              BDPTexts.recentTransaction,
                              style: kBoldFontStyle.copyWith(
                                fontSize: AppThemeUtil.fontSize(16),
                              ),
                            ),
                          ],
                        ),
                        const VSpace(
                          height: BDPSizes.spaceBtwItems,
                        ),
                        Expanded(
                          child: BaseView<WalletViewModel>(
                            builder: (context, walletConsumer, child){
                              return WalletRecentTransactions(
                                transactions: walletConsumer.getRecentTransactions,
                              );
                            },
                          ),
                        ),
                        // Expanded(child:
                        //     BlocBuilder<TransactionBlocs, TransactionStates>(
                        //         builder: (context, state) {
                        //   return state.loadingTransactions
                        //       ? Center(
                        //           child: loader(loaderColor: BDPColors.primary),
                        //         )
                        //       : state.recentTransactions.isEmpty
                        //           ? const Center(
                        //               child: Text(
                        //                   "you have no recent transactions"),
                        //             )
                        //           :
                        //
                        // }
                        // ),
                        // ),
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
