import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/extensions/gesture_extension.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/sizes.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/bdp_input.dart';
import 'package:bdp_payment_app/src/shared_widgets/forms/form_label.dart';
import 'package:flutter/material.dart';
import '../../../../../core/routing/app_route.dart';
import '../../../../shared_widgets/buttons/bdp_primary_button.dart';
import '../../../../shared_widgets/common/authheaders.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../shared_widgets/common/h_space.dart';
import '../../../../shared_widgets/common/nav_bar_wrapper.dart';


class TopUpWalletScreen extends StatefulWidget {
  const TopUpWalletScreen({super.key});

  @override
  State<TopUpWalletScreen> createState() => _TopUpWalletScreenState();
}

class _TopUpWalletScreenState extends State<TopUpWalletScreen> {
  final formKey = GlobalKey<FormState>();
  final amountCtrl = TextEditingController();
  final amountFocusNode = FocusNode();
  
  @override
  void dispose() {
    amountCtrl.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.topUp),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 24),
          onPressed: () => AppNavigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppThemeUtil.radius(BDPSizes.defaultSpace)),
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
              Form(
                key: formKey,
                child: BDPInput(
                  controller: amountCtrl,
                  focusNode: amountFocusNode,
                  labelText: 'Enter amount',
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Amount field must not be empty";
                    }
                    if(double.parse(value) == 0) return 'Amount field must not be 0';
                    return null;
                  },
                  onTapOutside: (event) {
                    amountFocusNode.unfocus();
                  },
                ),
              ),
              const VSpace(
                height: BDPSizes.spaceBtwSections,
              ),

              const FormLabel(BDPTexts.paymentMethod),
              const VSpace(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Keren Gyamfi',
                          style: kMediumFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(12),
                            color: BDPColors.grey,
                            height: AppThemeUtil.getLineHeight(16.0, 12),
                          ),
                        ),
                        Text(
                          'MTN',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(10),
                            color: BDPColors.grey,
                            height: AppThemeUtil.getLineHeight(14.0, 10)
                          ),
                        ),
                        Text(
                          '+233245678920',
                          style: kRegularFontStyle.copyWith(
                            fontSize: AppThemeUtil.fontSize(10),
                            color: BDPColors.grey,
                            height: AppThemeUtil.getLineHeight(14.0, 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Change',
                        style: kMediumFontStyle.copyWith(
                          fontSize: AppThemeUtil.fontSize(12),
                          color: BDPColors.brightPurple,
                          height: AppThemeUtil.getLineHeight(16.0, 12),
                        ),
                      ),
                      const HSpace(width: 4.0),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: AppThemeUtil.radius(14.0),
                        color: BDPColors.brightPurple,
                      ),
                    ],
                  ).onPressed((){
                    AppNavigator.pop(context);
                  }),
                ],
              ),
            ],
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
              onPressed: (){
                AppNavigator.pushNamed(context, AppRoute.confirmTopUpWalletScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}