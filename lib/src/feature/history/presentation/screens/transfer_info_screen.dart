
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/utils/app_dialog_util.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/view_models/base_view.dart';
import 'package:bdp_payment_app/src/feature/history/presentation/view_models/transaction_view_model.dart';
import 'package:bdp_payment_app/src/feature/history/presentation/widgets/transfer_amount_container.dart';
import 'package:bdp_payment_app/core/constants/text_strings.dart';
import 'package:bdp_payment_app/src/feature/history/presentation/widgets/transfer_summary_modal_content.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/zloader.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/bdp_dropdown.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/bdp_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/common.dart';
import '../../../../../core/constants/sizes.dart';

class TransferInfoScreen extends StatefulWidget {
  const TransferInfoScreen({super.key});

  @override
  State<TransferInfoScreen> createState() => _TransferInfoScreenState();
}

class _TransferInfoScreenState extends State<TransferInfoScreen> {
  final formKey = GlobalKey<FormState>();
  final accountNumberCtrl  = TextEditingController();
  final accNameCtrl  = TextEditingController();
  final amntCtrl  = TextEditingController();
  final descCtrl  = TextEditingController();
  final amountFocusNode = FocusNode();
  final accountNumberFocusNode = FocusNode();

  final transferAmount = ValueNotifier<String>('0.0');
  final accountNetwork = ValueNotifier<String?>(null);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TransactionViewModel>().setEnquiryResult = null;
    });
    super.initState();
  }

  @override
  void dispose() {
    accountNumberCtrl.dispose();
    accNameCtrl.dispose();
    amntCtrl.dispose();
    descCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes the shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: AppThemeUtil.radius(24.0)),
          onPressed: () => AppNavigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BDPSizes.defaultSpace),
          child: BaseView<TransactionViewModel>(
            builder: (context, transactionConsumer, child) {
              accNameCtrl.text = transactionConsumer.getEnquiryResult?.name?? '';
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ValueListenableBuilder<String>(
                      valueListenable: transferAmount,
                      builder: (context, transferAmountValue, child) {
                        return TransferAmountContainer(
                          amount: transferAmountValue,
                        );
                      }
                    ),
                    const VSpace(
                      height: BDPSizes.spaceBtwInputFields,
                    ),

                    BDPInput(
                      labelText: 'Amount*',
                      controller: amntCtrl,
                      focusNode: amountFocusNode,
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return "Amount field must not be empty";
                        }
                        if(double.parse(value) == 0) return 'Amount field can not be 0';
                        return null;
                      },
                      onChanged: (value){
                        transferAmount.value = value;
                      },
                      keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r"^\d+\.?\d{0,2}"))
                      ],
                      onTapOutside: (event){
                        amountFocusNode.unfocus();
                      },
                    ),
                    const VSpace(
                      height: BDPSizes.spaceBtwInputFields,
                    ),
                    FocusScope(
                      child: Focus(
                        onFocusChange: (focus) async{
                          if(!focus && (accountNumberCtrl.text.length == 10 && accountNetwork.value != null)){
                            await enquireAccountName(accountNumberCtrl.text);
                            return;
                          }
                        },
                        child: BDPInput(
                          labelText: 'Account Number*',
                          controller: accountNumberCtrl,
                          focusNode: accountNumberFocusNode,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return "Account number field must not be empty";
                            }
                            if(value.length != 10) return 'Account number is invalid';
                            return null;
                          },
                          onTapOutside: (event){
                            accountNumberFocusNode.unfocus();
                          },
                        ),
                      ),
                    ),
                    const VSpace(
                      height: BDPSizes.spaceBtwInputFields,
                    ),
                    BDPDropdown(
                      labelText: 'Account Network*',
                      value: accountNetwork.value,
                      onChanged: (value) async{
                        accountNetwork.value = value;
                        if(value != null && accountNumberCtrl.text.length == 10){
                          await enquireAccountName(accountNumberCtrl.text);
                        }
                      },
                      items: kTransactionNetworks,
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return "Account network field must not be empty";
                        }
                        return null;
                      },
                    ),
                    const VSpace(
                      height: BDPSizes.spaceBtwInputFields,
                    ),
                    BDPInput(
                      labelText: 'Account Name*',
                      controller: accNameCtrl,
                      enabled: false,
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return "Account name field must not be empty";
                        }
                        return null;
                      },
                      suffixIcon: transactionConsumer.getComponentLoading('nameEnquiry') ? const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ZLoader(loaderColor: BDPColors.primary,),
                        ],
                      ) : null,
                    ),
                    const VSpace(
                      height: BDPSizes.spaceBtwInputFields,
                    ),
                    BDPInput(
                      labelText: 'Description*',
                      controller: descCtrl,
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return "Description field must not be empty";
                        }
                        return null;
                      },
                    ),
                    const VSpace(
                      height: BDPSizes.spaceBtwInputFields * 4,
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BDPPrimaryButton(
                            buttonText: BDPTexts.continueButtonText,
                            onPressed: transactionConsumer.getComponentLoading('nameEnquiry')? null : (){
                              if(formKey.currentState!.validate()){
                                AppDialogUtil.showScrollableBottomSheet(
                                  context: context,
                                  builder: (context) => TransferSummaryModalContent(
                                    transferInfo: {
                                      "amount": amntCtrl.text,
                                      "accountNumber": accountNumberCtrl.text,
                                      "accountIssuer": accountNetwork.value,
                                      "accountName": accNameCtrl.text,
                                      "description": descCtrl.text,
                                      "type": "transfer"
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }

  Future<void> enquireAccountName(String accountNumber) async{
    if(!mounted) return;
    await context.read<TransactionViewModel>().enquireWalletName(
      context,
      queryParam: {
        'phoneNumber': accountNumber,
      },
    );
  }

}