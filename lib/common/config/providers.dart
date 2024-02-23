
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallet_blocs/wallet_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  BlocProvider<TransferBloc>(create: (context)=> TransferBloc()),
  BlocProvider<WalletBloc>(create: (context)=> WalletBloc()),
];