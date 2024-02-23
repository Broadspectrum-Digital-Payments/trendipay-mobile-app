
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/feature/loans/presentation/widgets/loan_screen_without_loans.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../shared_widgets/common/authheaders.dart';

class LoansScreen extends StatefulWidget {
  const LoansScreen({super.key});

  @override
  State<LoansScreen> createState() => _LoansScreenState();
}

class _LoansScreenState extends State<LoansScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AuthHeader(icon: BDPImages.bdpIcon, title: 'Loans'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
        // child: const LoanScreenWithLoans(),
        child: const LoanScreenWithOutLoans(),
      ),
    );
  }
}


