import 'package:bdp_payment_app/common/constants/styles.dart';
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/view_models/base_view.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:bdp_payment_app/src/feature/transaction/presentation/view_models/transaction_view_model.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/widgets/quick_transaction.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/widgets/wallet_recent_transactions.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/widgets/wallet_slider.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/widgets/wallet_user.dart';
import 'package:bdp_payment_app/core/constants/sizes.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/zloader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../../core/utils/app_dialog_util.dart';
import '../../../../shared_widgets/modals/error_modal_content.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await context.read<TransactionViewModel>().fetchTransactions(
        context,
        queryParam: {
          'pageSize': 10,
        }
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserViewModel>().getUser;
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuickTransactionContainer(
                        transactionName: BDPTexts.moneyTransfer,
                        image: BDPImages.moneyTransfer,
                        onPressed: () {
                          if(user.kycStatus == kQueuedStatus){
                            AppNavigator.pushNamed(context, AppRoute.kycSetupScreen);
                            return;
                          }
                          if(user.kycStatus == kSubmittedStatus){
                            AppDialogUtil.popUpModal(
                              context,
                              modalContent: const ErrorModalContent(
                                errorMessage: 'Be patience, we\'re reviewing your KYC',
                              ),
                            );
                            return;
                          }
                          AppNavigator.pushNamed(context, AppRoute.transactionInfoScreen);
                        },
                      ),
                      QuickTransactionContainer(
                        transactionName: BDPTexts.airtimeData,
                        image: BDPImages.airtimeData,
                        onPressed: () {

                        },
                      ),
                      QuickTransactionContainer(
                        transactionName: BDPTexts.billPayment,
                        image: BDPImages.billPayment,
                        onPressed: () {

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
                          child: BaseView<TransactionViewModel>(
                            builder: (context, transactionConsumer, child){
                              if(transactionConsumer.getComponentLoading('walletRecent')){
                                return const Center(
                                  child: ZLoader(loaderColor: BDPColors.primary),
                                );
                              }
                              if(transactionConsumer.getRecentTransactions.isEmpty){
                                return Center(
                                  child: Text(
                                    "You have no recent transactions",
                                    style: kRegularFontStyle.copyWith(
                                      fontSize: AppThemeUtil.fontSize(14.0),
                                      color: BDPColors.dark90,
                                    ),
                                  ),
                                );
                              }
                              return WalletRecentTransactions(
                                transactions: transactionConsumer.getRecentTransactions,
                              );
                            },
                          ),
                        ),
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

  // void _showHistoryModal() {
  //   showModalBottomSheet(
  //       context: context,
  //       isScrollControlled: true,
  //       builder: (context) {
  //         return BlocBuilder<TransactionBlocs, TransactionStates>(
  //             builder: (context, state) {
  //               return reusableHistoryData(
  //                   history: state.currentHistory,
  //                   loading: state.loadingTransactions == true);
  //             });
  //       });
  // }
}
