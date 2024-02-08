
import 'package:bdp_payment_app/features/mainscreens/screens/saved_beneficiary/saved_beneficiary.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_details/transaction_Otp.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_details/widgets/textfields/textfields_arrow.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_details/widgets/textfields/textfields_no_arrow.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_details/widgets/transfer_amount_container.dart';
import 'package:bdp_payment_app/utils/constants/colors.dart';
import 'package:bdp_payment_app/utils/constants/image_strings.dart';
import 'package:bdp_payment_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/button/button.dart';
import '../../../../utils/constants/sizes.dart';

class TransferDetailsScreen extends StatelessWidget {
  const TransferDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes the shadow
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TransferAmoutContainer(),
              const SizedBox(
                height: BDPSizes.spaceBtwInputFields,
              ),
              const TextFieldWithArrow(labelText: 'Select account'),
              const SizedBox(
                height: BDPSizes.spaceBtwInputFields,
              ),
              const TextFieldWithArrow(labelText: 'Select Beneficiary'),
              const SizedBox(
                height: BDPSizes.spaceBtwInputFields,
              ),
              const TransferDetailsTextfields(
                label: 'Account Number*',
              ),
              const SizedBox(
                height: BDPSizes.spaceBtwInputFields,
              ),
              const TransferDetailsTextfields(
                label: 'Account Name*',
              ),
              const SizedBox(
                height: BDPSizes.spaceBtwInputFields,
              ),
              const TransferDetailsTextfields(
                label: 'Description*',
              ),
              const SizedBox(
                height: BDPSizes.spaceBtwInputFields * 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: 139,
                      height: 50,
                      child: Buttons(
                        buttonName: BDPTexts.continueButtonText,
                        image: BDPImages.rightArrow,
                        onPressed: () {
                          _showTransactionSummaryModal();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void _showTransactionSummaryModal() {
  showModalBottomSheet(
    context: Get.context!,
    builder: (BuildContext context) {
      return SizedBox(
        height:
        MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: BDPColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: const Text(
                'Transaction Summary',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: BDPColors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'You are sending an amount of',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height:
                    BDPSizes.spaceBtwInputFields,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Text(
                        'GHC 2,540.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          foreground: Paint()
                            ..shader =
                            const LinearGradient(
                              colors: [
                                BDPColors.primary,
                                BDPColors.secondColor,
                              ],
                            ).createShader(const Rect
                                .fromLTWH(
                                0.0,
                                0.0,
                                200.0,
                                70.0)), // Adjust the width and height as needed
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Padding(
                padding:
                EdgeInsets.only(left: 8, top: 8),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'To',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.w400,
                                  color:
                                  BDPColors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Audrey Sam',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.w500,
                                  color:
                                  BDPColors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'With account number',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.w400,
                                  color:
                                  BDPColors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '123456789',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.w500,
                                  color:
                                  BDPColors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Note',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.w400,
                                  color:
                                  BDPColors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Foe Fees',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.w500,
                                  color:
                                  BDPColors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 281,
              height: 50,
              child: Buttons(
                buttonName: BDPTexts.confirm,
                image: BDPImages.rightArrow,
                onPressed: () => Get.offAll(
                    const TransactionVerifyOTP()),
              ),
            ),
          ],
        ),
      );
    },
  );
}