import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/constants/styles.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/app_theme_util.dart';
import '../../../../shared_widgets/base/draggable_bottom_sheet.dart';
import '../../../../shared_widgets/common/v_space.dart';
import '../../../../shared_widgets/modals/draggable_bottom_sheet_content.dart';

class AuthAgreementModalContent extends StatefulWidget {
  const AuthAgreementModalContent({super.key});

  @override
  State<AuthAgreementModalContent> createState() => _AuthAgreementModalContentState();
}

class _AuthAgreementModalContentState extends State<AuthAgreementModalContent> {
  final isAgreed = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return DraggableBottomSheet(
      initialChildSize: 1.0,
      minChildSize: 1.0,
      closeModal: false,
      builder: (context, scrollController){
        return DraggableBottomSheetContent(
          draggableKey: GlobalKey(),
          scrollController: scrollController,
          goBack: () => AppNavigator.pop(context),
          title: 'Legal Agreements',
          content: ListView(
            shrinkWrap: true,
            controller: scrollController,
            padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
            children: [
              const VSpace(height: 26.0),
              Text(
                'Terms and Conditions',
                style: kMediumFontStyle.copyWith(
                  fontSize: AppThemeUtil.fontSize(16),
                  color: BDPColors.dark90,
                ),
              ),
              const VSpace(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: AppThemeUtil.width(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Bullet(
                      number: '1.',
                      copy: 'Acceptance of Terms: By accessing or using the [Finance App] (the "App"), you agree to be bound by these Terms and Conditions, all applicable laws, and regulations, and agree that you are responsible for compliance with any applicable local laws.',
                    ),
                    const Bullet(
                      number: '2.',
                      copy: 'Use of the App: You may use the App solely for lawful purposes and in accordance with these Terms. You agree not to use the App:',
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppThemeUtil.width(20)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Bullet(
                            number: '• ',
                            copy: 'In any way that violates any applicable law or regulation.',
                          ),
                          Bullet(
                            number: '• ',
                            copy: 'To engage in any fraudulent activity or unlawful conduct.',
                          ),
                          Bullet(
                            number: '• ',
                            copy: 'To transmit any harmful or malicious code, viruses, or similar software.',
                          ),
                        ],
                      ),
                    ),
                    const Bullet(
                      number: '3.',
                      copy: 'Account Registration: To access certain features of the App, you may be required to register for an account. You agree to provide accurate and complete information during the registration process and to update such information to keep it accurate and current.',
                    ),
                    const Bullet(
                      number: '4.',
                      copy: 'Financial Transactions: The App allows you to perform various financial transactions, including money transfers and loan requests. By initiating such transactions, you agree to abide by the terms and conditions governing each transaction and to provide accurate and truthful information.',
                    ),
                    const Bullet(
                      number: '5.',
                      copy: 'User Responsibilities: You are solely responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account or any other breach of security.',
                    ),
                    const Bullet(
                      number: '6.',
                      copy: 'Limitation of Liability:In no event shall [Finance App] or its affiliates be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in any way connected with the use of the App or any information obtained from the App.',
                    ),
                  ],
                ),
              ),
              const VSpace(height: 20.0),
              Text(
                'Privacy Policy',
                style: kMediumFontStyle.copyWith(
                  fontSize: AppThemeUtil.fontSize(16),
                  color: BDPColors.dark90,
                ),
              ),
              const VSpace(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: AppThemeUtil.width(4)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Bullet(
                      number: '1.',
                      copy: 'Information Collection:[Finance App] collects personal information from users in order to provide financial services and improve the user experience. This may include information such as name, contact details, financial information, and transaction history.',
                    ),
                    Bullet(
                      number: '2.',
                      copy: 'Use of Information:The information collected may be used to process transactions, provide customer support, improve products and services, and comply with legal and regulatory requirements. [Finance App] does not sell or rent personal information to third parties.',
                    ),
                    Bullet(
                      number: '3.',
                      copy: 'Data Security:[Finance App] employs industry-standard security measures to protect the confidentiality and integrity of user data. However, no method of transmission over the internet or electronic storage is completely secure, and [Finance App] cannot guarantee absolute security.',
                    ),
                    Bullet(
                      number: '4.',
                      copy: 'Third-Party Services:[Finance App] may use third-party service providers to facilitate certain functions, such as payment processing and data analysis. These providers may have access to personal information but are contractually obligated to use it only for the purposes of providing services to [Finance App].',
                    ),
                    Bullet(
                      number: '5.',
                      copy: 'User Rights:Users have the right to access, correct, or delete their personal information, as well as the right to object to or restrict certain processing activities. Requests should be submitted to [Finance App] in writing.',
                    ),
                  ],
                ),
              ),
              const VSpace(height: 20.0),
              Text(
                'Acceptance',
                style: kMediumFontStyle.copyWith(
                  fontSize: AppThemeUtil.fontSize(16),
                  color: BDPColors.dark90,
                ),
              ),
              const VSpace(height: 20.0),
              Text(
                'By clicking logging in or signing up, the user acknowledges that they have read and understood the terms and conditions of this Agreement and agree to be bound by its provisions.',
                style: kRegularFontStyle.copyWith(
                  fontSize: AppThemeUtil.fontSize(16),
                  color: BDPColors.grey,
                ),
              ),

              // const VSpace(height: 20.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     ValueListenableBuilder<bool>(
              //       valueListenable: isAgreed,
              //       builder: (context, isAgreedValue, child) {
              //         return ARCheckbox(
              //           value: isAgreedValue,
              //           onChanged: (value){
              //             isAgreed.value = value?? false;
              //           },
              //         );
              //       },
              //     ),
              //     const HSpace(width: 4.0),
              //     Flexible(
              //       child: Text(
              //         'I Agree',
              //         style: kMediumFontStyle.copyWith(
              //             fontSize: AppThemeUtil.fontSize(14),
              //             color: BDPColors.primary
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              const VSpace(height: 32.0),

            ],
          ),
        );
      },
    );
  }
}


class Bullet extends StatelessWidget {
  const Bullet({super.key, required this.number, required this.copy,});

  final String number;
  final String copy;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: kRegularFontStyle.copyWith(
            fontSize: AppThemeUtil.fontSize(16.0),
            color: BDPColors.grey,
          ),
        ),
        const HSpace(width: 4.0),
        Flexible(
          child: Text(
            copy,
            style: kRegularFontStyle.copyWith(
              fontSize: AppThemeUtil.fontSize(16.0),
              color: BDPColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
