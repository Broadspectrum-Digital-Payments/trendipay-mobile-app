import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/nav_bar_wrapper.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/bdp_dropdown.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/bdp_input.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/form_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/styles.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../../core/utils/app_theme_util.dart';
import '../../../../../core/view_models/base_view.dart';
import '../../../../shared_widgets/base/draggable_bottom_sheet.dart';
import '../../../../shared_widgets/common/h_space.dart';
import '../../../../shared_widgets/common/v_space.dart';
import '../../../../shared_widgets/common/zloader.dart';
import '../../../../shared_widgets/modals/draggable_bottom_sheet_content.dart';
import '../../../auth/presentation/widgets/checkbox.dart';
import '../../../history/presentation/view_models/transaction_view_model.dart';

class AddWalletModalContent extends StatefulWidget {
  const AddWalletModalContent({super.key});

  @override
  State<AddWalletModalContent> createState() => _AddWalletModalContentState();
}

class _AddWalletModalContentState extends State<AddWalletModalContent> {
  final formKey = GlobalKey<FormState>();
  final walletNameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final phoneFocusNode = FocusNode();
  final accountNetwork = ValueNotifier<String?>(null);
  final futureWithdrawal = ValueNotifier<bool>(false);

  @override
  void dispose() {
    walletNameCtrl.dispose();
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableBottomSheet(
      initialChildSize: 0.75,
      minChildSize: 0.48,
      maxChildSize: 0.75,
      builder: (context, scrollController){
        return DraggableBottomSheetContent(
          draggableKey: GlobalKey(),
          scrollController: scrollController,
          title: 'Add a Wallet',
          content: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
              child: Form(
                key: formKey,
                child: BaseView<TransactionViewModel>(
                  builder: (context, transactionConsumer, child) {
                    walletNameCtrl.text = transactionConsumer.getEnquiryResult?.name?? '';
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VSpace(height: 26.0),
                        const FormLabel('Mobile Number'),
                        FocusScope(
                          child: Focus(
                            onFocusChange: (focus) async{
                              if(!focus && (phoneCtrl.text.isNotEmpty && phoneCtrl.text.length == 10)){
                                await context.read<TransactionViewModel>().enquireWalletName(
                                  context,
                                  queryParam: {
                                    'phoneNumber': phoneCtrl.text,
                                  },
                                );
                              }
                            },
                            child: BDPInput(
                              labelText: 'Enter phone number',
                              controller: phoneCtrl,
                              focusNode: phoneFocusNode,
                              keyboardType: TextInputType.number,
                              validator: (value){
                                if (value == null || value.isEmpty) {
                                  return "Phone number field must not be empty";
                                }
                                if(value.length != 10) return 'Phone number is invalid';
                                return null;
                              },
                              onTapOutside: (event){
                                phoneFocusNode.unfocus();
                              },
                            ),
                          ),
                        ),
                        const VSpace(height: BDPSizes.spaceBtwInputFields),
                        const FormLabel('Mobile Network'),
                        BDPDropdown(
                          labelText: 'Select mobile network',
                          value: accountNetwork.value,
                          onChanged: (value){
                            accountNetwork.value = value;
                          },
                          items: kMobileNetworks,
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return "Mobile network field must not be empty";
                            }
                            return null;
                          },
                        ),

                        const VSpace(height: BDPSizes.spaceBtwInputFields),
                        const FormLabel('Name'),
                        BDPInput(
                          labelText: 'Enter wallet name',
                          controller: walletNameCtrl,
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

                        const VSpace(height: BDPSizes.spaceBtwInputFields),
                        Row(
                          children: [
                            ValueListenableBuilder<bool>(
                              valueListenable: futureWithdrawal,
                              builder: (context, futureWithdrawalValue, child) {
                                return ARCheckbox(
                                  value: futureWithdrawalValue,
                                  onChanged: (value){
                                    futureWithdrawal.value = value?? false;
                                  },
                                );
                              }
                            ),
                            const HSpace(width: 4.0),
                            Text(
                              BDPTexts.allowWallets,
                              style: kRegularFontStyle.copyWith(
                                fontSize: AppThemeUtil.fontSize(12),
                                color: BDPColors.primary,
                              ),
                            ),
                          ],
                        ),
                        const VSpace(height: 32),

                      ],
                    );
                  }
                ),
              ),
            ),
          ),
          bottomNavigationBar: NavBarWrapper(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                BaseView<TransactionViewModel>(
                  builder: (context, transactionConsumer, child) {
                    return BDPPrimaryButton(
                      buttonText: BDPTexts.saveWallet,
                      imageIconFile: BDPImages.saveIcon,
                      onPressed: transactionConsumer.getComponentLoading('nameEnquiry')? null :  (){

                      },
                    );
                  }
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
