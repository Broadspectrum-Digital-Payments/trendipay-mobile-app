
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_blocs.dart';
import 'package:bdp_payment_app/features/authentication/screens/phonenumber_authentication/phone_number_blocs/phone_number_bloc.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/history/transaction_blocs/transaction_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  BlocProvider<PhoneNumberBlocs>(create: (context)=> PhoneNumberBlocs()),
  BlocProvider<AuthenticationBloc>(create: (context)=> AuthenticationBloc()),
  BlocProvider<TransactionBlocs>(create: (context)=> TransactionBlocs())
];