import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/view_models/base_view.dart';
import 'package:bdp_payment_app/src/feature/transaction_history/presentation/view_models/transaction_view_model.dart';
import 'package:bdp_payment_app/src/feature/transaction_history/presentation/widgets/transaction_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../../core/utils/app_theme_util.dart';
import '../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../shared_widgets/common/zloader.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await context.read<TransactionViewModel>().fetchTransactions(
        context,
        loadingComponent: 'history',
        queryParam: {
          'pageSize': kPageSize,
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BDPAppBar(
        appBar: AppBar(),
        title: BDPTexts.transactionHistory,
        hasLeading: false,
      ),
      body: BaseView<TransactionViewModel>(
        builder: (context, transactionConsumer, child) {
          if(transactionConsumer.getComponentLoading('history') && transactionConsumer.getTransactions.isEmpty){
            return const Center(
              child: ZLoader(loaderColor: BDPColors.primary, size: 32),
            );
          }
          if(transactionConsumer.isComponentErrorType('history')){
            return Center(
              child: Text(
                transactionConsumer.componentErrorType?['error']?? '',
                style: kRegularFontStyle.copyWith(
                  fontSize: AppThemeUtil.fontSize(14.0),
                  color: BDPColors.dark90,
                ),
              ),
            );
          }
          if(transactionConsumer.getTransactions.isEmpty){
            return Center(
              child: Text(
                "You have no recent transactions",
                style: kRegularFontStyle.copyWith(
                  fontSize: AppThemeUtil.fontSize(14.0),
                  color: BDPColors.dark90,
                ),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
            child: TransactionListView(
              transactions: transactionConsumer.getTransactions,
              padding: EdgeInsets.symmetric(vertical: AppThemeUtil.height(24)),
            ),
          );
        }
      ),
    );
  }
}


