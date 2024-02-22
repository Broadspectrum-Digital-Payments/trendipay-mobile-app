import 'package:bdp_payment_app/common/constants/general_repository.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallet_blocs/wallet_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallet_blocs/wallet_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../src/shared_widgets/common/authheaders.dart';
import '../../../../../common/widgets/button/button.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';


class TopUpWalletDetailsScreen extends StatefulWidget {
  const TopUpWalletDetailsScreen({super.key});

  @override
  State<TopUpWalletDetailsScreen> createState() => _TopUpWalletDetailsScreenState();
}

class _TopUpWalletDetailsScreenState extends State<TopUpWalletDetailsScreen> {

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
                    enabled: false,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: Colors.grey,
                    ),
                    decoration: InputDecoration(
                      labelText: "GHC ${GeneralRepository.formatNumber(value: num.tryParse(state.amount))}",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
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
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            state.currentWallet?.walletName ?? "",
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
                            state.currentWallet?.walletNetwork ?? "",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: Row(
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
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            state.currentWallet?.phoneNumber ?? "",
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
                  const SizedBox(
                    height: BDPSizes.spaceBtwInputFields * 15,
                  ),
                  SizedBox(
                    width: 162,
                    height: 40,
                    child: Buttons(
                      isLoading: state.submitData == true,
                        buttonName: BDPTexts.continueButtonText,
                        image: BDPImages.rightArrow,
                        onPressed: () {

                        }),
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