import 'package:bdp_payment_app/core/view_models/base_view.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:bdp_payment_app/src/feature/kyc/presentation/widgets/card_info_tab.dart';
import 'package:bdp_payment_app/src/feature/kyc/presentation/widgets/personal_info_tab.dart';
import 'package:bdp_payment_app/core/constants/sizes.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';
import '../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../../core/constants/text_strings.dart';

class KYCSetupScreen extends StatefulWidget {
  const KYCSetupScreen({super.key});

  @override
  State<KYCSetupScreen> createState() => _KYCSetupScreenState();
}

class _KYCSetupScreenState extends State<KYCSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BaseView<UserViewModel>(
        builder: (context, userConsumer, child) {
          return PopScope(
            canPop: userConsumer.getUser.uploadedAllKycFiles,
            child: Scaffold(
              appBar: BDPAppBar(
                appBar: AppBar(),
                title: BDPTexts.kycSetup,
                hasLeading: userConsumer.getUser.uploadedAllKycFiles,
              ),
              body: child!
            ),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(BDPSizes.defaultSpace),
              child: Theme(
                data: ThemeData(
                  highlightColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                ),
                child: const TabBar(
                  tabs: [
                    Tab(text: "Personal Info"), // First tab
                    Tab(text: 'Card Info'), // Second tab
                  ],
                ),
              ),
            ),
            const VSpace(height: 16),
            const Expanded(
              child: TabBarView(
                children: [PersonalInfoTab(), CardInfoTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
