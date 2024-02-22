import 'package:bdp_payment_app/src/feature/auth/presentation/signup/phone_number_screen.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/signup/pin_setup_screen.dart';
import 'package:flutter/material.dart';
import '../../src/feature/auth/presentation/login/login_screen.dart';
import '../../src/feature/auth/presentation/signup/account_registration_screen.dart';
import '../../src/feature/auth/presentation/signup/otp_verify_screen.dart';
import '../../src/feature/onboarding/presentation/screens/onboarding_screen.dart';
import '../../src/feature/onboarding/presentation/screens/splash_screen.dart';
import '../../src/feature/home/presentation/screens/navigation_menu.dart';
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
            pageBuilder: (_, __, ___) => const NavigationMenu(),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child)
        );

      case AppRoute.phoneNumberScreen:
        return MaterialPageRoute(builder: (context) => const PhoneNumberScreen());

      case AppRoute.otpVerificationScreen:
        return MaterialPageRoute(builder: (context) => VerifyOTPScreen(otpCode: args as String?,));

      case AppRoute.accountRegistrationScreen:
        return MaterialPageRoute(builder: (context) => const AccountRegistrationScreen());

      case AppRoute.pinSetupScreen:
        return MaterialPageRoute(builder: (context) => PinSetupScreen(pinChange: args as bool?,));

      // case AppRoute.forgotPasswordSuccessScreen:
      //   return MaterialPageRoute(builder: (context) => const ForgotPasswordSuccessScreen());
      //
      // case AppRoute.homeScreen:
      //   return MaterialPageRoute(builder: (context) => ChangeNotifierProvider<BottomNavViewModel>(
      //     create: (context) => BottomNavViewModel(),
      //     builder: (context, child) => const HomeScreen(),
      //   ));
      // case AppRoute.seeAllCategoriesScreen:
      //   return MaterialPageRoute(builder: (context) => const SeeAllCategoriesScreen());
      //
      // case AppRoute.listProductScreen:
      //   return MaterialPageRoute(builder: (context) => const ListProductScreen());
      //
      // case AppRoute.accountSettingsScreen:
      //   return MaterialPageRoute(builder: (context) => const AccountSettingsScreen());
      //
      // case AppRoute.seeAllRentalListeningScreen:
      //   return MaterialPageRoute(builder: (context) => const SeeAllRentalListeningScreen());
      //
      //   case AppRoute.productDescriptionScreen:
      //   return MaterialPageRoute(builder: (context) => const ProductDescriptionScreen());
      //
      // case AppRoute.listedProductsScreen:
      //   return MaterialPageRoute(builder: (context) => ListedProductsScreen(navigateFromListing: args as bool,));
      //
      // case AppRoute.changePassword:
      //   return MaterialPageRoute(builder: (context) => const ChangePasswordScreen());
      //
      // case AppRoute.editProfile:
      //   return MaterialPageRoute(builder: (context) => const EditUserProfile());
      //
      // case AppRoute.notificationScreen:
      //   return MaterialPageRoute(builder: (context) => const NotificationScreen());
      //
      // case AppRoute.supportScreen:
      //   return MaterialPageRoute(builder: (context) => const SupportScreen());
      //
      // case AppRoute.productDetailScreen:
      //   return MaterialPageRoute(builder: (context) => ProductDetailScreen(product: args as ProductModel,));
      //
      // case AppRoute.editListedProductScreen:
      //   return MaterialPageRoute(builder: (context) => EditListedProductScreen(product: args as ProductModel,));

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
