import 'package:bdp_payment_app/common/constants/styles.dart';
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/view_models/base_view.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:bdp_payment_app/src/feature/history/presentation/view_models/transaction_view_model.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/widgets/quick_transaction.dart';
import 'package:bdp_payment_app/src/feature/history/presentation/widgets/transaction_list_view.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/widgets/wallet_user.dart';
import 'package:bdp_payment_app/core/constants/sizes.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/zloader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../../core/utils/app_dialog_util.dart';
import '../../../../shared_widgets/modals/error_modal_content.dart';
import '../widgets/wallet_card.dart';

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
      body: RefreshIndicator(
        onRefresh: () async{
          await context.read<UserViewModel>().fetchUser();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(BDPSizes.defaultSpace),
            child: Column(
              children: [
                const WalletCard(
                  accountNumber: BDPTexts.accountNumber,
                  date: BDPTexts.date,
                  accountBalance: BDPTexts.accountBalance,
                  gradients: [BDPColors.primary, BDPColors.secondary],
                ),
                const VSpace(
                  height: BDPSizes.spaceBtwItems,
                ),
                Column(
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
                        Flexible(
                          child: QuickTransactionContainer(
                            transactionName: BDPTexts.moneyTransfer,
                            image: BDPImages.moneyTransfer,
                            onPressed: () {
                              // if([kQueuedStatus, kStartedStatus].contains(user.getKycStatus)){
                              //   AppNavigator.pushNamed(context, AppRoute.kycSetupScreen);
                              //   return;
                              // }
                              // if(user.getKycStatus == kSubmittedStatus){
                              //   AppDialogUtil.popUpModal(
                              //     context,
                              //     modalContent: const ErrorModalContent(
                              //       errorMessage: 'Be patience, we\'re reviewing your KYC',
                              //     ),
                              //   );
                              //   return;
                              // }
                              AppNavigator.pushNamed(context, AppRoute.transactionInfoScreen);
                            },
                          ),
                        ),
                        const HSpace(width: 20.0),
                        Flexible(
                          child: QuickTransactionContainer(
                            transactionName: BDPTexts.airtimeData,
                            image: BDPImages.airtimeData,
                            onPressed: () {
                          
                            },
                          ),
                        ),
                        const HSpace(width: 20.0),

                        Flexible(
                          child: QuickTransactionContainer(
                            transactionName: BDPTexts.billPayment,
                            image: BDPImages.billPayment,
                            onPressed: () {

                            },
                          ),
                        ),
                      ],
                    ),
                    const VSpace(
                      height: BDPSizes.spaceBtwSections,
                    ),
                    Column(
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
                        BaseView<TransactionViewModel>(
                          builder: (context, transactionConsumer, child){
                            if(transactionConsumer.getComponentLoading('walletRecent') && transactionConsumer.getTransactions.isEmpty){
                              return Padding(
                                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                                child: const ZLoader(loaderColor: BDPColors.primary, size: 24),
                              );
                            }
                            if(transactionConsumer.getTransactions.isEmpty){
                              return Padding(
                                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                                child: Text(
                                  "You have no recent transactions",
                                  style: kRegularFontStyle.copyWith(
                                    fontSize: AppThemeUtil.fontSize(14.0),
                                    color: BDPColors.dark90,
                                  ),
                                ),
                              );
                            }
                            return TransactionListView(
                              transactions: transactionConsumer.getTransactions,
                              primary: false,
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
