import 'package:bdp_payment_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:bdp_payment_app/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../common/constants/general_repository.dart';
import '../../../../common/constants/global_constants.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.loginTitle),
        automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: BDPSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              BDPLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
