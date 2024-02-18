
import 'package:bdp_payment_app/features/mainscreens/screens/saved_beneficiary/saved_beneficiary.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_details/transaction_Otp.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_details/widgets/textfields/textfields_arrow.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_details/widgets/textfields/textfields_no_arrow.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_details/widgets/transfer_amount_container.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_events.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_states.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_controller/transfer_controller.dart';
import 'package:bdp_payment_app/utils/constants/colors.dart';
import 'package:bdp_payment_app/utils/constants/image_strings.dart';
import 'package:bdp_payment_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/button/button.dart';
import '../../../../utils/constants/sizes.dart';

class TransferDetailsScreen extends StatefulWidget {
  const TransferDetailsScreen({super.key});

  @override
  State<TransferDetailsScreen> createState() => _TransferDetailsScreenState();
}

class _TransferDetailsScreenState extends State<TransferDetailsScreen> {

  late TransFerController controller;

  TransferBloc? transferBloc;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController accountNumberCtrl  = TextEditingController();
  TextEditingController accNameCtrl  = TextEditingController();
  TextEditingController amntCtrl  = TextEditingController();
  TextEditingController descCtrl  = TextEditingController();

  FocusNode focusNode = FocusScopeNode();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    transferBloc = context.read<TransferBloc>();
  }

  @override
  void initState() {
    controller = TransFerController(context: context);
    super.initState();
  }

  @override
  void dispose() {
    transferBloc?.add(ResetTransferData());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferBloc, TransferStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: (){
            focusNode.unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0, // Removes the shadow
              leading: IconButton(
                icon: Icon(Icons.arrow_back, size: 24.sp),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(BDPSizes.defaultSpace),
                child: Form(
                  key: globalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TransferAmoutContainer(),
                      const SizedBox(
                        height: BDPSizes.spaceBtwInputFields,
                      ),
                      // const TextFieldWithArrow(labelText: 'Select account'),
                      // const SizedBox(
                      //   height: BDPSizes.spaceBtwInputFields,
                      // ),
                      // const TextFieldWithArrow(labelText: 'Select Beneficiary'),
                      // const SizedBox(
                      //   height: BDPSizes.spaceBtwInputFields,
                      // ),

                      TransferDetailsTextfields(
                        label: 'Amount*',
                        controller: amntCtrl,
                        keyboardType: TextInputType.number,
                        enabled: state.completingTransfer == false,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "Amount field must not be empty";
                          }
                          return null;
                        },
                        onChanged: (value){
                          context.read<TransferBloc>().add(AmountEvent(amount: value));
                        },
                      ),
                      const SizedBox(
                        height: BDPSizes.spaceBtwInputFields,
                      ),
                      TransferDetailsTextfields(
                        label: 'Account Number*',
                        controller: accountNumberCtrl,
                        keyboardType: TextInputType.number,
                        enabled: state.completingTransfer == false,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "Account number field must not be empty";
                          }
                          return null;
                        },
                        onChanged: (value){
                          context.read<TransferBloc>().add(AccountNumber(accountNum: value));
                        },
                      ),
                      const SizedBox(
                        height: BDPSizes.spaceBtwInputFields,
                      ),
                      TransferDetailsTextfields(
                        label: 'Account Name*',
                        controller: accNameCtrl,
                        enabled: state.completingTransfer == false,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "Account name field must not be empty";
                          }
                          return null;
                        },
                        onChanged: (value){
                          context.read<TransferBloc>().add(AccountName(name: value));
                        },
                      ),
                      const SizedBox(
                        height: BDPSizes.spaceBtwInputFields,
                      ),
                      TransferDetailsTextfields(
                        label: 'Description*',
                        controller: descCtrl,
                        enabled: state.completingTransfer == false,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "Description field must not be empty";
                          }
                          return null;
                        },
                        onChanged: (value){
                          context.read<TransferBloc>().add(DescriptionEvent(desc: value));
                        },
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
                                  if (globalKey.currentState!.validate()) {
                                    _showTransactionSummaryModal();
                                  }
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
            ),
          ),
        );
      }
    );
  }

  void _showTransactionSummaryModal() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) {
        return SizedBox(
          height:
          MediaQuery.of(context).size.height * 0.5,
          child: BlocBuilder<TransferBloc, TransferStates>(
              builder: (context, state) {
                return Column(
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
                                'GHC ${state.amount}',
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
                    Expanded(
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
                                          fontSize: 16.sp,
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
                                      state.accountName!,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight:
                                          FontWeight.w500,
                                          color:
                                          BDPColors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'With account number',
                                      style: TextStyle(
                                          fontSize: 16.sp,
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
                                      state.accountNumber!,
                                      style: TextStyle(
                                          fontSize: 16.sp,
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
                                          fontSize: 16.sp,
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
                                      state.description!,
                                      style: TextStyle(
                                          fontSize: 16.sp,
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
                          isLoading: state.completingTransfer == true,
                          buttonName: BDPTexts.confirm,
                          image: BDPImages.rightArrow,
                          onPressed: (){
                            controller.initiatePtoPTransfer();
                          }
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                );
              }
          ),
        );
      },
    );
  }
}