import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/extensions/gesture_extension.dart';
import 'package:bdp_payment_app/core/services/logger_service.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/sizes.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/view_models/wallet_view_model.dart';
import 'package:bdp_payment_app/src/feature/wallet/presentation/widgets/trnz_summary.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/bdp_input.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/form_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/common.dart';
import '../../../../../core/routing/app_navigator.dart';
import '../../../../../core/routing/app_route.dart';
import '../../../../../core/utils/app_dialog_util.dart';
import '../../../../../core/utils/helper_util.dart';
import '../../../../../core/view_models/user_view_model.dart';
import '../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../shared_widgets/buttons/bdp_primary_button.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../shared_widgets/common/h_space.dart';
import '../../../../shared_widgets/common/nav_bar_wrapper.dart';
import '../../../../shared_widgets/forms/bdp_dropdown.dart';
import '../../../../shared_widgets/modals/error_modal_content.dart';
import '../../../auth/presentation/view_models/otp_view_model.dart';
import '../../../transaction_history/presentation/view_models/transaction_view_model.dart';

class TopUpWalletScreen extends StatefulWidget {
  const TopUpWalletScreen({super.key, required this.transactionType});

  final String transactionType;

  @override
  State<TopUpWalletScreen> createState() => _TopUpWalletScreenState();
}

class _TopUpWalletScreenState extends State<TopUpWalletScreen> {

  String screenTitle = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    String transactionType = widget.transactionType;
    String title = (transactionType == 'payments') ? 'Make Payment' : 'Make Purchase';
    setState(() {
      screenTitle = title;
    });
  }

  final formKey = GlobalKey<FormState>();
  final amountCtrl = TextEditingController();
  final amountFocusNode = FocusNode();
  final paymentMethod = ValueNotifier<String?>(null);

  final phoneCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final phoneFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final accountNetwork = ValueNotifier<String?>(null);

  @override
  void dispose() {
    amountCtrl.dispose();
    phoneCtrl.dispose();
    descCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BDPAppBar(
        appBar: AppBar(),
        title: screenTitle,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppThemeUtil.radius(BDPSizes.defaultSpace)),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  BDPTexts.topupTitle,
                  style: kMediumFontStyle.copyWith(
                    fontSize: AppThemeUtil.fontSize(20),
                    color: BDPColors.black,
                  ),
                ),
                const VSpace(height: 40),
                const FormLabel('Amount'),
                BDPInput(
                  controller: amountCtrl,
                  focusNode: amountFocusNode,
                  keyboardType: TextInputType.number,
                  labelText: 'Enter amount',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Amount field must not be empty";
                    }
                    if (double.parse(value) == 0) {
                      return 'Amount field must not be 0';
                    }
                    return null;
                  },
                  onTapOutside: (event) {
                    amountFocusNode.unfocus();
                  },
                ),
                const VSpace(height: BDPSizes.spaceBtwInputFields),
                const FormLabel('Account Number'),
                BDPInput(
                  labelText: 'Enter phone number',
                  controller: phoneCtrl,
                  focusNode: phoneFocusNode,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number field must not be empty";
                    }
                    if (value.length != 10) return 'Phone number is invalid';
                    return null;
                  },
                  onTapOutside: (event) {
                    phoneFocusNode.unfocus();
                  },
                ),
                const VSpace(height: BDPSizes.spaceBtwInputFields),
                const FormLabel('Payment Method'),
                BDPDropdown(
                  labelText: 'Select mobile network',
                  value: accountNetwork.value,
                  onChanged: (value) async {
                    accountNetwork.value = value;
                    if (value != null && phoneCtrl.text.length == 10) {
                      await enquireAccountName(phoneCtrl.text);
                    }
                  },
                  items: kMobileNetworks,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Mobile network field must not be empty";
                    }
                    return null;
                  },
                ),
                const VSpace(height: BDPSizes.spaceBtwInputFields),
                const FormLabel('Description'),
                BDPInput(
                  labelText: 'Description',
                  controller: descCtrl,
                  focusNode: descriptionFocusNode,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Description field must not be empty";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBarWrapper(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BDPPrimaryButton(
              buttonText: 'Continue',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (accountNetwork.value == null) {
                    AppDialogUtil.popUpModal(
                      context,
                      modalContent: const ErrorModalContent(
                        errorMessage: 'Select payment method to continue.',
                      ),
                    );
                    return;
                  }
                  AppDialogUtil.showScrollableBottomSheet(
                    context: context,
                    builder: (context) => TrnzSummary(
                      purchaseInfo: {
                        'amount': amountCtrl.text ,
                        "accountNumber": phoneCtrl.text,
                        'accountIssuer': accountNetwork.value,
                        "description": descCtrl.text,
                      },
                      transactionType: widget.transactionType,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> enquireAccountName(String accountNumber) async {
    if (!mounted) return;
    await context.read<TransactionViewModel>().enquireWalletName(
      context,
      queryParam: {
        'phoneNumber': accountNumber,
      },
    );
  }
}
