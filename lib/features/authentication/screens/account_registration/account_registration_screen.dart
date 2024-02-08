import 'package:bdp_payment_app/features/authentication/screens/account_registration/widgets/account_registration_form.dart';
import 'package:flutter/material.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';


class AccountRegistration extends StatelessWidget {
  const AccountRegistration({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.accountRegistration,),
        automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: BDPSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Text(BDPTexts.accountRegistrationText, textAlign: TextAlign.center,style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),),
              /// FORM
              AccountRegistrationForm(),
            ],
          ),
        ),
      ),
    );
  }
}
