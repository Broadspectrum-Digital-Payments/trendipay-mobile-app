import 'package:bdp_payment_app/features/authentication/screens/pin_setup/widgets/pin_setup_form.dart';
import 'package:flutter/material.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';


class PinSetup extends StatelessWidget {
  const PinSetup({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.pinSetupTitle,),
        automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: BDPSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Text(BDPTexts.pinSetupText , textAlign: TextAlign.center,),
              /// FORM
              PinSetupForm(),
            ],
          ),
        ),
      ),
    );
  }
}
