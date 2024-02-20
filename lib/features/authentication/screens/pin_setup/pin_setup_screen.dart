import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentiation_events.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_blocs.dart';
import 'package:bdp_payment_app/features/authentication/screens/pin_setup/widgets/pin_setup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/registration_controller.dart';


class PinSetup extends StatefulWidget {
  const PinSetup({super.key});

  @override
  State<PinSetup> createState() => _PinSetupState();
}

class _PinSetupState extends State<PinSetup> {

  AuthenticationBloc? authBloc;


  @override
  void didChangeDependencies() {
    authBloc = context.read<AuthenticationBloc>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    authBloc?.add(PinChangeEvent(value: false));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AuthHeader(icon: BDPImages.bdpIcon, title: authBloc!.state.isPinChange ? BDPTexts.pinChangeTitle : BDPTexts.pinSetupTitle,),
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
