
import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/extensions/gesture_extension.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/view_models/base_view.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:bdp_payment_app/src/feature/loans/presentation/view_models/loan_view_model.dart';
import 'package:bdp_payment_app/src/feature/loans/presentation/widgets/loan_screen_without_loans.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/routing/app_navigator.dart';
import '../../../../../core/routing/app_route.dart';
import '../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../shared_widgets/common/zloader.dart';
import '../widgets/loan_screen_with_loans.dart';

class LoansScreen extends StatefulWidget {
  const LoansScreen({super.key});

  @override
  State<LoansScreen> createState() => _LoansScreenState();
}

class _LoansScreenState extends State<LoansScreen> {

  Future<void> fetchLoans() async{
    if(!mounted) return;
    await context.read<LoanViewModel>().fetchLoans(
      context,
      userExternalId: context.read<UserViewModel>().getUser.externalId?? '',
      queryParams: {},
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await fetchLoans();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<LoanViewModel>(
      builder: (context, loanConsumer, child) {
        if(loanConsumer.getComponentLoading('loans') && loanConsumer.getLoans.isEmpty){
          return const Center(
            child: ZLoader(loaderColor: BDPColors.primary, size: 32),
          );
        }
        if(loanConsumer.isComponentErrorType('loans')){
          return Center(
            child: Text(
              loanConsumer.componentErrorType?['error']?? '',
              style: kRegularFontStyle.copyWith(
                fontSize: AppThemeUtil.fontSize(14.0),
                color: BDPColors.dark90,
              ),
            ),
          );
        }

        return Scaffold(
          appBar: BDPAppBar(
            appBar: AppBar(),
            title: 'Loans',
            hasLeading: false,
            actions: loanConsumer.getLoans.isEmpty ? null : [
              Container(
                height: AppThemeUtil.height(40),
                width: AppThemeUtil.width(50),
                margin: EdgeInsets.only(right: AppThemeUtil.width(20)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppThemeUtil.radius(20)),
                    color: BDPColors.primary
                ),
                child: Icon(
                  Icons.add, color:
                BDPColors.white,
                  size: AppThemeUtil.radius(16.0),
                ),
              ).onPressed((){
                AppNavigator.pushNamed(context, AppRoute.applyNewLoanScreen);
              })
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
            child: loanConsumer.getLoans.isEmpty?
            const LoanScreenWithOutLoans()
                :
            LoanScreenWithLoans(loans: loanConsumer.getLoans,),
          ),
        );
      }
    );
  }
}


