import 'package:bdp_payment_app/features/mainscreens/screens/bank_transfer/bank_transfer.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_events.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallet_blocs/wallet_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallet_blocs/wallet_states.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/widgets/quick_transaction.dart';
import 'package:bdp_payment_app/src/feature/home/presentation/screens/navigation_menu.dart';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../src/shared_widgets/common/authheaders.dart';
import '../../../../common/widgets/button/button.dart';
import '../../../../core/constants/image_strings.dart';
import '../../../../core/constants/text_strings.dart';
import '../select_card_screen/select_card.dart';
import '../select_wallet_screen/select_wallet.dart';
import '../wallets/wallet_blocs/wallet_events.dart';


class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController amountCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
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
                    Form(
                      key: formKey,
                      child: TextFormField(
                        controller: amountCtrl,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "Amount field must not be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          context.read<WalletBloc>().add(WalletAmountEvent(value: value));
                        },
                        decoration: InputDecoration(
                          enabled: state.submitData == false,
                          labelText: BDPTexts.enterAmount, labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Colors.grey,
                        ),
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
                          image: BDPImages.moneyTransfer, onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<WalletBloc>().add(WalletTransferIdEvent(value: '21'));
                              Get.to(const SelectWalletScreen());
                            }
                             },
                        ),
                        QuickTransactionContainer(
                          transactionName: BDPTexts.creditDebitCard,
                          image: BDPImages.airtimeData, onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<WalletBloc>().add(WalletTransferIdEvent(value: '22'));
                              Get.to(const SelectCardScreen());
                            }
                          },),
                        QuickTransactionContainer(
                          transactionName: BDPTexts.billPayment,
                          image: BDPImages.billPayment, onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<WalletBloc>().add(WalletTransferIdEvent(value: '23'));
                              Get.to(const BankTransferScreen());
                            }
                          },),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        );
      }
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
