import 'package:bdp_payment_app/common/widgets/custom_appbar/custom_appbar.dart';
import 'package:bdp_payment_app/core/view_models/base_view.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/history_widgets/history_widgets.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_states.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_controller/transaction_controller.dart';
import 'package:bdp_payment_app/src/feature/history/presentation/view_models/transaction_view_model.dart';
import 'package:bdp_payment_app/src/feature/history/presentation/widgets/transaction_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../shared_widgets/common/authheaders.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late TransactionHistoryController controller;
  TransactionBlocs blocs = TransactionBlocs();
  @override
  void initState() {
    controller = TransactionHistoryController(context: context);
    blocs = context.read<TransactionBlocs>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.transactionHistory),
        automaticallyImplyLeading: false,
      ),
      body: BaseView<TransactionViewModel>(
        builder: (context, transactionConsumer, child) {
          return TransactionListView(
            transactions: transactionConsumer.getTransactions,
          );
        }
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(BDPSizes.defaultSpace),
      //   child: BlocBuilder<TransactionBlocs, TransactionStates>(
      //       builder: (context, state) {
      //     return state.loadingTransactions == true
      //         ? Center(
      //             child: loader(loaderColor: BDPColors.primary),
      //           )
      //         : state.recentTransactions.isEmpty
      //             ? const Center(
      //       // this allows you to have recent transactions
      //                 child: Text("you have no recent transactions"),
      //               )
      //             : ListView.separated(
      //                 itemCount: state.allTransactions.length,
      //                 itemBuilder: (context, index) {
      //                   var item = state.allTransactions[index];
      //                   return Padding(
      //                     padding: EdgeInsets.symmetric(vertical: 8.h),
      //                     child: GestureDetector(
      //                       onTap: () {
      //                         controller.loadTransactionById(item.id!);
      //                         _showHistoryModal();
      //                       },
      //                       child: TransactionItem(
      //                           title: item.transferType?.name ?? "",
      //                           description: item.description ?? "",
      //                           date: item.formattedProcessDate ?? "",
      //                           time: formatTime(item.processDate),
      //                           amount: item.formattedAmount ?? "",
      //                           isSuccess: item.status == "PROCESSED"),
      //                     ),
      //                   );
      //                 },
      //                 separatorBuilder: (BuildContext context, int index) {
      //                   return buildDivider();
      //                 },
      //               );
      //   }),
      // ),
    );
  }

  void _showHistoryModal() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return BlocBuilder<TransactionBlocs, TransactionStates>(
              builder: (context, state) {
            return reusableHistoryData(
                history: state.currentHistory,
                loading: state.loadingTransactions == true);
          });
        });
  }
}


