import 'package:bdp_payment_app/common/widgets/custom_appbar/custom_appbar.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/widgets/common_widgets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../wallets/widgets/transaction_item.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appBarTitle: BDPTexts.transactionHistory,
      ),
      body: Padding(
        padding: const EdgeInsets.all(BDPSizes.defaultSpace),
        child: BlocBuilder<TransactionBlocs, TransactionStates>(
            builder: (context, state) {
          return state.loadingTransactions == true
              ? Center(
                  child: loader(loaderColor: BDPColors.primary),
                )
              : state.recentTransactions.isEmpty
                  ? const Center(
                      child: Text("you have no recent transactions"),
                    )
                  : ListView.separated(
                      itemCount: state.allTransactions.length,
                      itemBuilder: (context, index) {
                        var item = state.allTransactions[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: TransactionItem(
                              title: item.transferType?.name ?? "",
                              description: item.description ?? "",
                              date: item.formattedProcessDate ?? "",
                              time: formatTime(item.processDate),
                              amount: item.formattedAmount ?? "",
                              isSuccess: item.status == "PROCESSED"),
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                        return _buildDivider();
          },);
        }),
      ),
    );
  }
}

Widget _buildDivider() {
  return Divider(
    color: Colors.grey[300],
    thickness: 1,
    height: 0,
  );
}
