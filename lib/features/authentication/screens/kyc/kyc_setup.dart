import 'package:bdp_payment_app/features/authentication/screens/kyc/widgets/kyc_tabs/cardinfo.dart';
import 'package:bdp_payment_app/features/authentication/screens/kyc/widgets/kyc_tabs/personal_info.dart';
import 'package:bdp_payment_app/utils/constants/image_strings.dart';
import 'package:bdp_payment_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../utils/constants/text_strings.dart';

class KYCSetup extends StatelessWidget {
  const KYCSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.kycSetup),
          automaticallyImplyLeading: false,
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(BDPSizes.defaultSpace),
            child: Column(
              children: [
                const TabBar(
                  tabs: [
                    Tab(text: "Personal Info"), // First tab
                    Tab(text: 'Card Info'), // Second tab
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 485, // Adjust the height as needed
                  child: TabBarView(
                    children: [PersonalInfo(), CardInfo()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
