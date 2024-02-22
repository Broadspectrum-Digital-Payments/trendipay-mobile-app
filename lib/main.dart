import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'common/config/providers.dart';
import 'common/constants/global_constants.dart';
import 'core/routing/app_navigator.dart';
import 'core/routing/app_route.dart';
import 'core/services/git_it_service_locator.dart';
import 'core/view_models/user_view_model.dart';
import 'src/feature/auth/presentation/view_models/otp_view_model.dart';
import 'src/feature/transaction/presentation/view_models/transaction_view_model.dart';
import 'src/feature/wallet/presentation/view_models/wallet_view_model.dart';

void main() async{
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
          return MultiBlocProvider(
            providers: providers,
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppThemeUtil.lightTheme,
              initialRoute: AppRoute.splashScreen,
              onGenerateRoute: AppNavigator.generateRoute,
              navigatorKey: AppNavigator.navigatorKey,
            ),
          );
        }
    );
  }
}


Future<void> preLoaders() async{
  GlobalConstants().init();
}