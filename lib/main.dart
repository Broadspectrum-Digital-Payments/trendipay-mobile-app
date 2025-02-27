import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/routing/app_navigator.dart';
import 'core/routing/app_route.dart';
import 'core/services/git_it_service_locator.dart';
import 'core/view_models/user_view_model.dart';
import 'src/feature/auth/presentation/view_models/otp_view_model.dart';
import 'src/feature/loans/presentation/view_models/loan_view_model.dart';
import 'src/feature/transaction_history/presentation/view_models/transaction_view_model.dart';
import 'src/feature/wallet/presentation/view_models/wallet_view_model.dart';
import 'dart:io';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async{
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setUpGetItServiceLocator();

  preLoaders();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserViewModel>(create: (context) => UserViewModel()),
        ChangeNotifierProvider<OtpViewModel>(create: (context) => OtpViewModel()),
        ChangeNotifierProvider<TransactionViewModel>(create: (context) => TransactionViewModel()),
        ChangeNotifierProvider<WalletViewModel>(create: (context) => WalletViewModel()),
        ChangeNotifierProvider<LoanViewModel>(create: (context) => LoanViewModel()),
      ],
      child: const BDPApp(),
    ),
  );
}


class BDPApp extends StatelessWidget {
  const BDPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemeUtil.lightTheme,
            initialRoute: AppRoute.splashScreen,
            onGenerateRoute: AppNavigator.generateRoute,
            navigatorKey: AppNavigator.navigatorKey,
          );
        }
    );
  }
}


Future<void> preLoaders() async{

}