
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/feature/loans/presentation/widgets/loan_screen_without_loans.dart';
import 'package:flutter/material.dart';
import '../../../../shared_widgets/base/bdp_appbar.dart';

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
      appBar: BDPAppBar(
        appBar: AppBar(),
        title: 'Loans',
        hasLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
        // child: const LoanScreenWithLoans(),
        child: const LoanScreenWithOutLoans(),
      ),
    );
  }
}


