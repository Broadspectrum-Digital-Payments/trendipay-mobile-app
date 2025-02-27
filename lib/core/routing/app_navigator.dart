import 'package:bdp_payment_app/src/feature/auth/presentation/screens/signup/pin_success_screen.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/screens/signup/phone_number_screen.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/screens/signup/pin_setup_screen.dart';
import 'package:bdp_payment_app/src/feature/kyc/presentation/screens/kyc_setup_screen.dart';
import 'package:bdp_payment_app/src/feature/loans/domain/models/amortize/amortize_model.dart';
import 'package:bdp_payment_app/src/feature/profile/presentation/screens/nfc_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../src/feature/loans/domain/models/loan/loan_model.dart';
import '../../src/feature/transaction_history/presentation/screens/loan_transaction_detail_screen.dart';
import '../../src/feature/loans/presentation/screens/apply_new_loan_screen.dart';
import '../../src/feature/loans/presentation/screens/loan_review_screen.dart';
import '../../src/feature/loans/presentation/screens/loan_summary_screen.dart';
import '../../src/feature/profile/presentation/screens/settings_screen.dart';
import '../../src/feature/auth/presentation/screens/login/login_screen.dart';
import '../../src/feature/auth/presentation/screens/signup/account_registration_screen.dart';
import '../../src/feature/auth/presentation/screens/signup/otp_verify_screen.dart';
import '../../src/feature/transaction_history/presentation/screens/transfer_success_screen.dart';
import '../../src/feature/home/presentation/view_models/bottom_nav_view_model.dart';
import '../../src/feature/onboarding/presentation/screens/onboarding_screen.dart';
import '../../src/feature/onboarding/presentation/screens/splash_screen.dart';
import '../../src/feature/home/presentation/screens/navigation_menu.dart';
import '../../src/feature/transaction_history/presentation/screens/transfer_info_screen.dart';
import '../../src/feature/wallet/presentation/screens/confirm_top_up_wallet_screen.dart';
import '../../src/feature/wallet/presentation/screens/select_wallet_screen.dart';
import '../../src/feature/wallet/presentation/screens/top-up_wallet_screen.dart';
import '../../src/feature/wallet/presentation/screens/top_up_wallet_success_screen.dart';
import '../constants/colors.dart';
import 'app_route.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoute.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case AppRoute.loginScreen:
        return PageRouteBuilder(
            settings: settings,
            transitionDuration: const Duration(milliseconds: 800),
            pageBuilder: (_, __, ___) => const LoginScreen(),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child)
        );

      case AppRoute.onboardingScreen:
        return PageRouteBuilder(
            settings: settings,
            transitionDuration: const Duration(milliseconds: 800),
            pageBuilder: (_, __, ___) => const OnboardingScreen(),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child)
        );


      case AppRoute.homeScreen:
        return PageRouteBuilder(
            settings: settings,
            transitionDuration: const Duration(milliseconds: 800),
            pageBuilder: (_, __, ___) => ChangeNotifierProvider<BottomNavViewModel>(
              create: (context) => BottomNavViewModel(),
              builder: (context, child) => const NavigationMenu(),
            ),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child)
        );

      case AppRoute.phoneNumberScreen:
        final args = settings.arguments as Map<String, dynamic>?;

        return MaterialPageRoute(
          builder: (context) => PhoneNumberScreen(
            pinChange: args?['pinChange'] ?? false,
            forgotPin: args?['forgotPin'] ?? false,
          ),
        );


      case AppRoute.otpVerificationScreen:
        return MaterialPageRoute(builder: (context) => VerifyOTPScreen(otpType: args as String?,));

      case AppRoute.pinSuccessScreen:
        return MaterialPageRoute(builder: (context) => const PinSuccessScreen());

      case AppRoute.accountRegistrationScreen:
        return MaterialPageRoute(builder: (context) => const AccountRegistrationScreen());

      case AppRoute.pinSetupScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(builder: (context) => PinSetupScreen(
          pinChange: args?['pinChange'] ?? false,
          forgotPin: args?['forgotPin'] ?? false,
        ),
        );

      case AppRoute.kycSetupScreen:
        return MaterialPageRoute(builder: (context) => const KYCSetupScreen());

      case AppRoute.transactionInfoScreen:
        return MaterialPageRoute(builder: (context) => const TransferInfoScreen());

      case AppRoute.transferSuccessScreen:
        return MaterialPageRoute(builder: (context) => const TransferSuccessScreen());

      case AppRoute.accountSettingsScreen:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());

      case AppRoute.applyNewLoanScreen:
        return MaterialPageRoute(builder: (context) => const ApplyNewLoanScreen());

      case AppRoute.loanSummaryScreen:
        return MaterialPageRoute(builder: (context) => LoanSummaryScreen(amortize: args as AmortizeModel));

      case AppRoute.loanReviewScreen:
        return MaterialPageRoute(builder: (context) => LoanReviewScreen(loan: args as LoanModel));

      case AppRoute.loanTransactionDetailScreen:
        return MaterialPageRoute(builder: (context) => LoanTransactionDetailScreen(loan: args as LoanModel));

      case AppRoute.topUpWalletScreen:
        return MaterialPageRoute(builder: (context) {
          final String transactionType = settings.arguments as String;
          return TopUpWalletScreen(transactionType: transactionType);
        });


      case AppRoute.selectWalletScreen:
        return MaterialPageRoute(builder: (context) => const SelectWalletScreen());

      case AppRoute.confirmTopUpWalletScreen:
        return MaterialPageRoute(builder: (context) => const ConfirmTopUpWalletScreen());

      case AppRoute.topUpWalletSuccessScreen:
        return MaterialPageRoute(builder: (context) => const TopUpWalletSuccessScreen());

      case AppRoute.nfcScreen:
        return MaterialPageRoute(builder: (context) => const NfcScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        backgroundColor: BDPColors.white,
        body: Center(
          child: Text('Page Not Found!', style: TextStyle(fontSize: 16)),
        ),
      );
    });
  }

  static Future<Object?> pushNamed(BuildContext context, String routeName,
          {Object? arguments}) =>
      Navigator.pushNamed(context, routeName, arguments: arguments);

  static Future<Object?> pushReplacementNamed(
          BuildContext context, String routeName,
          {Object? arguments, Object? result}) =>
      Navigator.pushReplacementNamed(context, routeName,
          arguments: arguments, result: result);

  static Future<Object?> pushNamedAndRemoveUntil(
    BuildContext context,
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        routeName,
        predicate,
        arguments: arguments,
      );

  static void pop(BuildContext context, [Object? result]) =>
      Navigator.pop(context, result);

  static NavigatorState of(BuildContext context, {bool rootNavigator = false}) =>
      Navigator.of(context, rootNavigator: rootNavigator);

  static Future<Object?> popAndPushNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
    Object? result,
  }) =>
      Navigator.popAndPushNamed(
        context,
        routeName,
        arguments: arguments,
        result: result,
      );
}
