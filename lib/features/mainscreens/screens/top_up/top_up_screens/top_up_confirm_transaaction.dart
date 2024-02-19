import 'package:bdp_payment_app/common/styles/spacing_styles.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallet_controller/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../../common/widgets/button/button.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../wallets/wallet_blocs/wallet_blocs.dart';
import '../../wallets/wallet_blocs/wallet_states.dart';

class TopupConfirmTransaction extends StatefulWidget {
  const TopupConfirmTransaction({super.key});

  @override
  State<TopupConfirmTransaction> createState() => _TopupConfirmTransactionState();
}

class _TopupConfirmTransactionState extends State<TopupConfirmTransaction> {

  late WalletTopUpController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = WalletTopUpController(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title:
                AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.selectWallet),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, size: 24),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              body: SingleChildScrollView(
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
                            isLoading: state.submitData == true,
                            buttonName: BDPTexts.confirmTransactionButton,
                            image: BDPImages.rightArrow,
                            onPressed: () {
                              controller.confirmTopUp();
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
              )
          );
        }
    );
  }
}