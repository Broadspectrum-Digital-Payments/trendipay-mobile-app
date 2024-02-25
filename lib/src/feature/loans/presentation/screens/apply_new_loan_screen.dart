import 'dart:io';

import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/extensions/gesture_extension.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/feature/loans/presentation/view_models/loan_view_model.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/core/constants/sizes.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/form_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/styles.dart';
import '../../../../../core/utils/app_dialog_util.dart';
import '../../../../../core/utils/media_file_util.dart';
import '../../../../../core/utils/permission_util.dart';
import '../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../shared_widgets/common/v_space.dart';
import '../../../../shared_widgets/forms/bdp_input.dart';
import '../../../../shared_widgets/modals/error_modal_content.dart';


class ApplyNewLoanScreen extends StatefulWidget {
  const ApplyNewLoanScreen({super.key});

  @override
  State<ApplyNewLoanScreen> createState() => _ApplyNewLoanScreenState();
}

class _ApplyNewLoanScreenState extends State<ApplyNewLoanScreen> {
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final durationController = TextEditingController();
  final purposeController = TextEditingController();
  final amountFocusNode = FocusNode();
  final durationFocusNode = FocusNode();
  final documentFilePath = ValueNotifier<String>('');

  @override
  void dispose() {
    amountController.dispose();
    durationController.dispose();
    purposeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BDPAppBar(
        appBar: AppBar(),
        title: 'New Loan',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BDPInput(
                  labelText: 'Enter your desired loan amount',
                  controller: amountController,
                  focusNode: amountFocusNode,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Amount field must not be empty";
                    }
                    if(double.parse(value) == 0) return 'Amount field can not be 0';
                    return null;
                  },
                  keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"^\d+\.?\d{0,2}"))
                  ],
                  onTapOutside: (event){
                    amountFocusNode.unfocus();
                  },
                  helperText: 'Amount must be between GHS100 and GHS10,000',
                ),
                const VSpace(
                  height: BDPSizes.spaceBtwInputFields,
                ),
                BDPInput(
                  labelText: 'Enter repayment duration in days',
                  controller: durationController,
                  focusNode: durationFocusNode,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Duration field must not be empty";
                    }
                    if(int.parse(value) == 0) return 'Duration field can not be 0';
                    return null;
                  },
                  keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                  onTapOutside: (event){
                    durationFocusNode.unfocus();
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*$'))
                  ],
                ),
                const VSpace(
                  height: BDPSizes.spaceBtwInputFields,
                ),
                BDPInput(
                  labelText: 'Enter purpose of loan',
                  controller: purposeController,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Purpose field must not be empty";
                    }
                    return null;
                  },
                ),
                const VSpace(
                  height: 24.0,
                ),
                const FormLabel('Proof of Income'),

                const VSpace(height: 4.0),
                Container(
                  height: AppThemeUtil.height(120.0),
                  width: double.infinity,
                  padding: EdgeInsets.all(AppThemeUtil.radius(10.0)),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(AppThemeUtil.radius(12)),
                  ),
                  child: ValueListenableBuilder<String>(
                      valueListenable: documentFilePath,
                      builder: (context, documentFilePathValue, child) {
                        return documentFilePathValue.isEmpty?
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.file_upload_outlined,
                              color: Colors.grey,
                            ), // Icon
                            const VSpace(height: 8),
                            Text(
                              'Upload a proof of income document',
                              textAlign: TextAlign.center,
                              style: kRegularFontStyle.copyWith(
                                fontSize: AppThemeUtil.fontSize(16.0),
                                color: Colors.grey,
                              ),
                            ),
                            const VSpace(height: 10.0),
                            Text(
                              'Document must be in pdf/jpg/jpeg format',
                              textAlign: TextAlign.center,
                              style: kMediumFontStyle.copyWith(
                                fontSize: AppThemeUtil.fontSize(12.0),
                                color: BDPColors.brightPurple,
                              ),
                            ),
                          ],
                        )
                            :
                        ClipRRect(
                          borderRadius: BorderRadius.circular(AppThemeUtil.radius(12)),
                          child: Image.file(File(documentFilePathValue),
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                  ),
                ).onPressed(() async{
                  if(await PermissionUtil.getStoragePermission()){
                    final filePath = await MediaFileUtil.pickFile();
                    if(filePath != null){
                      documentFilePath.value = filePath;
                    }
                  }
                }),
                const VSpace(height: 24.0),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BDPPrimaryButton(
                        buttonText: 'Proceed',
                        onPressed: () async{
                          if(formKey.currentState!.validate()){
                            if(documentFilePath.value.isEmpty){
                              AppDialogUtil.popUpModal(
                                context,
                                modalContent: const ErrorModalContent(
                                  errorMessage: 'Please select proof of income',
                                ),
                              );
                              return;
                            }
                            final loanProvider = context.read<LoanViewModel>();
                            loanProvider.setLoanRequestBody = {
                              'principal': double.parse(amountController.text) * 100,
                              'time': durationController.text,
                              'documentName': 'payslip',
                              'document': documentFilePath.value,
                              'purpose': purposeController.text,
                            };
                            await loanProvider.requestAmortization(
                              context,
                              queryParams: {
                                'principal': double.parse(amountController.text) * 100,
                                'time': durationController.text,
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const VSpace(
                  height: BDPSizes.spaceBtwInputFields,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

