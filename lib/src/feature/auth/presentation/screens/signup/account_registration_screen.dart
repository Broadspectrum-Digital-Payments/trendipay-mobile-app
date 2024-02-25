import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/routing/app_route.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/view_models/otp_view_model.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/bdp_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/constants/common.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/utils/app_theme_util.dart';
import '../../../../../../core/utils/input_formatter_util.dart';
import '../../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../../../core/constants/text_strings.dart';


class AccountRegistrationScreen extends StatefulWidget {
  const AccountRegistrationScreen({super.key});

  @override
  State<AccountRegistrationScreen> createState() => _AccountRegistrationScreenState();
}

class _AccountRegistrationScreenState extends State<AccountRegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final ghanaCardCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final phoneFocusNode = FocusNode();
  final isPhoneMobileMoney = ValueNotifier<bool>(false);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneCtrl.text = context.read<OtpViewModel>().getOtpRequestBody['phoneNumber']?? '';
    });
    super.initState();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    ghanaCardCtrl.dispose();
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BDPAppBar(
        appBar: AppBar(),
        title: 'Account Registration',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
          child: Column(
            children: [
              Text(BDPTexts.accountRegistrationText,
                textAlign: TextAlign.center,
                style: kRegularFontStyle.copyWith(
                fontSize: AppThemeUtil.radius(16),
                  color: BDPColors.dark90,
              ),),

              Form(
                key: formKey,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: BDPSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      BDPInput(
                        controller: nameCtrl,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "Username field must not be empty";
                          }
                          return null;
                        },
                        labelText: BDPTexts.fullName,
                        textCapitalization: TextCapitalization.words,
                      ),
                      const VSpace(
                        height: BDPSizes.spaceBtwInputFields,
                      ),
                      BDPInput(
                        controller: ghanaCardCtrl,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "Ghana card field must not be empty";
                          }
                          return null;
                        },
                        textCapitalization: TextCapitalization.characters,
                        labelText: 'Enter your ID number (GHA-xxxxxxxxx-x)',
                        inputFormatters: InputFormatterUtil.maskInput(
                          mask: '###-#########-#',
                          filter: { "#": RegExp(r'[0-9A-Z]') },
                        ),
                      ),
                      const VSpace(
                        height: BDPSizes.spaceBtwInputFields,
                      ),
                      BDPInput(
                        controller: phoneCtrl,
                        focusNode: phoneFocusNode,
                        enabled: false,
                        labelText: BDPTexts.phoneNo,
                        keyboardType: TextInputType.phone,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "Phone field must not be empty";
                          }
                          return null;
                        },
                        onTapOutside: (event){
                          phoneFocusNode.unfocus();
                        },
                      ),
                      // const VSpace(
                      //   height: BDPSizes.spaceBtwItems,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     ValueListenableBuilder<bool>(
                      //       valueListenable: isPhoneMobileMoney,
                      //       builder: (context, isPhoneMobileMoneyValue, child) {
                      //         return ARCheckbox(
                      //           value: isPhoneMobileMoneyValue,
                      //           onChanged: (value){
                      //             isPhoneMobileMoney.value = value?? false;
                      //           },
                      //         );
                      //       },
                      //     ),
                      //     const Flexible(
                      //       child: Text(
                      //         BDPTexts.mNmM,
                      //         style: TextStyle(
                      //             fontSize: 12,
                      //             color: BDPColors.primary
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const VSpace(height: 24.0),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BDPPrimaryButton(
                            buttonText: BDPTexts.next,
                            onPressed: (){
                              if (formKey.currentState!.validate()) {
                                context.read<UserViewModel>().setSignupRequestBody = {
                                  "phoneNumber": phoneCtrl.text,
                                  "name": nameCtrl.text,
                                  "ghanaCardNumber": ghanaCardCtrl.text,
                                  "otp": context.read<OtpViewModel>().getOtpRequestBody['otp']?? '',
                                  'isPhoneMobileMoney': isPhoneMobileMoney.value,
                                };
                                AppNavigator.pushNamed(context, AppRoute.pinSetupScreen);
                              }
                            },
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
